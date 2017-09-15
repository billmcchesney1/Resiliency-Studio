/*******************************************************************************
 *   BSD License
 *    
 *   Copyright (c) 2017, AT&T Intellectual Property.  All other rights reserved.
 *    
 *   Redistribution and use in source and binary forms, with or without modification, are permitted
 *   provided that the following conditions are met:
 *    
 *   1. Redistributions of source code must retain the above copyright notice, this list of conditions
 *      and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice, this list of
 *      conditions and the following disclaimer in the documentation and/or other materials provided
 *      with the distribution.
 *   3. All advertising materials mentioning features or use of this software must display the
 *      following acknowledgement:  This product includes software developed by the AT&T.
 *   4. Neither the name of AT&T nor the names of its contributors may be used to endorse or
 *      promote products derived from this software without specific prior written permission.
 *    
 *   THIS SOFTWARE IS PROVIDED BY AT&T INTELLECTUAL PROPERTY ''AS IS'' AND ANY EXPRESS OR
 *   IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 *   SHALL AT&T INTELLECTUAL PROPERTY BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 *   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  LOSS OF USE, DATA, OR PROFITS;
 *   OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *   ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 *   DAMAGE.
 *******************************************************************************/
package com.att.tta.rs.data.es.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import com.att.tta.rs.model.MonkeyStrategy;
import com.att.tta.rs.model.MonkeyType;
/**
 * This class provides query implementation for MonkeyStrategy repository.
 * @author mb6872
 *
 */
@Repository
public interface MonkeyStrategyRepository extends ElasticsearchRepository<MonkeyStrategy, String> {

	Long countByTeamName(String teamName);

	Page<MonkeyStrategy> findByMonkeyType(String name, Pageable pageable);

	@Query("{\"bool\" : {\"must\" : {\"term\" : {\"teamName\" : \"?0\"}}}}")
	Page<MonkeyStrategy> findByTeamName(String teamName, Pageable pageable);

	@Query("{\"bool\" : {\"must\" : {\"term\" : {\"monkeyStrategyName\" : \"?0\"}}}}")
	Iterable<MonkeyStrategy> findAllByMonkeyStrategyName(String monkeyStrategyName);
	
	@Query("{\"bool\" : {\"must\" : [ {\"term\" : {\"monkeyStrategyName\" : \"?0\"}}  , {\"term\" : {\"teamName\" : \"?1\"}}    ] }}")
	Page<MonkeyStrategy> findByMonkeyStrategyNameAndTeamName(String monkeyStrategyName, String teamName,
			Pageable pageable);

	@Query("{\"bool\" : {\"must\" : [ {\"term\" : {\"monkeyStrategyName\" : \"?0\"}}  , {\"term\" : {\"teamName\" : \"?1\"}}    ] }}")
	MonkeyStrategy findByMonkeyStrategyNameAndTeamName(String monkeyStrategyName, String teamName);

	MonkeyStrategy findByMonkeyStrategyNameAndTeamNameAndMonkeyStrategyVersion(String monkeyStrategyName,
			String teamName, String monkeyStrategyVersion);

	Iterable<MonkeyStrategy> findByMonkeyTypeAndMonkeyStrategyNameAndDefaultFlagAndTeamName(MonkeyType monkeyType,
			String monkeyStrategyName, String defaultFlag, String teamName);

	Iterable<MonkeyStrategy> findByMonkeyTypeAndMonkeyStrategyNameAndDefaultFlagAndTeamName(String monkeyType,
			String monkeyStrategyName, String defaultFlag, String teamName);
	
	Iterable<MonkeyStrategy> findByMonkeyTypeAndMonkeyStrategyNameAndMonkeyStrategyVersionAndTeamName(
			MonkeyType monkeyType, String monkeyStrategyName, String version, String teamName);
	
	
	Iterable<MonkeyStrategy> findByMonkeyTypeAndMonkeyStrategyNameAndMonkeyStrategyVersionAndTeamName(
			String monkeyType, String monkeyStrategyName, String version, String teamName);
	
	Iterable<MonkeyStrategy> findByMonkeyTypeAndMonkeyStrategyNameAndTeamName(
			String monkeyType, String monkeyStrategyName, String teamName);
	
	List<MonkeyStrategy> findByOsTypeAndDefaultFlagAndGenericAndFlavorAndFailureCategoryAndFailureSubCategory(String osType, String defaultFlag, String generic, String flavor, String failureCateogry, String failureSubCategory);

}
