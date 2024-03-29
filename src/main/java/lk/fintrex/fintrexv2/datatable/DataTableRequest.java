package lk.fintrex.fintrexv2.datatable;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class DataTableRequest {

    private int draw;
    private List<Column> columns;
    private List<Order> order;
    private int start;
    private int length;
    private Search search;
    @JsonProperty(required = false)
    private String data;
    @JsonProperty(required = false)
    private String filter;
    @JsonProperty(required = false)
    private Integer type;

//    public String get(String data) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class Search {

        private String value;
        private boolean regex;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class Column {

        private String data;
        private String name;
        private boolean searchable;
        private boolean orderable;
        private Search search;

    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class Order {

        private int column;
        private String dir;

    }
}
