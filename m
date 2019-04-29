Return-Path: <SRS0=qeJe=S7=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190419145151.GR2803@sirena.org.uk>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw> <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw> <20190419145151.GR2803@sirena.org.uk>
Subject: Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver according to
 MX25F0A MFD driver
MIME-Version: 1.0
Message-ID: <OF0C9602E0.D37C98F7-ON482583EB.002583CF-482583EB.0025B15E@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 29 Apr 2019 14:51:41 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0025B15B482583EB_="
To: Mark Brown <broonie@kernel.org>
Cc: bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmal.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0025B15B482583EB_=
Content-Type: text/plain; charset="US-ASCII"


Hi Mark,
 
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
> changes have been made in the introduction of the MFD driver?

okay, will do in next version.

  It does
> feel like there's not as much abstraction as I'd expect between the MFD
> and the child, there's a lot of peering into the parent and enabling and
> disabling individual clocks for example rather than either having this
> hidden behind a function or just having the clocks owned by the child
> driver.  The driver also isn't using the MFD interfaces to pass through
> the register subblocks for the IP - instead the child driver is peering
> straight into the MFD structure and looking at a variable in there.

Will do some patches in next version.
thanks for your review.

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

--=_alternative 0025B15B482583EB_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Mark,</font></tt>
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
&gt; changes have been made in the introduction of the MFD driver?</font></tt>
<br>
<br><tt><font size=2>okay, will do in next version.</font></tt>
<br>
<br><tt><font size=2>&nbsp; It does<br>
&gt; feel like there's not as much abstraction as I'd expect between the
MFD<br>
&gt; and the child, there's a lot of peering into the parent and enabling
and<br>
&gt; disabling individual clocks for example rather than either having
this<br>
&gt; hidden behind a function or just having the clocks owned by the child<br>
&gt; driver. &nbsp;The driver also isn't using the MFD interfaces to pass
through<br>
&gt; the register subblocks for the IP - instead the child driver is peering<br>
&gt; straight into the MFD structure and looking at a variable in there.<br>
</font></tt>
<br><tt><font size=2>Will do some patches in next version.</font></tt>
<br><tt><font size=2>thanks for your review.</font></tt>
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

--=_alternative 0025B15B482583EB_=--
