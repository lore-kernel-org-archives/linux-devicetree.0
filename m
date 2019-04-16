Return-Path: <SRS0=NUTy=SS=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <935046cc-e2e5-b9b8-0c94-1be5ae604276@cogentembedded.com>
References: <1555313834-15107-1-git-send-email-masonccyang@mxic.com.tw> <1555313834-15107-2-git-send-email-masonccyang@mxic.com.tw> <935046cc-e2e5-b9b8-0c94-1be5ae604276@cogentembedded.com>
Subject: Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller
 driver
MIME-Version: 1.0
Message-ID: <OF8A9D093C.B3035121-ON482583DE.00065F23-482583DE.00074AC0@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 16 Apr 2019 09:19:38 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00074ABF482583DE_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00074ABF482583DE_=
Content-Type: text/plain; charset="US-ASCII"


Hello,

> Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller 
driver
> 
> The patch name is somewhat misleading -- there's no "MFD controller".

Can't get your point ?

RPC-IF support SPI and HF, it's a MFD controller and
that's why I patch it to MFD as Marek's comments.


> 
> On 04/15/2019 10:37 AM, Mason Yang wrote:
> 
> > Add a driver for Renesas R-Car Gen3 RPC-IF MFD controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> [...]
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 26ad646..7914349 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -978,6 +978,15 @@ config MFD_RDC321X
> >       southbridge which provides access to GPIOs and Watchdog using 
the
> >       southbridge PCI device configuration space.
> > 
> > +config MFD_RENESAS_RPC
> > +   tristate "Renesas R-Car Gen3 RPC-IF MFD driver"
> > +   select MFD_CORE
> > +   depends on ARCH_RENESAS
> > +   help
> > +     This supports for Renesas R-Car Gen3 RPC-IF multifunction device
> 
>    "For" node needed here.

? 

> 
> > +     controller which provides either SPI host controller or 
HyperFlash.
> > +     You have to select individual components under the corresponding 
menu.
> > +
> >  config MFD_RT5033
> >     tristate "Richtek RT5033 Power Management IC"
> >     depends on I2C

> [...]
> > diff --git a/include/linux/mfd/renesas-rpc.h b/include/linux/mfd/
> renesas-rpc.h
> > new file mode 100644
> > index 0000000..61ada14
> > --- /dev/null
> > +++ b/include/linux/mfd/renesas-rpc.h
> > @@ -0,0 +1,153 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (C) 2018 ~ 2019 Renesas Solutions Corp.
> > +// Copyright (C) 2019 Macronix International Co., Ltd.
> > +//
> > +// R-Car Gen3 RPC-IF MFD driver
> > +//
> > +// Author:
> > +//   Mason Yang <masonccyang@mxic.com.tw>
> > +//
> > +
> > +#ifndef __MFD_RENESAS_RPC_H
> > +#define __MFD_RENESAS_RPC_H
> > +
> > +#include <linux/clk.h>
> > +#include <linux/io.h>
> > +#include <linux/log2.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/of.h>
> > +#include <linux/regmap.h>
> > +#include <linux/reset.h>
> 
>    NAK. I have already told you that these #include's are only needed in 
the
> drivers, not in this header.

why ?

I think these #include files are still needed in HyperFlash driver.
i.e,. clk controller, mtd and so on.

> 
>    My idea is to contain all hardware manipulation in the MFD driver,
> with SPI/HF drivers calling that code via a set of APIs declared in 
> this header.
> The registers (declared below) would end up only needed by that 
> common MFD driver...
 
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

