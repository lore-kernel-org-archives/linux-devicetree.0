Return-Path: <varkabhadram@gmail.com>
Message-ID: <54CA59F1.3060008@gmail.com>
Date: Thu, 29 Jan 2015 21:34:01 +0530
From: Varka Bhadram <varkabhadram@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH v10 2/2] tty/serial: Add Spreadtrum sc9836-uart driver
 support
References: <sc9836-serial-v10> <1422443324-25082-1-git-send-email-chunyan.zhang@spreadtrum.com> <1422443324-25082-3-git-send-email-chunyan.zhang@spreadtrum.com> <54CA5128.8050500@gmail.com> <54CA568E.6080306@hurleysoftware.com>
In-Reply-To: <54CA568E.6080306@hurleysoftware.com>
Content-Type: multipart/alternative;
 boundary="------------020609050402050304080003"
To: Peter Hurley <peter@hurleysoftware.com>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>, gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gnomes@lxorguk.ukuu.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org, jslaby@suse.cz, heiko@sntech.de, jason@lakedaemon.net, florian.vaussard@epfl.ch, andrew@lunn.ch, hytszk@gmail.com, antonynpavlov@gmail.com, shawn.guo@linaro.org, orsonzhai@gmail.com, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, lanqing.liu@spreadtrum.com, zhang.lyra@gmail.com, wei.qiao@spreadtrum.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020609050402050304080003
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peter,

