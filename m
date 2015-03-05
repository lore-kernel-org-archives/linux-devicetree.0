From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 8/9] rtc: st: add new driver for ST's LPC RTC
Date: Thu, 5 Mar 2015 08:02:45 +0000
Message-ID: <20150305080245.GA31098@x1>
References: <1425492398-27340-1-git-send-email-lee.jones@linaro.org>
 <1425492398-27340-9-git-send-email-lee.jones@linaro.org>
 <1425497072.2090.4.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425497072.2090.4.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, rtc-linux@googlegroups.com, wim@iguana.be, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux@roeck-us.net, david.paris@st.com, a.zummo@towertech.it
List-Id: devicetree@vger.kernel.org

On Wed, 04 Mar 2015, Paul Bolle wrote:

> Lee Jones schreef op wo 04-03-2015 om 18:06 [+0000]:
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-st-lpc.c
> > @@ -0,0 +1,354 @@
> > +/*
> > + * rtc-st-lpc.c - ST's LPC RTC, powered by the Low Power Timer
> > + *
> > + * Copyright (C) 2014 STMicroelectronics Limited
> > + *
> > + * Author: David Paris <david.paris@st.com> for STMicroelectronics
> > + *         Lee Jones <lee.jones@linaro.org> for STMicroelectronics
> > + *
> > + * Based on the original driver written by Stuart Menefy.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public Licence
> > + * as published by the Free Software Foundation; either version
> > + * 2 of the Licence, or (at your option) any later version.
> > + */
>=20
> This states the license is GPL v2 or later.
>=20
> > +MODULE_LICENSE("GPLv2");
>=20
> This will taint the kernel at module load, won't it? You probably mea=
nt
> "GPL v2", but only
>     MODULE_LICENSE("GPL");
>=20
> correctly matches the license in the comment at the top of this file.=
=20
>=20
> (I assume I missed all this when looking at the v4 series.)

Actually, I've already fixed this along with another typo I found
after resubmitting.  Always the way sadly.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