--=_alternative 00074ABF482583DE_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br><tt><font size=2><br>
&gt; Re: [PATCH v10 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; The patch name is somewhat misleading -- there's no &quot;MFD controller&quot;.</font></tt>
<br>
<br><tt><font size=2>Can't get your point ?</font></tt>
<br>
<br><tt><font size=2>RPC-IF support SPI and HF, it's a MFD controller and</font></tt>
<br><tt><font size=2>that's why I patch it to MFD as Marek's comments.</font></tt>
<br>
<br><tt><font size=2><br>
&gt; <br>
&gt; On 04/15/2019 10:37 AM, Mason Yang wrote:<br>
&gt; <br>
&gt; &gt; Add a driver for Renesas R-Car Gen3 RPC-IF MFD controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; [...]<br>
&gt; &gt; diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig<br>
&gt; &gt; index 26ad646..7914349 100644<br>
&gt; &gt; --- a/drivers/mfd/Kconfig<br>
&gt; &gt; +++ b/drivers/mfd/Kconfig<br>
&gt; &gt; @@ -978,6 +978,15 @@ config MFD_RDC321X<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; southbridge which provides access to GPIOs
and Watchdog using the<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; southbridge PCI device configuration space.<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; +config MFD_RENESAS_RPC<br>
&gt; &gt; + &nbsp; tristate &quot;Renesas R-Car Gen3 RPC-IF MFD driver&quot;<br>
&gt; &gt; + &nbsp; select MFD_CORE<br>
&gt; &gt; + &nbsp; depends on ARCH_RENESAS<br>
&gt; &gt; + &nbsp; help<br>
&gt; &gt; + &nbsp; &nbsp; This supports for Renesas R-Car Gen3 RPC-IF multifunction
device<br>
&gt; <br>
&gt; &nbsp; &nbsp;&quot;For&quot; node needed here.</font></tt>
<br>
<br><tt><font size=2>? </font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; + &nbsp; &nbsp; controller which provides either SPI host controller
or HyperFlash.<br>
&gt; &gt; + &nbsp; &nbsp; You have to select individual components under
the corresponding menu.<br>
&gt; &gt; +<br>
&gt; &gt; &nbsp;config MFD_RT5033<br>
&gt; &gt; &nbsp; &nbsp; tristate &quot;Richtek RT5033 Power Management
IC&quot;<br>
&gt; &gt; &nbsp; &nbsp; depends on I2C<br>
<br>
&gt; [...]<br>
&gt; &gt; diff --git a/include/linux/mfd/renesas-rpc.h b/include/linux/mfd/<br>
&gt; renesas-rpc.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..61ada14<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/include/linux/mfd/renesas-rpc.h<br>
&gt; &gt; @@ -0,0 +1,153 @@<br>
&gt; &gt; +// SPDX-License-Identifier: GPL-2.0<br>
&gt; &gt; +//<br>
&gt; &gt; +// Copyright (C) 2018 ~ 2019 Renesas Solutions Corp.<br>
&gt; &gt; +// Copyright (C) 2019 Macronix International Co., Ltd.<br>
&gt; &gt; +//<br>
&gt; &gt; +// R-Car Gen3 RPC-IF MFD driver<br>
&gt; &gt; +//<br>
&gt; &gt; +// Author:<br>
&gt; &gt; +// &nbsp; Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; +//<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef __MFD_RENESAS_RPC_H<br>
&gt; &gt; +#define __MFD_RENESAS_RPC_H<br>
&gt; &gt; +<br>
&gt; &gt; +#include &lt;linux/clk.h&gt;<br>
&gt; &gt; +#include &lt;linux/io.h&gt;<br>
&gt; &gt; +#include &lt;linux/log2.h&gt;<br>
&gt; &gt; +#include &lt;linux/iopoll.h&gt;<br>
&gt; &gt; +#include &lt;linux/module.h&gt;<br>
&gt; &gt; +#include &lt;linux/mtd/mtd.h&gt;<br>
&gt; &gt; +#include &lt;linux/platform_device.h&gt;<br>
&gt; &gt; +#include &lt;linux/pm_runtime.h&gt;<br>
&gt; &gt; +#include &lt;linux/of.h&gt;<br>
&gt; &gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; &gt; +#include &lt;linux/reset.h&gt;<br>
&gt; <br>
&gt; &nbsp; &nbsp;NAK. I have already told you that these #include's are
only needed in the<br>
&gt; drivers, not in this header.</font></tt>
<br>
<br><tt><font size=2>why ?</font></tt>
<br>
<br><tt><font size=2>I think these #include files are still needed in HyperFlash
driver.</font></tt>
<br><tt><font size=2>i.e,. clk controller, mtd and so on.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &nbsp; &nbsp;My idea is to contain all hardware manipulation in the
MFD driver,<br>
&gt; with SPI/HF drivers calling that code via a set of APIs declared in
<br>
&gt; this header.<br>
&gt; The registers (declared below) would end up only needed by that <br>
&gt; common MFD driver...<br>
 </font></tt>
<br><tt><font size=2>best regards,</font></tt>
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

--=_alternative 00074ABF482583DE_=--
