Return-Path: <SRS0=PrsS=TC=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190502024103.GT14916@sirena.org.uk>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw> <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw> <20190419145151.GR2803@sirena.org.uk> <OF7742B4A9.445066F6-ON482583EC.0037E377-482583EC.0039125B@mxic.com.tw> <20190502024103.GT14916@sirena.org.uk>
Subject: Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver according to
 MX25F0A MFD driver
MIME-Version: 1.0
Message-ID: <OFA2A891D4.B6E07B39-ON482583EE.0012A872-482583EE.0012F9E4@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 2 May 2019 11:27:15 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0012F9E2482583EE_="
To: Mark Brown <broonie@kernel.org>
Cc: bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmal.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0012F9E2482583EE_=
Content-Type: text/plain; charset="US-ASCII"


Hi Mark,

> Subject
> 
> Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver 
> according to MX25F0A MFD driver
> 
> On Tue, Apr 30, 2019 at 06:23:21PM +0800, masonccyang@mxic.com.tw wrote:
> 
> > > It'd be much better to describe what the above actually means - what
> > > changes have been made in the introduction of the MFD driver?  It 
does
> > > feel like there's not as much abstraction as I'd expect between the 
MFD
> > > and the child, there's a lot of peering into the parent and enabling 
and
> > > disabling individual clocks for example rather than either having 
this
> > > hidden behind a function or just having the clocks owned by the 
child
> > > driver. 
> 
> > Do you mean I should remove ps_clk/send_clk/send_dly_clk resource from 
MFD 
> 
> > and patch them to spi-mxic.c ?
> 
> > Or any other ?
> 
> I think you need to have a clear idea that you can explain as to what
> the MFD is and how it's split up.  What's being abstracted, what's not
> and why.  Without knowing anything about the device or what the series
> is trying to accomplish it's hard to be sure exactly what the best thing
> to do is.

okay, got your point.
thanks for your comments & suggestions.

> 
> > The driver also isn't using the MFD interfaces to pass through
> > > the register subblocks for the IP - instead the child driver is 
peering
> > > straight into the MFD structure and looking at a variable in there.
> 
> > Patch regmap for mfd, nand and spi ?
> > or any other patches is needed ?
> 
> This is a memory mapped device so there should be no need to use regmap
> unless you want to.  The MFD subsystem has facilities for passing
> through memory regions to subdevices.

Got it!

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

--=_alternative 0012F9E2482583EE_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Mark,</font></tt>
<br><tt><font size=2><br>
&gt; Subject</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver <br>
&gt; according to MX25F0A MFD driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On Tue, Apr 30, 2019 at 06:23:21PM +0800, masonccyang@mxic.com.tw
wrote:<br>
&gt; <br>
&gt; &gt; &gt; It'd be much better to describe what the above actually
means - what<br>
&gt; &gt; &gt; changes have been made in the introduction of the MFD driver?
&nbsp;It does<br>
&gt; &gt; &gt; feel like there's not as much abstraction as I'd expect
between the MFD<br>
&gt; &gt; &gt; and the child, there's a lot of peering into the parent
and enabling and<br>
&gt; &gt; &gt; disabling individual clocks for example rather than either
having this<br>
&gt; &gt; &gt; hidden behind a function or just having the clocks owned
by the child<br>
&gt; &gt; &gt; driver. <br>
&gt; <br>
&gt; &gt; Do you mean I should remove ps_clk/send_clk/send_dly_clk resource
from MFD <br>
&gt; <br>
&gt; &gt; and patch them to spi-mxic.c ?<br>
&gt; <br>
&gt; &gt; Or any other ?<br>
&gt; <br>
&gt; I think you need to have a clear idea that you can explain as to what<br>
&gt; the MFD is and how it's split up. &nbsp;What's being abstracted, what's
not<br>
&gt; and why. &nbsp;Without knowing anything about the device or what the
series<br>
&gt; is trying to accomplish it's hard to be sure exactly what the best
thing<br>
&gt; to do is.</font></tt>
<br>
<br><tt><font size=2>okay, got your point.</font></tt>
<br><tt><font size=2>thanks for your comments &amp; suggestions.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; The driver also isn't using the MFD interfaces to pass through<br>
&gt; &gt; &gt; the register subblocks for the IP - instead the child driver
is peering<br>
&gt; &gt; &gt; straight into the MFD structure and looking at a variable
in there.<br>
&gt; <br>
&gt; &gt; Patch regmap for mfd, nand and spi ?<br>
&gt; &gt; or any other patches is needed ?<br>
&gt; <br>
&gt; This is a memory mapped device so there should be no need to use regmap<br>
&gt; unless you want to. &nbsp;The MFD subsystem has facilities for passing<br>
&gt; through memory regions to subdevices.</font></tt>
<br>
<br><tt><font size=2>Got it!</font></tt>
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

--=_alternative 0012F9E2482583EE_=--
