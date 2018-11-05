Return-Path: <SRS0=MwFY=NQ=gmail.com=jaewon02.kim@kernel.org>
Subject: Re: [PATCH] of/platform: Support dynamic device tree on AMBA bus
References: <1540485597-12240-1-git-send-email-jaewon02.kim@samsung.com>
 <CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com>
From: Jaewon Kim <jaewon02.kim@gmail.com>
Message-ID: <1f7b35fd-7900-0c48-50a2-4f84481a208c@gmail.com>
Date: Tue, 6 Nov 2018 01:49:05 +0900
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------A3C46CC8FC26F9F0AB4DD640"
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, jaewon02.kim@samsung.com, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------A3C46CC8FC26F9F0AB4DD640
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob,

On 11/1/18 3:31 AM, Rob Herring wrote:
> On Thu, Oct 25, 2018 at 11:40 AM Jaewon Kim <jaewon02.kim@gmail.com> wrote:
>> This patch supports dynamic device-tree for AMBA device.
>> The AMBA device must be registered on the AMBA bus, not the platform bus.
> I'm not convinced we should even support this. There's a limited
> number of AMBA devices. They would almost certainly be on-chip and
> static. I suppose in theory you could have them in an FPGA, but
> generally the FPGA vendors have their own IP blocks and don't use ARM
> Primecell IP. So what is the usecase?

In my case, our target has GPIO output pin, like RPI board. And I want 
to use dt-overlay to change GPIO alternative function. But, I found that 
AMBA device not work with dt-overlay. Most AMBA devices do not require 
dynamic device-tree. But, pl022(serial) and pl011(SPI) needs dynamic 
device-tree.

>
>> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> Your author and S-o-b emails should match.
Okay, I will change it my gmail.
>
>> ---
>>   drivers/of/platform.c | 93 ++++++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 73 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 04ad312..b9ac105 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -286,6 +286,22 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>          of_node_clear_flag(node, OF_POPULATED);
>>          return NULL;
>>   }
>> +
>> +/**
>> + * of_find_amba_device_by_node - Find the amba_device associated with a node
>> + * @np: Pointer to device tree node
>> + *
>> + * Returns amba_device pointer, or NULL if not found
>> + */
>> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
>> +{
>> +       struct device *dev;
>> +
>> +       dev = bus_find_device(&amba_bustype, NULL, np, of_dev_node_match);
>> +       return dev ? to_amba_device(dev) : NULL;
>> +}
>> +EXPORT_SYMBOL(of_find_amba_device_by_node);
> I would prefer we add (or change the platform device version) an
> of_find_device_by_node which can be extended to different bus types.

The returned type is different. of_find_device_by_node () returns 
'struct platform_device *', and of_find_amba_device_by_node() returns 
'struct amba_device *'. To make this the same, It need to modify return 
value of of_find_device_by_node() function or merge amba_device to 
platform_device.of_find_device_by_node() function is a widely used 
kernel source and it requires a lot of modifications.I think it would be 
simpler to make of_find_amba_device_by_node().

