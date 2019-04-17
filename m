Return-Path: <SRS0=zf/i=ST=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <770002ab-7e08-b695-b5a5-fce772b600a5@cogentembedded.com>
References: <1555313834-15107-1-git-send-email-masonccyang@mxic.com.tw> <1555313834-15107-2-git-send-email-masonccyang@mxic.com.tw> <935046cc-e2e5-b9b8-0c94-1be5ae604276@cogentembedded.com> <OF8A9D093C.B3035121-ON482583DE.00065F23-482583DE.00074AC0@mxic.com.tw> <770002ab-7e08-b695-b5a5-fce772b600a5@cogentembedded.com>
Subject: Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller
 driver
MIME-Version: 1.0
Message-ID: <OF2BD84B79.FBC5E822-ON482583DF.0020009F-482583DF.0022E315@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 17 Apr 2019 14:21:03 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0022E313482583DF_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0022E313482583DF_=
Content-Type: text/plain; charset="US-ASCII"


Hello,

> 
> Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller 
driver
> 
> On 04/16/2019 04:19 AM, masonccyang@mxic.com.tw wrote:
> 
> >> Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD 
> controller driver
> >>
> >> The patch name is somewhat misleading -- there's no "MFD controller".
> > 
> > Can't get your point ?
> > 
> > RPC-IF support SPI and HF, it's a MFD controller and
> > that's why I patch it to MFD as Marek's comments.
> 
>    I'd like the "controller" word dropped, as MFD stands for multi-
> function device
> anyway. "Controller" seems to be superfluous here...

okay, will rename to:

