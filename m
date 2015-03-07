From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Sat, 07 Mar 2015 13:39:43 +0100
Message-ID: <1425731983.2281.6.camel@tiscali.nl>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
	 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, Ray Jui <rjui@broadcom.com>, Corneliu Doban <cdoban@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>
List-Id: devicetree@vger.kernel.org

Only a license nit.

Brian Norris schreef op vr 06-03-2015 om 17:18 [-0800]:

> --- /dev/null
> +++ b/drivers/mtd/nand/brcmstb_nand.c
> @@ -0,0 +1,2182 @@
> +/*
> + * Copyright =C2=A9 2010-2015 Broadcom Corporation
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */

This states the license is GPL v2.

> +MODULE_LICENSE("GPL");

So you probably want
   MODULE_LICENSE("GPL v2");

here.


Paul Bolle
