!function(){var e=Handlebars.template,t=Handlebars.templates=Handlebars.templates||{};t.rteForm=e({compiler:[6,">= 2.0.0-beta.1"],main:function(e,t,a,r){var n,i="function",l=t.helperMissing,s=this.escapeExpression;return'<div style="width:650px;">\r\n        <textarea id="rteField" style="width:99%;height:400px;">'+s((n=null!=(n=t.textarea||(null!=e?e.textarea:e))?n:l,typeof n===i?n.call(e,{name:"textarea",hash:{},data:r}):n))+"</textarea>\r\n    </div>"},useData:!0})}();