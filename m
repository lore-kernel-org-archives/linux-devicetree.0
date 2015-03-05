From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/2] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Date: Thu, 05 Mar 2015 20:13:43 +0100
Message-ID: <1425582823.24292.225.camel@x220>
References: <1425576461-52412-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	 <1425576461-52412-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425576461-52412-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-03-05 at 17:27 +0000, Zubair Lutfullah Kakakhel wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -0,0 +1,359 @@
> +/*
> + * JZ4780 BCH controller
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

So you probably want
    MODULE_LICENSE("GPL");

here.

> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -0,0 +1,373 @@
> +/*
> + * JZ4780 NAND driver
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + */

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL V2");

So, again, you probably want
    MODULE_LICENSE("GPL");

here.

Actually "GPL V2" would taint the kernel on module load.

(This all assumes we're talking about two separate modules here. I don't
speak "Makefile" enough to be sure.)


Paul Bolle
