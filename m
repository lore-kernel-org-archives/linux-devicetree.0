Return-Path: <SRS0=ASFM=SR=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <1e2bf23d-db39-0d1d-0bcc-6d9cd2935a82@cogentembedded.com> <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF82CE76E9.E6395EF7-ON482583DD.000E37D7-482583DD.000E5077@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 15 Apr 2019 10:36:20 +0800
Content-Type: multipart/alternative; boundary="=_alternative 000E5076482583DD_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 000E5076482583DD_=
Content-Type: text/plain; charset="US-ASCII"


Hello,

> Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller 
driver
> 
> On 04/13/2019 07:38 PM, Sergei Shtylyov wrote:
> 
> >> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> >>
> >> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > [...]
> >> diff --git a/drivers/spi/spi-renesas-rpc.c 
b/drivers/spi/spi-renesas-rpc.c
> >> new file mode 100644
> >> index 0000000..037f273
> >> --- /dev/null
> >> +++ b/drivers/spi/spi-renesas-rpc.c
> > [...]
> >> +static int rpc_spi_probe(struct platform_device *pdev)
> >> +{
> >> +   struct spi_controller *ctlr;
> >> +   struct rpc_mfd *rpc_mfd = dev_get_drvdata(pdev->dev.parent);
> >> +   struct rpc_spi *rpc;
> >> +   int ret;
> >> +
> >> +   ctlr = spi_alloc_master(&pdev->dev, sizeof(*rpc));
> >> +   if (!ctlr)
> >> +      return -ENOMEM;
> >> +
> >> +   platform_set_drvdata(pdev, ctlr);
> >> +
> >> +   rpc = spi_controller_get_devdata(ctlr);
> >> +
> >> +   ctlr->dev.of_node = pdev->dev.of_node;
> > [...]
> >> +
> >> +   pm_runtime_enable(&pdev->dev);
> >> +   ctlr->auto_runtime_pm = true;
> > 
> >    I think this line no longer works as expected with the new 
> probing scheme.
> > Have you tested reading? v8 patch still works while v9 patches 
> hang on doing:
> > 
> > $ cat /dev/mtd<n>...
> 
>    Sorry, 'od -x', not 'cat'.
> 

root@draak:/# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00040000 00001000 "Bank 1 - Boot parameter"
mtd1: 00140000 00001000 "Bank 1 - Loader-BL2"
mtd2: 00040000 00001000 "Bank 1 - Certification"
mtd3: 00080000 00001000 "Bank 1 - ARM Trusted FW"
mtd4: 00400000 00001000 "Bank 1 - Reserved-1"
mtd5: 00300000 00001000 "Bank 1 - U-Boot"
mtd6: 00200000 00001000 "Bank 1 - Reserved-2"
mtd7: 00480000 00001000 "Bank 1 - Splash"
mtd8: 00040000 00001000 "Bank 1 - Device Tree"
root@draak:/# od -x /dev/mtd1
0000000 0000 d280 0001 d280 0002 d280 0003 d280
0000020 0004 d280 0005 d280 0006 d280 0007 d280
0000040 0008 d280 0009 d280 000a d280 000b d280
0000060 000c d280 000d d280 000e d280 000f d280
0000100 0010 d280 0011 d280 0012 d280 0013 d280
0000120 0014 d280 0015 d280 0016 d280 0017 d280
0000140 0018 d280 0019 d280 001a d280 001b d280
0000160 001c d280 001d d280 001e d280 1000 d53e
0000200 f800 9266 1000 d51e 3fdf d503 3ba0 1005

fyi~

best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================

--=_alternative 000E5076482583DD_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br><tt><font size=2><br>
&gt; Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On 04/13/2019 07:38 PM, Sergei Shtylyov wrote:<br>
&gt; <br>
&gt; &gt;&gt; Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt; Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;<br>
&gt; &gt; [...]<br>
&gt; &gt;&gt; diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-renesas-rpc.c<br>
&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; index 0000000..037f273<br>
&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; +++ b/drivers/spi/spi-renesas-rpc.c<br>
&gt; &gt; [...]<br>
&gt; &gt;&gt; +static int rpc_spi_probe(struct platform_device *pdev)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; + &nbsp; struct spi_controller *ctlr;<br>
&gt; &gt;&gt; + &nbsp; struct rpc_mfd *rpc_mfd = dev_get_drvdata(pdev-&gt;dev.parent);<br>
&gt; &gt;&gt; + &nbsp; struct rpc_spi *rpc;<br>
&gt; &gt;&gt; + &nbsp; int ret;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; ctlr = spi_alloc_master(&amp;pdev-&gt;dev, sizeof(*rpc));<br>
&gt; &gt;&gt; + &nbsp; if (!ctlr)<br>
&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; platform_set_drvdata(pdev, ctlr);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; rpc = spi_controller_get_devdata(ctlr);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; ctlr-&gt;dev.of_node = pdev-&gt;dev.of_node;<br>
&gt; &gt; [...]<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; + &nbsp; pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; &gt;&gt; + &nbsp; ctlr-&gt;auto_runtime_pm = true;<br>
&gt; &gt; <br>
&gt; &gt; &nbsp; &nbsp;I think this line no longer works as expected with
the new <br>
&gt; probing scheme.<br>
&gt; &gt; Have you tested reading? v8 patch still works while v9 patches
<br>
&gt; hang on doing:<br>
&gt; &gt; <br>
&gt; &gt; $ cat /dev/mtd&lt;n&gt;...<br>
&gt; <br>
&gt; &nbsp; &nbsp;Sorry, 'od -x', not 'cat'.<br>
&gt; </font></tt>
<br><tt><font size=2><br>
root@draak:/# cat /proc/mtd</font></tt>
<br><tt><font size=2>dev: &nbsp; &nbsp;size &nbsp; erasesize &nbsp;name</font></tt>
<br><tt><font size=2>mtd0: 00040000 00001000 &quot;Bank 1 - Boot parameter&quot;</font></tt>
<br><tt><font size=2>mtd1: 00140000 00001000 &quot;Bank 1 - Loader-BL2&quot;</font></tt>
<br><tt><font size=2>mtd2: 00040000 00001000 &quot;Bank 1 - Certification&quot;</font></tt>
<br><tt><font size=2>mtd3: 00080000 00001000 &quot;Bank 1 - ARM Trusted
FW&quot;</font></tt>
<br><tt><font size=2>mtd4: 00400000 00001000 &quot;Bank 1 - Reserved-1&quot;</font></tt>
<br><tt><font size=2>mtd5: 00300000 00001000 &quot;Bank 1 - U-Boot&quot;</font></tt>
<br><tt><font size=2>mtd6: 00200000 00001000 &quot;Bank 1 - Reserved-2&quot;</font></tt>
<br><tt><font size=2>mtd7: 00480000 00001000 &quot;Bank 1 - Splash&quot;</font></tt>
<br><tt><font size=2>mtd8: 00040000 00001000 &quot;Bank 1 - Device Tree&quot;</font></tt>
<br><tt><font size=2>root@draak:/# od -x /dev/mtd1</font></tt>
<br><tt><font size=2>0000000 0000 d280 0001 d280 0002 d280 0003 d280</font></tt>
<br><tt><font size=2>0000020 0004 d280 0005 d280 0006 d280 0007 d280</font></tt>
<br><tt><font size=2>0000040 0008 d280 0009 d280 000a d280 000b d280</font></tt>
<br><tt><font size=2>0000060 000c d280 000d d280 000e d280 000f d280</font></tt>
<br><tt><font size=2>0000100 0010 d280 0011 d280 0012 d280 0013 d280</font></tt>
<br><tt><font size=2>0000120 0014 d280 0015 d280 0016 d280 0017 d280</font></tt>
<br><tt><font size=2>0000140 0018 d280 0019 d280 001a d280 001b d280</font></tt>
<br><tt><font size=2>0000160 001c d280 001d d280 001e d280 1000 d53e</font></tt>
<br><tt><font size=2>0000200 f800 9266 1000 d51e 3fdf d503 3ba0 1005</font></tt>
<br>
<br><tt><font size=2>fyi~</font></tt>
<br>
<br><tt><font size=2>best regards,</font></tt>
<br><tt><font size=2>Mason</font></tt>
<br><tt><font size=2><br>
<br>
CONFIDENTIALITY NOTE:<br>
<br>
This e-mail and any attachments may contain confidential information and/or
personal data, which is protected by applicable laws. Please be reminded
that duplication, disclosure, distribution, or use of this e-mail (and/or
its attachments) or any part thereof is prohibited. If you receive this
e-mail in error, please notify us immediately and delete this mail as well
as its attachment(s) from your system. In addition, please be informed
that collection, processing, and/or use of personal data is prohibited
unless expressly permitted by personal data protection laws. Thank you
for your attention and cooperation.<br>
<br>
Macronix International Co., Ltd.<br>
<br>
=====================================================================<br>
</font></tt>

--=_alternative 000E5076482583DD_=--
