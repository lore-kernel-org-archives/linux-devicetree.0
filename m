Return-Path: <SRS0=3o4J=SV=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <OF58AAFF49.C4593DEB-ON482583E1.001D551E-482583E1.001F089D@LocalDomain>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <1e2bf23d-db39-0d1d-0bcc-6d9cd2935a82@cogentembedded.com> <cdee3d53-6ee3-4435-117e-8ba4a58ca72b@cogentembedded.com> <OF82CE76E9.E6395EF7-ON482583DD.000E37D7-482583DD.000E5077@mxic.com.tw> <3d334751-8fd4-7db1-9deb-e6c94936df13@cogentembedded.com> <OF4ABCC306.B053BA23-ON482583E0.000F480C-482583E0.000FAD4A@mxic.com.tw> <3971c669-9095-9d18-d029-37f9663a54b2@cogentembedded.com> <OF58AAFF49.C4593DEB-ON482583E1.001D551E-482583E1.001F089D@LocalDomain>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OFE74649D4.F69BB5EF-ON482583E1.0033F73F-482583E1.00344ED2@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 19 Apr 2019 17:31:19 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00344ECF482583E1_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00344ECF482583E1_=
Content-Type: text/plain; charset="US-ASCII"


Hello,
 
> > Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller 
driver
> > 
> > On 04/18/2019 05:51 AM, masonccyang@mxic.com.tw wrote:
> > 
> > >> >> >> Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> > >> >> >>
> > >> >> >> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > >> >> >> Signed-off-by: Sergei Shtylyov 
<sergei.shtylyov@cogentembedded.com>
> > >> >> > [...]
> > >> >> >> diff --git a/drivers/spi/spi-renesas-rpc.c b/drivers/spi/spi-
> > >> renesas-rpc.c
> > >> >> >> new file mode 100644
> > >> >> >> index 0000000..037f273
> > >> >> >> --- /dev/null
> > >> >> >> +++ b/drivers/spi/spi-renesas-rpc.c
> > >> >> > [...]
> > >> >> >> +static int rpc_spi_probe(struct platform_device *pdev)
> > >> >> >> +{
> > >> >> >> +   struct spi_controller *ctlr;
> > >> >> >> +   struct rpc_mfd *rpc_mfd = 
dev_get_drvdata(pdev->dev.parent);
> > >> >> >> +   struct rpc_spi *rpc;
> > >> >> >> +   int ret;
> > >> >> >> +
> > >> >> >> +   ctlr = spi_alloc_master(&pdev->dev, sizeof(*rpc));
> > >> >> >> +   if (!ctlr)
> > >> >> >> +      return -ENOMEM;
> > >> >> >> +
> > >> >> >> +   platform_set_drvdata(pdev, ctlr);
> > >> >> >> +
> > >> >> >> +   rpc = spi_controller_get_devdata(ctlr);
> > >> >> >> +
> > >> >> >> +   ctlr->dev.of_node = pdev->dev.of_node;
> > >> >> > [...]
> > >> >> >> +
> > >> >> >> +   pm_runtime_enable(&pdev->dev);
> > >> >> >> +   ctlr->auto_runtime_pm = true;
> > >> >> >
> > >> >> >    I think this line no longer works as expected with the new
> > >> >> probing scheme.
> > >>
> > >>    That's because we added another (SPI) device under our MFD.
> > > 
> > > Do you mean just to remove one line
> > > ctlr->auto_runtime_pm = true;
> > > ?

> how did you test it ?
> what is your testing flow ? 
> 
> >    No, you should explicitly call RPM for the MFD (not the SPI 
device).
> 
> okay, patch RPM to RPC MFD and will remove SPI RPM enable part.

wait! I test it ok.

Don't need to patch RPM to RPC MFD, just keep RPM in SPI.

root@draak:/sys/power# echo mem > state
[  135.848711] PM: suspend entry (s2idle)
[  135.852777] PM: Syncing filesystems ... done.
[  135.869468] Freezing user space processes ... (elapsed 0.002 seconds) 
done.
[  135.879962] OOM killer disabled.
[  135.883257] Freezing remaining freezable tasks ... (elapsed 0.002 
seconds) done.
[  135.893474] Suspending console(s) (use no_console_suspend to debug)
[  135.910946] [Mason] rpc_spi_suspend
[  135.986022] PM: suspend devices took 0.084 seconds
[  135.986047] PM: suspend debug: Waiting for 5 second(s).
[  141.142024] [Mason] rpc_spi_resume
[  141.220859] PM: resume devices took 0.116 seconds
[  141.243179] OOM killer enabled.
[  141.246417] Restarting tasks ... done.
[  141.266579] PM: suspend exit
root@draak:/sys/power#

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

--=_alternative 00344ECF482583E1_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2><br>
Hello,</font></tt>
<br><tt><font size=2>&nbsp;<br>
&gt; &gt; Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
driver</font></tt>
<br><tt><font size=2>&gt; &gt; <br>
&gt; &gt; On 04/18/2019 05:51 AM, masonccyang@mxic.com.tw wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; Add a driver for Renesas R-Car Gen3
RPC-IF SPI controller.<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; diff --git a/drivers/spi/spi-renesas-rpc.c
b/drivers/spi/spi-<br>
&gt; &gt; &gt;&gt; renesas-rpc.c<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; new file mode 100644<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; index 0000000..037f273<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; --- /dev/null<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +++ b/drivers/spi/spi-renesas-rpc.c<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +static int rpc_spi_probe(struct platform_device
*pdev)<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +{<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; struct spi_controller *ctlr;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; struct rpc_mfd *rpc_mfd =
dev_get_drvdata(pdev-&gt;dev.parent);<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; struct rpc_spi *rpc;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; int ret;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr = spi_alloc_master(&amp;pdev-&gt;dev,
sizeof(*rpc));<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; if (!ctlr)<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; &nbsp; &nbsp;return -ENOMEM;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; platform_set_drvdata(pdev,
ctlr);<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; rpc = spi_controller_get_devdata(ctlr);<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr-&gt;dev.of_node = pdev-&gt;dev.of_node;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt; [...]<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; +<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; pm_runtime_enable(&amp;pdev-&gt;dev);<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;&gt; + &nbsp; ctlr-&gt;auto_runtime_pm
= true;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;&gt; &gt; &nbsp; &nbsp;I think this line no longer
works as expected with the new<br>
&gt; &gt; &gt;&gt; &gt;&gt; probing scheme.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; &nbsp; &nbsp;That's because we added another (SPI) device
under our MFD.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Do you mean just to remove one line<br>
&gt; &gt; &gt; ctlr-&gt;auto_runtime_pm = true;<br>
&gt; &gt; &gt; ?<br>
</font></tt>
<br><tt><font size=2>&gt; how did you test it ?</font></tt>
<br><tt><font size=2>&gt; what is your testing flow ? </font></tt>
<br><tt><font size=2>&gt; <br>
&gt; &gt; &nbsp; &nbsp;No, you should explicitly call RPM for the MFD (not
the SPI device).</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; okay, patch RPM to RPC MFD and will remove SPI RPM enable part.</font></tt>
<br>
<br><tt><font size=2>wait! I test it ok.</font></tt>
<br>
<br><tt><font size=2>Don't need to patch RPM to RPC MFD, just keep RPM
in SPI.</font></tt>
<br>
<br><tt><font size=2>root@draak:/sys/power# echo mem &gt; state</font></tt>
<br><tt><font size=2>[ &nbsp;135.848711] PM: suspend entry (s2idle)</font></tt>
<br><tt><font size=2>[ &nbsp;135.852777] PM: Syncing filesystems ... done.</font></tt>
<br><tt><font size=2>[ &nbsp;135.869468] Freezing user space processes
... (elapsed 0.002 seconds) done.</font></tt>
<br><tt><font size=2>[ &nbsp;135.879962] OOM killer disabled.</font></tt>
<br><tt><font size=2>[ &nbsp;135.883257] Freezing remaining freezable tasks
... (elapsed 0.002 seconds) done.</font></tt>
<br><tt><font size=2>[ &nbsp;135.893474] Suspending console(s) (use no_console_suspend
to debug)</font></tt>
<br><tt><font size=2>[ &nbsp;135.910946] [Mason] rpc_spi_suspend</font></tt>
<br><tt><font size=2>[ &nbsp;135.986022] PM: suspend devices took 0.084
seconds</font></tt>
<br><tt><font size=2>[ &nbsp;135.986047] PM: suspend debug: Waiting for
5 second(s).</font></tt>
<br><tt><font size=2>[ &nbsp;141.142024] [Mason] rpc_spi_resume</font></tt>
<br><tt><font size=2>[ &nbsp;141.220859] PM: resume devices took 0.116
seconds</font></tt>
<br><tt><font size=2>[ &nbsp;141.243179] OOM killer enabled.</font></tt>
<br><tt><font size=2>[ &nbsp;141.246417] Restarting tasks ... done.</font></tt>
<br><tt><font size=2>[ &nbsp;141.266579] PM: suspend exit</font></tt>
<br><tt><font size=2>root@draak:/sys/power#</font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
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

--=_alternative 00344ECF482583E1_=--
