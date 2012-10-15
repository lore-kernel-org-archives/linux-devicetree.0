From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] dt: add helper function to read u8 & u16 variables & arrays
Date: Mon, 15 Oct 2012 13:36:30 +0530
Message-ID: <CAKohpok5+zPcq3cA4yLiThTkKyYcrdv_g9x-uZ-Smp2x5FyoZg@mail.gmail.com>
References: <425b4bec021bce9a2de49959121907aeede6a0b9.1350064805.git.viresh.kumar@linaro.org>
	<1350287772.10584.178.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1350287772.10584.178.camel@smile>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "spear-devel@list.st.com" <spear-devel@list.st.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 15 October 2012 13:26, Shevchenko, Andriy
<andriy.shevchenko@intel.com> wrote:
> On Fri, 2012-10-12 at 23:31 +0530, Viresh Kumar wrote:

>> +     while (_sz--)                                                   \
>> +             *_out++ = (_type)be32_to_cpup(_val++);                  \
> How about
> *_out++ = (typeof(*_out))...
> ?

:)


diff --git a/drivers/of/base.c b/drivers/of/base.c
index c5a09c2..039e178 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -670,7 +670,7 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 }
 EXPORT_SYMBOL(of_find_node_by_phandle);

-#define of_property_read_array(_np, _pname, _out, _sz, _type)          \
+#define of_property_read_array(_np, _pname, _out, _sz)                 \
        struct property *_prop = of_find_property(_np, _pname, NULL);   \
        const __be32 *_val;                                             \
                                                                        \
@@ -683,7 +683,7 @@ EXPORT_SYMBOL(of_find_node_by_phandle);
                                                                        \
        _val = _prop->value;                                            \
        while (_sz--)                                                   \
-               *_out++ = (_type)be32_to_cpup(_val++);                  \
+               *_out++ = (typeof(*_out))be32_to_cpup(_val++);          \
        return 0;

 /**
@@ -703,7 +703,7 @@ EXPORT_SYMBOL(of_find_node_by_phandle);
 int of_property_read_u8_array(const struct device_node *np,
                        const char *propname, u8 *out_values, size_t sz)
 {
-       of_property_read_array(np, propname, out_values, sz, u8);
+       of_property_read_array(np, propname, out_values, sz);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u8_array);

@@ -724,7 +724,7 @@ EXPORT_SYMBOL_GPL(of_property_read_u8_array);
 int of_property_read_u16_array(const struct device_node *np,
                        const char *propname, u16 *out_values, size_t sz)
 {
-       of_property_read_array(np, propname, out_values, sz, u16);
+       of_property_read_array(np, propname, out_values, sz);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u16_array);

@@ -747,7 +747,7 @@ int of_property_read_u32_array(const struct device_node *np,
                               const char *propname, u32 *out_values,
                               size_t sz)
 {
-       of_property_read_array(np, propname, out_values, sz, u32);
+       of_property_read_array(np, propname, out_values, sz);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u32_array);
