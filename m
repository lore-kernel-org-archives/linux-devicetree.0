Return-Path: <SRS0=Roeu=SN=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190410093716.GC6106@sirena.org.uk>
References: <1554777000-10542-1-git-send-email-masonccyang@mxic.com.tw> <1554777000-10542-4-git-send-email-masonccyang@mxic.com.tw> <20190410093716.GC6106@sirena.org.uk>
Subject: Re: [PATCH v2 3/4] spi: Add MFD for Macronix MX25F0A SPI controller driver
MIME-Version: 1.0
Message-ID: <OF7B591B7D.87F8080F-ON482583D9.000504F0-482583D9.0005658F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Thu, 11 Apr 2019 08:58:56 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0005658E482583D9_="
To: Mark Brown <broonie@kernel.org>
Cc: bbrezillon@kernel.org, christophe.kerello@st.com, computersforpeace@gmal.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0005658E482583D9_=
Content-Type: text/plain; charset="US-ASCII"


Hi Mark,

> Re: [PATCH v2 3/4] spi: Add MFD for Macronix MX25F0A SPI controller 
driver
> 
> On Tue, Apr 09, 2019 at 10:29:59AM +0800, Mason Yang wrote:
> > Add a MFD driver for Macronix MX25F0A SPI controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  drivers/spi/spi-mxic.c | 275 ++++++++
> +----------------------------------------
> 
> This isn't adding a new MFD driver, this is a substantial refactoring of
> the SPI driver which doesn't touch SPI at all.

okay, I will change the title:

"Patch SPI controller driver according to Macronix MX25F0A MFD driver"

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

--=_alternative 0005658E482583D9_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Mark,</font></tt>
<br><tt><font size=2><br>
&gt; Re: [PATCH v2 3/4] spi: Add MFD for Macronix MX25F0A SPI controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On Tue, Apr 09, 2019 at 10:29:59AM +0800, Mason Yang wrote:<br>
&gt; &gt; Add a MFD driver for Macronix MX25F0A SPI controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;drivers/spi/spi-mxic.c | 275 ++++++++<br>
&gt; +----------------------------------------<br>
&gt; <br>
&gt; This isn't adding a new MFD driver, this is a substantial refactoring
of<br>
&gt; the SPI driver which doesn't touch SPI at all.<br>
</font></tt>
<br><tt><font size=2>okay, I will change the title:</font></tt>
<br>
<br><tt><font size=2>&quot;Patch SPI controller driver according to Macronix
MX25F0A MFD driver&quot;</font></tt>
<br>
<br><tt><font size=2>thanks for your review.</font></tt>
<br>
<br><tt><font size=2>best regards,</font></tt>
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

--=_alternative 0005658E482583D9_=--