On Thursday 29 January 2015 09:19 PM, Peter Hurley wrote:
> Hi Varka,
>
> On 01/29/2015 10:26 AM, Varka Bhadram wrote:
>> Hi,
>>
>> On Wednesday 28 January 2015 04:38 PM, Chunyan Zhang wrote:
>>> Add a full sc9836-uart driver for SC9836 SoC which is based on the
>>> spreadtrum sharkl64 platform.
>>> This driver also support earlycon.
>>>
>>> Originally-by: Lanqing Liu <lanqing.liu@spreadtrum.com>
>>> Signed-off-by: Orson Zhai <orson.zhai@spreadtrum.com>
>>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>> Reviewed-by: Peter Hurley <peter@hurleysoftware.com>
>>> ---
>>>    drivers/tty/serial/Kconfig       |   18 +
>>>    drivers/tty/serial/Makefile      |    1 +
>>>    drivers/tty/serial/sprd_serial.c |  793 ++++++++++++++++++++++++++++++++++++++
>>>    include/uapi/linux/serial_core.h |    3 +
>>>    4 files changed, 815 insertions(+)
>>>    create mode 100644 drivers/tty/serial/sprd_serial.c
>>>
>> (...)
>>
>>> +static int sprd_probe(struct platform_device *pdev)
>>> +{
>>> +    struct resource *res;
>>> +    struct uart_port *up;
>>> +    struct clk *clk;
>>> +    int irq;
>>> +    int index;
>>> +    int ret;
>>> +
>>> +    for (index = 0; index < ARRAY_SIZE(sprd_port); index++)
>>> +        if (sprd_port[index] == NULL)
>>> +            break;
>>> +
>>> +    if (index == ARRAY_SIZE(sprd_port))
>>> +        return -EBUSY;
>>> +
>>> +    index = sprd_probe_dt_alias(index, &pdev->dev);
>>> +
>>> +    sprd_port[index] = devm_kzalloc(&pdev->dev,
>>> +        sizeof(*sprd_port[index]), GFP_KERNEL);
>>> +    if (!sprd_port[index])
>>> +        return -ENOMEM;
>>> +
>>> +    up = &sprd_port[index]->port;
>>> +    up->dev = &pdev->dev;
>>> +    up->line = index;
>>> +    up->type = PORT_SPRD;
>>> +    up->iotype = SERIAL_IO_PORT;
>>> +    up->uartclk = SPRD_DEF_RATE;
>>> +    up->fifosize = SPRD_FIFO_SIZE;
>>> +    up->ops = &serial_sprd_ops;
>>> +    up->flags = UPF_BOOT_AUTOCONF;
>>> +
>>> +    clk = devm_clk_get(&pdev->dev, NULL);
>>> +    if (!IS_ERR(clk))
>>> +        up->uartclk = clk_get_rate(clk);
>>> +
>>> +    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    if (!res) {
>>> +        dev_err(&pdev->dev, "not provide mem resource\n");
>>> +        return -ENODEV;
>>> +    }
>> This check is not required. It will be done by devm_ioremap_resource()
> I disagree. devm_ioremap_resource() interprets the NULL resource as
> a bad parameter and returns -EINVAL which is then forwarded as the
> return value from the probe.
>
> -ENODEV is the correct return value from the probe if the expected
> resource is not available (either because it doesn't exist or was already
> claimed by another driver).

Check on the resource happening with evm_ioremap_resource.

Not necessary to check multiple times.

I did series for all the drivers. see [1]

[1]:  https://lkml.org/lkml/2014/11/3/986  <https://lkml.org/lkml/2014/11/3/986>

> Regards,
> Peter Hurley
>
>>> +    up->mapbase = res->start;
>>> +    up->membase = devm_ioremap_resource(&pdev->dev, res);
>>> +    if (IS_ERR(up->membase))
>>> +        return PTR_ERR(up->membase);
>>> +
>>>

-- 
Thanks,
Varka Bhadram.


--------------020609050402050304080003
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <pre>Hi Peter,
</pre>
    <div class="moz-cite-prefix">On Thursday 29 January 2015 09:19 PM,
      Peter Hurley wrote:<br>
    </div>
    <blockquote cite="mid:54CA568E.6080306@hurleysoftware.com"
      type="cite">
      <pre wrap="">Hi Varka,

On 01/29/2015 10:26 AM, Varka Bhadram wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi,

On Wednesday 28 January 2015 04:38 PM, Chunyan Zhang wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">Add a full sc9836-uart driver for SC9836 SoC which is based on the
spreadtrum sharkl64 platform.
This driver also support earlycon.

Originally-by: Lanqing Liu <a class="moz-txt-link-rfc2396E" href="mailto:lanqing.liu@spreadtrum.com">&lt;lanqing.liu@spreadtrum.com&gt;</a>
Signed-off-by: Orson Zhai <a class="moz-txt-link-rfc2396E" href="mailto:orson.zhai@spreadtrum.com">&lt;orson.zhai@spreadtrum.com&gt;</a>
Signed-off-by: Chunyan Zhang <a class="moz-txt-link-rfc2396E" href="mailto:chunyan.zhang@spreadtrum.com">&lt;chunyan.zhang@spreadtrum.com&gt;</a>
Acked-by: Arnd Bergmann <a class="moz-txt-link-rfc2396E" href="mailto:arnd@arndb.de">&lt;arnd@arndb.de&gt;</a>
Reviewed-by: Peter Hurley <a class="moz-txt-link-rfc2396E" href="mailto:peter@hurleysoftware.com">&lt;peter@hurleysoftware.com&gt;</a>
---
  drivers/tty/serial/Kconfig       |   18 +
  drivers/tty/serial/Makefile      |    1 +
  drivers/tty/serial/sprd_serial.c |  793 ++++++++++++++++++++++++++++++++++++++
  include/uapi/linux/serial_core.h |    3 +
  4 files changed, 815 insertions(+)
  create mode 100644 drivers/tty/serial/sprd_serial.c

</pre>
        </blockquote>
        <pre wrap="">(...)

</pre>
        <blockquote type="cite">
          <pre wrap="">+static int sprd_probe(struct platform_device *pdev)
+{
+    struct resource *res;
+    struct uart_port *up;
+    struct clk *clk;
+    int irq;
+    int index;
+    int ret;
+
+    for (index = 0; index &lt; ARRAY_SIZE(sprd_port); index++)
+        if (sprd_port[index] == NULL)
+            break;
+
+    if (index == ARRAY_SIZE(sprd_port))
+        return -EBUSY;
+
+    index = sprd_probe_dt_alias(index, &amp;pdev-&gt;dev);
+
+    sprd_port[index] = devm_kzalloc(&amp;pdev-&gt;dev,
+        sizeof(*sprd_port[index]), GFP_KERNEL);
+    if (!sprd_port[index])
+        return -ENOMEM;
+
+    up = &amp;sprd_port[index]-&gt;port;
+    up-&gt;dev = &amp;pdev-&gt;dev;
+    up-&gt;line = index;
+    up-&gt;type = PORT_SPRD;
+    up-&gt;iotype = SERIAL_IO_PORT;
+    up-&gt;uartclk = SPRD_DEF_RATE;
+    up-&gt;fifosize = SPRD_FIFO_SIZE;
+    up-&gt;ops = &amp;serial_sprd_ops;
+    up-&gt;flags = UPF_BOOT_AUTOCONF;
+
+    clk = devm_clk_get(&amp;pdev-&gt;dev, NULL);
+    if (!IS_ERR(clk))
+        up-&gt;uartclk = clk_get_rate(clk);
+
+    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+    if (!res) {
+        dev_err(&amp;pdev-&gt;dev, "not provide mem resource\n");
+        return -ENODEV;
+    }
</pre>
        </blockquote>
        <pre wrap="">
This check is not required. It will be done by devm_ioremap_resource()
</pre>
      </blockquote>
      <pre wrap="">
I disagree. devm_ioremap_resource() interprets the NULL resource as
a bad parameter and returns -EINVAL which is then forwarded as the
return value from the probe.

-ENODEV is the correct return value from the probe if the expected
resource is not available (either because it doesn't exist or was already
claimed by another driver).
</pre>
    </blockquote>
    <pre>Check on the resource happening with evm_ioremap_resource.

Not necessary to check multiple times.

I did series for all the drivers. see [1]

[1]:<a href="https://lkml.org/lkml/2014/11/3/986"> https://lkml.org/lkml/2014/11/3/986</a>
</pre>
    <blockquote cite="mid:54CA568E.6080306@hurleysoftware.com"
      type="cite">
      <pre wrap="">
Regards,
Peter Hurley

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="">+    up-&gt;mapbase = res-&gt;start;
+    up-&gt;membase = devm_ioremap_resource(&amp;pdev-&gt;dev, res);
+    if (IS_ERR(up-&gt;membase))
+        return PTR_ERR(up-&gt;membase);
+

</pre>
        </blockquote>
        <pre wrap="">
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Varka Bhadram.</pre>
  </body>
</html>

--------------020609050402050304080003--
