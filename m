Return-Path: <SRS0=o7zD=TA=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190419145151.GR2803@sirena.org.uk>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw> <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw> <20190419145151.GR2803@sirena.org.uk>
Subject: Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver according to
 MX25F0A MFD driver
MIME-Version: 1.0
Message-ID: <OF7742B4A9.445066F6-ON482583EC.0037E377-482583EC.0039125B@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 30 Apr 2019 18:23:21 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00391259482583EC_="
To: Mark Brown <broonie@kernel.org>
Cc: bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmal.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00391259482583EC_=
Content-Type: text/plain; charset="US-ASCII"


Hi Mark,

Before patching, I would like to confirm with you for your comments.
 
> Subject
> 
> Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver 
> according to MX25F0A MFD driver
> 
> On Mon, Apr 15, 2019 at 05:23:53PM +0800, Mason Yang wrote:
> > Patch Macronix MX25F0A SPI controller driver according to it's MFD 
driver.
> 
> It'd be much better to describe what the above actually means - what
> changes have been made in the introduction of the MFD driver?  It does
> feel like there's not as much abstraction as I'd expect between the MFD
> and the child, there's a lot of peering into the parent and enabling and
> disabling individual clocks for example rather than either having this
> hidden behind a function or just having the clocks owned by the child
> driver. 

Do you mean I should remove ps_clk/send_clk/send_dly_clk resource from MFD 

and patch them to spi-mxic.c ?

Or any other ?

The driver also isn't using the MFD interfaces to pass through
> the register subblocks for the IP - instead the child driver is peering
> straight into the MFD structure and looking at a variable in there.

Patch regmap for mfd, nand and spi ?
or any other patches is needed ?

thanks for your review and comments.

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

--=_alternative 00391259482583EC_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Mark,</font></tt>
<br>
<br><tt><font size=2>Before patching, I would like to confirm with you
for your comments.</font></tt>
<br><tt><font size=2>&nbsp;<br>
&gt; Subject</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver <br>
&gt; according to MX25F0A MFD driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On Mon, Apr 15, 2019 at 05:23:53PM +0800, Mason Yang wrote:<br>
&gt; &gt; Patch Macronix MX25F0A SPI controller driver according to it's
MFD driver.<br>
&gt; <br>
&gt; It'd be much better to describe what the above actually means - what<br>
&gt; changes have been made in the introduction of the MFD driver? &nbsp;It
does<br>
&gt; feel like there's not as much abstraction as I'd expect between the
MFD<br>
&gt; and the child, there's a lot of peering into the parent and enabling
and<br>
&gt; disabling individual clocks for example rather than either having
this<br>
&gt; hidden behind a function or just having the clocks owned by the child<br>
&gt; driver. &nbsp;</font></tt>
<br>
<br><tt><font size=2>Do you mean I should remove ps_clk/send_clk/send_dly_clk
resource from MFD </font></tt>
<br><tt><font size=2>and patch them to spi-mxic.c ?</font></tt>
<br>
<br><tt><font size=2>Or any other ?</font></tt>
<br>
<br><tt><font size=2>The driver also isn't using the MFD interfaces to
pass through<br>
&gt; the register subblocks for the IP - instead the child driver is peering<br>
&gt; straight into the MFD structure and looking at a variable in there.<br>
</font></tt>
<br><tt><font size=2>Patch regmap for mfd, nand and spi ?</font></tt>
<br><tt><font size=2>or any other patches is needed ?</font></tt>
<br>
<br><tt><font size=2>thanks for your review and comments.</font></tt>
<br>
<br><tt><font size=2>best regards,</font></tt>
<br><tt><font size=2>Mason</font></tt>
<br>
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

--=_alternative 00391259482583EC_=--
