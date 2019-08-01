// Load an interactive environment (IE) from a remote URL
// @param {String} notebook_access_url: the URL embeded in the page and loaded
// function load_notebook(notebook_access_url){
    // When the page has completely loaded...
    // $( document ).ready(function() {
        // Test if we can access the GIE, and if so, execute the function
        // to load the GIE for the user.
        // test_ie_availability(notebook_access_url, function(){
           // _handle_notebook_loading(notebook_access_url);
        // });
    // });
// }
// function _handle_notebook_loading(notebook_access_url){
    // append_notebook(notebook_access_url);
// }

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE interactive_environment SYSTEM "../../interactive_environments.dtd">
<interactive_environment name="HelloWorld">
    <data_sources>
        <data_source>
            <model_class>HistoryDatasetAssociation</model_class>
            <test type="isinstance" test_attr="datatype" result_type="datatype">tabular.Tabular</test>
            <test type="isinstance" test_attr="datatype" result_type="datatype">data.Text</test>
            <to_param param_attr="id">dataset_id</to_param>
        </data_source>
    </data_sources>
    <params>
        <param type="dataset" var_name_in_template="hda" required="true">dataset_id</param>
    </params>
    <entry_point entry_point_type="mako">helloworld.mako</entry_point>
</interactive_environment>
