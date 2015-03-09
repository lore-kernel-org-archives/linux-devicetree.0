From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Mon, 9 Mar 2015 10:30:22 -0700
Message-ID: <20150309173022.GS18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <1425731983.2281.6.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425731983.2281.6.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>, sbranden@broadcom.com
List-Id: devicetree@vger.kernel.org

On Sat, Mar 07, 2015 at 01:39:43PM +0100, Paul Bolle wrote:
> Only a license nit.
>=20
> Brian Norris schreef op vr 06-03-2015 om 17:18 [-0800]:
>=20
> > --- /dev/null
> > +++ b/drivers/mtd/nand/brcmstb_nand.c
> > @@ -0,0 +1,2182 @@
> > +/*
> > + * Copyright =A9 2010-2015 Broadcom Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or m=
odify
> > + * it under the terms of the GNU General Public License version 2 =
as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
>=20
> This states the license is GPL v2.
>=20
> > +MODULE_LICENSE("GPL");
>=20
> So you probably want
>    MODULE_LICENSE("GPL v2");
>=20
> here.

Thanks. Fixed.

Brian