>
>> +
>>   #else /* CONFIG_ARM_AMBA */
>>   static struct amba_device *of_amba_device_create(struct device_node *node,
>>                                                   const char *bus_id,
>> @@ -294,6 +310,12 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>>   {
>>          return NULL;
>>   }
>> +
>> +struct amba_device *of_find_amba_device_by_node(struct device_node *np)
>> +{
>> +       return NULL;
>> +}
>> +EXPORT_SYMBOL(of_find_amba_device_by_node);
>>   #endif /* CONFIG_ARM_AMBA */
>>
>>   /**
>> @@ -665,6 +687,7 @@ static int of_platform_notify(struct notifier_block *nb,
>>   {
>>          struct of_reconfig_data *rd = arg;
>>          struct platform_device *pdev_parent, *pdev;
>> +       struct amba_device *adev_p, *adev;
>>          bool children_left;
>>
>>          switch (of_reconfig_get_state_change(action, rd)) {
>> @@ -677,17 +700,34 @@ static int of_platform_notify(struct notifier_block *nb,
>>                  if (of_node_check_flag(rd->dn, OF_POPULATED))
>>                          return NOTIFY_OK;
>>
>> -               /* pdev_parent may be NULL when no bus platform device */
>> -               pdev_parent = of_find_device_by_node(rd->dn->parent);
>> -               pdev = of_platform_device_create(rd->dn, NULL,
>> -                               pdev_parent ? &pdev_parent->dev : NULL);
>> -               of_dev_put(pdev_parent);
>> -
>> -               if (pdev == NULL) {
>> -                       pr_err("%s: failed to create for '%pOF'\n",
>> -                                       __func__, rd->dn);
>> -                       /* of_platform_device_create tosses the error code */
>> -                       return notifier_from_errno(-EINVAL);
>> +               if (of_device_is_compatible(rd->dn, "arm,primecell")) {
>> +                       /* adev_p may be NULL when no bus amba device */
>> +                       adev_p = of_find_amba_device_by_node(rd->dn->parent);
> An amba_device can't ever have a parent that's an amba_device. The
> parent of an amba_device is typically a platform_device for a
> 'simple-bus'.

You are right. there is no parent device .
I will remove it in v2.

>
>> +                       adev = of_amba_device_create(rd->dn, NULL, NULL,
>> +                                       adev_p ? &adev_p->dev : NULL);
>> +
>> +                       if (adev_p)
>> +                               put_device(&adev_p->dev);
>> +
>> +                       if (adev == NULL) {
>> +                               pr_err("%s: failed to create for '%s'\n",
>> +                                               __func__, rd->dn->full_name);
>> +                               /* of_amba_device_create tosses the error */
>> +                               return notifier_from_errno(-EINVAL);
>> +                       }
>> +               } else {
>> +                       /* pdev_parent may be NULL when no bus platform device*/
>> +                       pdev_parent = of_find_device_by_node(rd->dn->parent);
>> +                       pdev = of_platform_device_create(rd->dn, NULL,
>> +                                       pdev_parent ? &pdev_parent->dev : NULL);
>> +                       of_dev_put(pdev_parent);
>> +
>> +                       if (pdev == NULL) {
>> +                               pr_err("%s: failed to create for '%pOF'\n",
>> +                                               __func__, rd->dn);
>> +                               /* of_platform_device_create tosses the error */
>> +                               return notifier_from_errno(-EINVAL);
>> +                       }
> This all pretty much duplicates what of_platform_bus_create() does and
> we should use it here rather than have another copy. Plus what about
> handling of any child devices (in the platform device case).

The code looks duplicated, but processed type of variable is 
different.(struct amba_device, struct platform_device)

>
>>                  }
>>                  break;
>>
>> @@ -698,15 +738,28 @@ static int of_platform_notify(struct notifier_block *nb,
>>                          return NOTIFY_OK;
>>
>>                  /* find our device by node */
>> -               pdev = of_find_device_by_node(rd->dn);
>> -               if (pdev == NULL)
>> -                       return NOTIFY_OK;       /* no? not meant for us */
>> -
>> -               /* unregister takes one ref away */
>> -               of_platform_device_destroy(&pdev->dev, &children_left);
>> -
>> -               /* and put the reference of the find */
>> -               of_dev_put(pdev);
>> +               if (of_device_is_compatible(rd->dn, "arm,primecell")) {
>> +                       adev = of_find_amba_device_by_node(rd->dn);
> With the above suggested function returning a struct device for the
> node, you can get rid of the if {} else {}.

Okay, i will remove duplicated code.


>
>> +                       if (adev == NULL)
>> +                               return NOTIFY_OK; /* no? not meant for us */
>> +
>> +                       /* unregister takes one ref away */
>> +                       of_platform_device_destroy(&adev->dev, &children_left);
>> +
>> +                       /* and put the reference of the find */
>> +                       if (adev)
>> +                               put_device(&adev->dev);
>> +               } else {
>> +                       pdev = of_find_device_by_node(rd->dn);
>> +                       if (pdev == NULL)
>> +                               return NOTIFY_OK; /* no? not meant for us */
>> +
>> +                       /* unregister takes one ref away */
>> +                       of_platform_device_destroy(&pdev->dev, &children_left);
>> +
>> +                       /* and put the reference of the find */
>> +                       of_dev_put(pdev);
>> +               }
>>                  break;
>>          }
>>
>> --
>> 2.7.4
>>

--------------A3C46CC8FC26F9F0AB4DD640
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Rob,<br>
    </p>
    <div class="moz-cite-prefix">On 11/1/18 3:31 AM, Rob Herring wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Oct 25, 2018 at 11:40 AM Jaewon Kim <a class="moz-txt-link-rfc2396E" href="mailto:jaewon02.kim@gmail.com">&lt;jaewon02.kim@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This patch supports dynamic device-tree for AMBA device.
The AMBA device must be registered on the AMBA bus, not the platform bus.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not convinced we should even support this. There's a limited
number of AMBA devices. They would almost certainly be on-chip and
static. I suppose in theory you could have them in an FPGA, but
generally the FPGA vendors have their own IP blocks and don't use ARM
Primecell IP. So what is the usecase?</pre>
    </blockquote>
    <pre><tt>In my case, our target has GPIO output pin, like RPI board. And I want to use
dt-overlay to change GPIO alternative function. But, I found that AMBA device not work with dt-overlay.

Most AMBA devices do not require dynamic device-tree.
But, pl022(serial) and pl011(SPI) needs dynamic device-tree.</tt></pre>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Jaewon Kim <a class="moz-txt-link-rfc2396E" href="mailto:jaewon02.kim@samsung.com">&lt;jaewon02.kim@samsung.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Your author and S-o-b emails should match.</pre>
    </blockquote>
    Okay, I will change it my gmail.<br>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 drivers/of/platform.c | 93 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 04ad312..b9ac105 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -286,6 +286,22 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
        of_node_clear_flag(node, OF_POPULATED);
        return NULL;
 }
+
+/**
+ * of_find_amba_device_by_node - Find the amba_device associated with a node
+ * @np: Pointer to device tree node
+ *
+ * Returns amba_device pointer, or NULL if not found
+ */
+struct amba_device *of_find_amba_device_by_node(struct device_node *np)
+{
+       struct device *dev;
+
+       dev = bus_find_device(&amp;amba_bustype, NULL, np, of_dev_node_match);
+       return dev ? to_amba_device(dev) : NULL;
+}
+EXPORT_SYMBOL(of_find_amba_device_by_node);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would prefer we add (or change the platform device version) an
of_find_device_by_node which can be extended to different bus types.</pre>
    </blockquote>
    <pre><span style="color: rgb(33, 33, 33); font-family: &quot;Apple SD Gothic Neo&quot;, arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><tt>The returned type is different. of_find_device_by_node () returns 'struct platform_device *', </tt><tt>
</tt><tt>and of_find_amba_device_by_node() returns 'struct amba_device *'. </tt><tt>
</tt><tt>
</tt><tt>To make this the same, It need to modify return value of of_find_device_by_node() function or merge amba_device to platform_device.</tt><tt>
</tt><tt>of_find_device_by_node() function is a widely used kernel source and it requires a lot of modifications.</tt><tt>
</tt><tt>I think it would be simpler to make of_find_amba_device_by_node().</tt>
</span></pre>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 #else /* CONFIG_ARM_AMBA */
 static struct amba_device *of_amba_device_create(struct device_node *node,
                                                 const char *bus_id,
@@ -294,6 +310,12 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 {
        return NULL;
 }
+
+struct amba_device *of_find_amba_device_by_node(struct device_node *np)
+{
+       return NULL;
+}
+EXPORT_SYMBOL(of_find_amba_device_by_node);
 #endif /* CONFIG_ARM_AMBA */

 /**
@@ -665,6 +687,7 @@ static int of_platform_notify(struct notifier_block *nb,
 {
        struct of_reconfig_data *rd = arg;
        struct platform_device *pdev_parent, *pdev;
+       struct amba_device *adev_p, *adev;
        bool children_left;

        switch (of_reconfig_get_state_change(action, rd)) {
@@ -677,17 +700,34 @@ static int of_platform_notify(struct notifier_block *nb,
                if (of_node_check_flag(rd-&gt;dn, OF_POPULATED))
                        return NOTIFY_OK;

-               /* pdev_parent may be NULL when no bus platform device */
-               pdev_parent = of_find_device_by_node(rd-&gt;dn-&gt;parent);
-               pdev = of_platform_device_create(rd-&gt;dn, NULL,
-                               pdev_parent ? &amp;pdev_parent-&gt;dev : NULL);
-               of_dev_put(pdev_parent);
-
-               if (pdev == NULL) {
-                       pr_err("%s: failed to create for '%pOF'\n",
-                                       __func__, rd-&gt;dn);
-                       /* of_platform_device_create tosses the error code */
-                       return notifier_from_errno(-EINVAL);
+               if (of_device_is_compatible(rd-&gt;dn, "arm,primecell")) {
+                       /* adev_p may be NULL when no bus amba device */
+                       adev_p = of_find_amba_device_by_node(rd-&gt;dn-&gt;parent);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
An amba_device can't ever have a parent that's an amba_device. The
parent of an amba_device is typically a platform_device for a
'simple-bus'.</pre>
    </blockquote>
    <pre>You are right. there is no parent device .
I will remove it in v2.
</pre>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+                       adev = of_amba_device_create(rd-&gt;dn, NULL, NULL,
+                                       adev_p ? &amp;adev_p-&gt;dev : NULL);
+
+                       if (adev_p)
+                               put_device(&amp;adev_p-&gt;dev);
+
+                       if (adev == NULL) {
+                               pr_err("%s: failed to create for '%s'\n",
+                                               __func__, rd-&gt;dn-&gt;full_name);
+                               /* of_amba_device_create tosses the error */
+                               return notifier_from_errno(-EINVAL);
+                       }
+               } else {
+                       /* pdev_parent may be NULL when no bus platform device*/
+                       pdev_parent = of_find_device_by_node(rd-&gt;dn-&gt;parent);
+                       pdev = of_platform_device_create(rd-&gt;dn, NULL,
+                                       pdev_parent ? &amp;pdev_parent-&gt;dev : NULL);
+                       of_dev_put(pdev_parent);
+
+                       if (pdev == NULL) {
+                               pr_err("%s: failed to create for '%pOF'\n",
+                                               __func__, rd-&gt;dn);
+                               /* of_platform_device_create tosses the error */
+                               return notifier_from_errno(-EINVAL);
+                       }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This all pretty much duplicates what of_platform_bus_create() does and
we should use it here rather than have another copy. Plus what about
handling of any child devices (in the platform device case).
</pre>
    </blockquote>
    <p><span style="color: rgb(33, 33, 33); font-family: &quot;Apple SD Gothic Neo&quot;, arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">The code looks duplicated, but processed type of variable is different.(struct amba_device, struct platform_device)</span></p>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">                }
                break;

@@ -698,15 +738,28 @@ static int of_platform_notify(struct notifier_block *nb,
                        return NOTIFY_OK;

                /* find our device by node */
-               pdev = of_find_device_by_node(rd-&gt;dn);
-               if (pdev == NULL)
-                       return NOTIFY_OK;       /* no? not meant for us */
-
-               /* unregister takes one ref away */
-               of_platform_device_destroy(&amp;pdev-&gt;dev, &amp;children_left);
-
-               /* and put the reference of the find */
-               of_dev_put(pdev);
+               if (of_device_is_compatible(rd-&gt;dn, "arm,primecell")) {
+                       adev = of_find_amba_device_by_node(rd-&gt;dn);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
With the above suggested function returning a struct device for the
node, you can get rid of the if {} else {}.</pre>
    </blockquote>
    <p>Okay, i will remove duplicated code.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAL_Jsq+V8HmmHV98Wsq-Kec2NXgY4ih+KKEVd-1nZbCoLUPe7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+                       if (adev == NULL)
+                               return NOTIFY_OK; /* no? not meant for us */
+
+                       /* unregister takes one ref away */
+                       of_platform_device_destroy(&amp;adev-&gt;dev, &amp;children_left);
+
+                       /* and put the reference of the find */
+                       if (adev)
+                               put_device(&amp;adev-&gt;dev);
+               } else {
+                       pdev = of_find_device_by_node(rd-&gt;dn);
+                       if (pdev == NULL)
+                               return NOTIFY_OK; /* no? not meant for us */
+
+                       /* unregister takes one ref away */
+                       of_platform_device_destroy(&amp;pdev-&gt;dev, &amp;children_left);
+
+                       /* and put the reference of the find */
+                       of_dev_put(pdev);
+               }
                break;
        }

--
2.7.4

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------A3C46CC8FC26F9F0AB4DD640--
