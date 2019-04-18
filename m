Return-Path: <SRS0=5lX1=SU=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <3d334751-8fd4-7db1-9deb-e6c94936df13@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <1e2bf23d-db39-0d1d-0bcc-6d9cd2935a82@cogentembedded.com> <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com> <OF82CE76E9.E6395EF7-ON482583DD.000E37D7-482583DD.000E5077@mxic.com.tw> <3d334751-8fd4-7db1-9deb-e6c94936df13@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF4ABCC306.B053BA23-ON482583E0.000F480C-482583E0.000FAD4A@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 18 Apr 2019 10:51:13 +0800
Content-Type: multipart/alternative; boundary="=_alternative 000FAD4A482583E0_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 000FAD4A482583E0_=
Content-Type: text/plain; charset="US-ASCII"


Hello,


> Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller 
driver
> 
> On 04/15/2019 05:36 AM, masonccyang@mxic.com.tw wrote:
> 
> >> >> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> >> >>
> >> >> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >> >> Signed-off-by: Sergei Shtylyov 
<sergei.shtylyov@cogentembedded.com>
> >> > [...]
> >> >> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-
> renesas-rpc.c
> >> >> new file mode 100644
> >> >> index 0000000..037f273
> >> >> --- /dev/null
> >> >> +++ b/drivers/spi/spi-renesas-rpc.c
> >> > [...]
> >> >> +static int rpc_spi_probe(struct platform_device *pdev)
> >> >> +{
> >> >> +   struct spi_controller *ctlr;
> >> >> +   struct rpc_mfd *rpc_mfd = dev_get_drvdata(pdev->dev.parent);
> >> >> +   struct rpc_spi *rpc;
> >> >> +   int ret;
> >> >> +
> >> >> +   ctlr = spi_alloc_master(&pdev->dev, sizeof(*rpc));
> >> >> +   if (!ctlr)
> >> >> +      return -ENOMEM;
> >> >> +
> >> >> +   platform_set_drvdata(pdev, ctlr);
> >> >> +
> >> >> +   rpc = spi_controller_get_devdata(ctlr);
> >> >> +
> >> >> +   ctlr->dev.of_node = pdev->dev.of_node;
> >> > [...]
> >> >> +
> >> >> +   pm_runtime_enable(&pdev->dev);
> >> >> +   ctlr->auto_runtime_pm = true;
> >> >
> >> >    I think this line no longer works as expected with the new
> >> probing scheme.
> 
>    That's because we added another (SPI) device under our MFD.

Do you mean just to remove one line
ctlr->auto_runtime_pm = true;
?


> 
> >> > Have you tested reading? v8 patch still works while v9 patches
> >> > hang on doing:
> >> >
> >> > $ cat /dev/mtd<n>...
> >>
> >>    Sorry, 'od -x', not 'cat'.
> > 
> > root@draak:/# cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00040000 00001000 "Bank 1 - Boot parameter"
> > mtd1: 00140000 00001000 "Bank 1 - Loader-BL2"
> > mtd2: 00040000 00001000 "Bank 1 - Certification"
> > mtd3: 00080000 00001000 "Bank 1 - ARM Trusted FW"
> > mtd4: 00400000 00001000 "Bank 1 - Reserved-1"
> > mtd5: 00300000 00001000 "Bank 1 - U-Boot"
> > mtd6: 00200000 00001000 "Bank 1 - Reserved-2"
> > mtd7: 00480000 00001000 "Bank 1 - Splash"
> > mtd8: 00040000 00001000 "Bank 1 - Device Tree"
> > root@draak:/# od -x /dev/mtd1
> > 0000000 0000 d280 0001 d280 0002 d280 0003 d280
> > 0000020 0004 d280 0005 d280 0006 d280 0007 d280
> > 0000040 0008 d280 0009 d280 000a d280 000b d280
> > 0000060 000c d280 000d d280 000e d280 000f d280
> > 0000100 0010 d280 0011 d280 0012 d280 0013 d280
> > 0000120 0014 d280 0015 d280 0016 d280 0017 d280
> > 0000140 0018 d280 0019 d280 001a d280 001b d280
> > 0000160 001c d280 001d d280 001e d280 1000 d53e
> > 0000200 f800 9266 1000 d51e 3fdf d503 3ba0 1005
> 
>    Still hangs for me. After I patches spi-mem.c and the driver to
> call RPM for the MFD, it started working again. Perhaps, that clock
> is still enabled on your target. What does the following print (for
> the RPC clocks)?
> 
> $ mount none -t debugfs /sys/kernel/debug/
> $ cat /sys/kernel/debug/clk/clk_summary
> 

root@draak:/# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect  duty
   clock                          count    count    count        rate 
accuracy phase  cycle
---------------------------------------------------------------------------------------------
 audio_clkout1                        0        0        0    11289600  0  
0  50000
 x19_clk                              0        0        0    24576000  0  
0  50000
 dclkin-0                             0        0        0           0  0  
0  50000
 scif                                 1        1        0           0  0  
0  50000
 audio_clkb                           0        0        0    22579200  0  
0  50000
 msiof-ref-clock                      0        0        0    66666666  0  
0  50000
 extal                                2        3        0    48000000  0  
0  50000
    r                                 0        2        0       31250  0  
0  50000
       rpc-if                         0        1        0       31250  0  
0  50000
       rwdt                           0        1        0       31250  0  
0  50000
       cmt0                           0        0        0       31250  0  
0  50000
       cmt1                           0        0        0       31250  0  
0  50000
       cmt2                           0        0        0       31250  0  
0  50000
       cmt3                           0        0        0       31250  0  
0  50000
    osc                               0        0        0      125000  0  
0  50000


thanks & best regards,
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

--=_alternative 000FAD4A482583E0_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br>
<br><tt><font size=2><br>
&gt; Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On 04/15/2019 05:36 AM, masonccyang@mxic.com.tw wrote:<br>
&gt; <br>
&gt; &gt;&gt; &gt;&gt; Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt; &gt;&gt; Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;<br>
&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt;&gt; &gt;&gt; diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-<br>
&gt; renesas-rpc.c<br>
&gt; &gt;&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt;&gt; &gt;&gt; index 0000000..037f273<br>
&gt; &gt;&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt;&gt; &gt;&gt; +++ b/drivers/spi/spi-renesas-rpc.c<br>
&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt;&gt; &gt;&gt; +static int rpc_spi_probe(struct platform_device
*pdev)<br>
&gt; &gt;&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; struct spi_controller *ctlr;<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; struct rpc_mfd *rpc_mfd = dev_get_drvdata(pdev-&gt;dev.parent);<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; struct rpc_spi *rpc;<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; int ret;<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr = spi_alloc_master(&amp;pdev-&gt;dev,
sizeof(*rpc));<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; if (!ctlr)<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; platform_set_drvdata(pdev, ctlr);<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; rpc = spi_controller_get_devdata(ctlr);<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr-&gt;dev.of_node = pdev-&gt;dev.of_node;<br>
&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr-&gt;auto_runtime_pm = true;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &nbsp; &nbsp;I think this line no longer works as expected
with the new<br>
&gt; &gt;&gt; probing scheme.<br>
&gt; <br>
&gt; &nbsp; &nbsp;That's because we added another (SPI) device under our
MFD.</font></tt>
<br>
<br><tt><font size=2>Do you mean just to remove one line</font></tt>
<br><tt><font size=2>ctlr-&gt;auto_runtime_pm = true;</font></tt>
<br><tt><font size=2>?</font></tt>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt;&gt; &gt; Have you tested reading? v8 patch still works while
v9 patches<br>
&gt; &gt;&gt; &gt; hang on doing:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; $ cat /dev/mtd&lt;n&gt;...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;Sorry, 'od -x', not 'cat'.<br>
&gt; &gt; <br>
&gt; &gt; root@draak:/# cat /proc/mtd<br>
&gt; &gt; dev: &nbsp; &nbsp;size &nbsp; erasesize &nbsp;name<br>
&gt; &gt; mtd0: 00040000 00001000 &quot;Bank 1 - Boot parameter&quot;<br>
&gt; &gt; mtd1: 00140000 00001000 &quot;Bank 1 - Loader-BL2&quot;<br>
&gt; &gt; mtd2: 00040000 00001000 &quot;Bank 1 - Certification&quot;<br>
&gt; &gt; mtd3: 00080000 00001000 &quot;Bank 1 - ARM Trusted FW&quot;<br>
&gt; &gt; mtd4: 00400000 00001000 &quot;Bank 1 - Reserved-1&quot;<br>
&gt; &gt; mtd5: 00300000 00001000 &quot;Bank 1 - U-Boot&quot;<br>
&gt; &gt; mtd6: 00200000 00001000 &quot;Bank 1 - Reserved-2&quot;<br>
&gt; &gt; mtd7: 00480000 00001000 &quot;Bank 1 - Splash&quot;<br>
&gt; &gt; mtd8: 00040000 00001000 &quot;Bank 1 - Device Tree&quot;<br>
&gt; &gt; root@draak:/# od -x /dev/mtd1<br>
&gt; &gt; 0000000 0000 d280 0001 d280 0002 d280 0003 d280<br>
&gt; &gt; 0000020 0004 d280 0005 d280 0006 d280 0007 d280<br>
&gt; &gt; 0000040 0008 d280 0009 d280 000a d280 000b d280<br>
&gt; &gt; 0000060 000c d280 000d d280 000e d280 000f d280<br>
&gt; &gt; 0000100 0010 d280 0011 d280 0012 d280 0013 d280<br>
&gt; &gt; 0000120 0014 d280 0015 d280 0016 d280 0017 d280<br>
&gt; &gt; 0000140 0018 d280 0019 d280 001a d280 001b d280<br>
&gt; &gt; 0000160 001c d280 001d d280 001e d280 1000 d53e<br>
&gt; &gt; 0000200 f800 9266 1000 d51e 3fdf d503 3ba0 1005<br>
&gt; <br>
&gt; &nbsp; &nbsp;Still hangs for me. After I patches spi-mem.c and the
driver to<br>
&gt; call RPM for the MFD, it started working again. Perhaps, that clock<br>
&gt; is still enabled on your target. What does the following print (for<br>
&gt; the RPC clocks)?<br>
&gt; <br>
&gt; $ mount none -t debugfs /sys/kernel/debug/<br>
&gt; $ cat /sys/kernel/debug/clk/clk_summary<br>
&gt; <br>
</font></tt>
<br><tt><font size=2>root@draak:/# cat /sys/kernel/debug/clk/clk_summary</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enable &nbsp;prepare
&nbsp;protect &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;duty</font></tt>
<br><tt><font size=2>&nbsp; &nbsp;clock &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;count &nbsp; &nbsp;count
&nbsp; &nbsp;count &nbsp; &nbsp; &nbsp; &nbsp;rate &nbsp; accuracy phase
&nbsp;cycle</font></tt>
<br><tt><font size=2>---------------------------------------------------------------------------------------------</font></tt>
<br><tt><font size=2>&nbsp;audio_clkout1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;
&nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;11289600 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;x19_clk &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp;
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;24576000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;dclkin-0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp;
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;scif &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1
&nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;audio_clkb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp; &nbsp;
&nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;22579200 &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;msiof-ref-clock &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;
&nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;66666666 &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp;extal &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2
&nbsp; &nbsp; &nbsp; &nbsp;3 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;48000000
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; r &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
0 &nbsp; &nbsp; &nbsp; &nbsp;2 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;rpc-if &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0 &nbsp;
&nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp;
31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;rwdt &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;1 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;cmt0 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;cmt1 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;cmt2 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp;cmt3 &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp; 31250 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; osc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0
&nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;
&nbsp;125000 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 0 &nbsp;50000</font></tt>
<br>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
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

--=_alternative 000FAD4A482583E0_=--
