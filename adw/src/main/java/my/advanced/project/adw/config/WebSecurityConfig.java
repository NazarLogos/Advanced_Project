package my.advanced.project.adw.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import my.advanced.project.adw.security.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackageClasses=CustomUserDetailsService.class)
public class WebSecurityConfig extends  WebSecurityConfigurerAdapter {
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Bean(name="passwordEncoder")
	public PasswordEncoder passwordEncoder(){
		return new BCryptPasswordEncoder();
	}
	
	
	public void configAuthentification (AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/home").access("hasRole('ROLE_USER')  or hasRole('ROLE_ADMIN')")
		.antMatchers("/buckets").access("hasRole('ROLE_USER')")
		.antMatchers("/create-magazine").access("hasRole('ROLE_ADMIN')")
		.anyRequest().permitAll().and()
				/*
				 * .antMatchers("/").permitAll()
				 * .antMatchers("/home").access("hasRole('ROLE_USER')").anyRequest().permitAll()
				 * .and()
				 */
		
		.formLogin().loginPage("/login")
		.defaultSuccessUrl("/home").usernameParameter("email").passwordParameter("password").and()
		.logout().logoutSuccessUrl("/login?logout").and()
		.exceptionHandling().accessDeniedPage("/403").and()
		.csrf();
	}
}
