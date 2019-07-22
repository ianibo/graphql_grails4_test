package widgetservice

import graphql.schema.DataFetcher
import graphql.schema.DataFetchingEnvironment
import org.grails.gorm.graphql.entity.dsl.GraphQLMapping
import org.grails.gorm.graphql.fetcher.impl.PaginatedEntityDataFetcher
import grails.gorm.DetachedCriteria

class Widget {

  String name
  String description

  static graphql = GraphQLMapping.lazy {
    query('widgetQuery', pagedResult(Widget)) {
      argument('name', String)
      // Ultimately send back a grails.gorm.PagedResultList
      dataFetcher(new PaginatedEntityDataFetcher<Widget>(Widget.gormPersistentEntity) {
        @Override
        protected DetachedCriteria buildCriteria(DataFetchingEnvironment environment) {
          // .where creates a detached criteria - see info here:
          // http://gorm.grails.org/6.0.x/hibernate/manual/index.html#whereQueries
          Widget.where { name =~ environment.getArgument('name')?:'%' }
        }
      })
    }
  }


  static constraints = {
  }
}