[PATCH v11 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD driver


> 
> >> On 04/15/2019 10:37 AM, Mason Yang wrote:
> >>
> >> > Add a driver for Renesas R-Car Gen3 RPC-IF MFD controller.
> >> >
> >> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >> [...]
> >> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> >> > index 26ad646..7914349 100644
> >> > --- a/drivers/mfd/Kconfig
> >> > +++ b/drivers/mfd/Kconfig
> >> > @@ -978,6 +978,15 @@ config MFD_RDC321X
> >> >       southbridge which provides access to GPIOs and Watchdog using 
the
> >> >       southbridge PCI device configuration space.
> >> > 
> >> > +config MFD_RENESAS_RPC
> >> > +   tristate "Renesas R-Car Gen3 RPC-IF MFD driver"
> >> > +   select MFD_CORE
> >> > +   depends on ARCH_RENESAS
> >> > +   help
> >> > +     This supports for Renesas R-Car Gen3 RPC-IF multifunction 
device
> >>
> >>    "For" node needed here.
> > 
> > ?
> 
>    Sorry, that was a typo: s/node/not/.

Oops, still don't know what do you mean to ?

Will change to:
         help
           This supports for Renesas R-Car Gen3 RPC-IF multifunction 
device
           which provides either SPI host or HyperFlash.
           You have to select individual components under the 
corresponding menu.

is it ok ?

> 
> >> [...]
> >> > diff --git a/include/linux/mfd/renesas-rpc.h b/include/linux/mfd/
> >> renesas-rpc.h
> >> > new file mode 100644
> >> > index 0000000..61ada14
> >> > --- /dev/null
> >> > +++ b/include/linux/mfd/renesas-rpc.h
> >> > @@ -0,0 +1,153 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >> > +//
> >> > +// Copyright (C) 2018 ~ 2019 Renesas Solutions Corp.
> >> > +// Copyright (C) 2019 Macronix International Co., Ltd.
> >> > +//
> >> > +// R-Car Gen3 RPC-IF MFD driver
> >> > +//
> >> > +// Author:
> >> > +//   Mason Yang <masonccyang@mxic.com.tw>
> >> > +//
> >> > +
> >> > +#ifndef __MFD_RENESAS_RPC_H
> >> > +#define __MFD_RENESAS_RPC_H
> >> > +
> >> > +#include <linux/clk.h>
> >> > +#include <linux/io.h>
> >> > +#include <linux/log2.h>
> >> > +#include <linux/iopoll.h>
> >> > +#include <linux/module.h>
> >> > +#include <linux/mtd/mtd.h>
> >> > +#include <linux/platform_device.h>
> >> > +#include <linux/pm_runtime.h>
> >> > +#include <linux/of.h>
> >> > +#include <linux/regmap.h>
> >> > +#include <linux/reset.h>
> >>
> >>    NAK. I have already told you that these #include's are only 
> needed in the
> >> drivers, not in this header.
> > 
> > why ?
> 
>    Why what? As a rule of thumb, we #include only headers necessary to 
build
> the file in question.

okay, got your point.

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

--=_alternative 0022E313482583DF_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On 04/16/2019 04:19 AM, masonccyang@mxic.com.tw wrote:<br>
&gt; <br>
&gt; &gt;&gt; Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD
<br>
&gt; controller driver<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The patch name is somewhat misleading -- there's no &quot;MFD
controller&quot;.<br>
&gt; &gt; <br>
&gt; &gt; Can't get your point ?<br>
&gt; &gt; <br>
&gt; &gt; RPC-IF support SPI and HF, it's a MFD controller and<br>
&gt; &gt; that's why I patch it to MFD as Marek's comments.<br>
&gt; <br>
&gt; &nbsp; &nbsp;I'd like the &quot;controller&quot; word dropped, as
MFD stands for multi-<br>
&gt; function device<br>
&gt; anyway. &quot;Controller&quot; seems to be superfluous here...</font></tt>
<br>
<br><tt><font size=2>okay, will rename to:</font></tt>
<br>
<br><tt><font size=2>[PATCH v11 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF
MFD driver</font></tt>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt;&gt; On 04/15/2019 10:37 AM, Mason Yang wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; Add a driver for Renesas R-Car Gen3 RPC-IF MFD controller.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt; [...]<br>
&gt; &gt;&gt; &gt; diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig<br>
&gt; &gt;&gt; &gt; index 26ad646..7914349 100644<br>
&gt; &gt;&gt; &gt; --- a/drivers/mfd/Kconfig<br>
&gt; &gt;&gt; &gt; +++ b/drivers/mfd/Kconfig<br>
&gt; &gt;&gt; &gt; @@ -978,6 +978,15 @@ config MFD_RDC321X<br>
&gt; &gt;&gt; &gt; &nbsp; &nbsp; &nbsp; southbridge which provides access
to GPIOs and Watchdog using the<br>
&gt; &gt;&gt; &gt; &nbsp; &nbsp; &nbsp; southbridge PCI device configuration
space.<br>
&gt; &gt;&gt; &gt; &nbsp;<br>
&gt; &gt;&gt; &gt; +config MFD_RENESAS_RPC<br>
&gt; &gt;&gt; &gt; + &nbsp; tristate &quot;Renesas R-Car Gen3 RPC-IF MFD
driver&quot;<br>
&gt; &gt;&gt; &gt; + &nbsp; select MFD_CORE<br>
&gt; &gt;&gt; &gt; + &nbsp; depends on ARCH_RENESAS<br>
&gt; &gt;&gt; &gt; + &nbsp; help<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; This supports for Renesas R-Car Gen3
RPC-IF multifunction device<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;&quot;For&quot; node needed here.<br>
&gt; &gt; <br>
&gt; &gt; ?<br>
&gt; <br>
&gt; &nbsp; &nbsp;Sorry, that was a typo: s/node/not/.</font></tt>
<br>
<br><tt><font size=2>Oops, still don't know what do you mean to ?</font></tt>
<br>
<br><tt><font size=2>Will change to:</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;help</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;This supports
for Renesas R-Car Gen3 RPC-IF multifunction device</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;which provides
either SPI host or HyperFlash.</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;You have
to select individual components under the corresponding menu.</font></tt>
<br>
<br><tt><font size=2>is it ok ?</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt;&gt; [...]<br>
&gt; &gt;&gt; &gt; diff --git a/include/linux/mfd/renesas-rpc.h b/include/linux/mfd/<br>
&gt; &gt;&gt; renesas-rpc.h<br>
&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; index 0000000..61ada14<br>
&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; +++ b/include/linux/mfd/renesas-rpc.h<br>
&gt; &gt;&gt; &gt; @@ -0,0 +1,153 @@<br>
&gt; &gt;&gt; &gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt;&gt; &gt; +//<br>
&gt; &gt;&gt; &gt; +// Copyright (C) 2018 ~ 2019 Renesas Solutions Corp.<br>
&gt; &gt;&gt; &gt; +// Copyright (C) 2019 Macronix International Co., Ltd.<br>
&gt; &gt;&gt; &gt; +//<br>
&gt; &gt;&gt; &gt; +// R-Car Gen3 RPC-IF MFD driver<br>
&gt; &gt;&gt; &gt; +//<br>
&gt; &gt;&gt; &gt; +// Author:<br>
&gt; &gt;&gt; &gt; +// &nbsp; Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt; &gt; +//<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +#ifndef __MFD_RENESAS_RPC_H<br>
&gt; &gt;&gt; &gt; +#define __MFD_RENESAS_RPC_H<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/clk.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/io.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/log2.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/mtd/mtd.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/of.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; &gt;&gt; &gt; +#include &lt;linux/reset.h&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;NAK. I have already told you that these #include's
are only <br>
&gt; needed in the<br>
&gt; &gt;&gt; drivers, not in this header.<br>
&gt; &gt; <br>
&gt; &gt; why ?<br>
&gt; <br>
&gt; &nbsp; &nbsp;Why what? As a rule of thumb, we #include only headers
necessary to build<br>
&gt; the file in question.</font></tt>
<br>
<br><tt><font size=2>okay, got your point.</font></tt>
<br><tt><font size=2><br>
thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
<br>
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

--=_alternative 0022E313482583DF_=--
