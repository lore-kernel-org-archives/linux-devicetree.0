From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v3 1/2] pinctrl: Add driver for Alphascale asm9260
 pinctrl
Date: Mon, 06 Apr 2015 09:42:49 +0200
Message-ID: <1428306169.634.51.camel@x220>
References: <1427476243.2334.12.camel@x220>
	 <1428215185-14190-1-git-send-email-linux@rempel-privat.de>
	 <1428215185-14190-2-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1428215185-14190-2-git-send-email-linux@rempel-privat.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

A license nit follows.

On Sun, 2015-04-05 at 08:26 +0200, Oleksij Rempel wrote:
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-asm9260.c
> @@ -0,0 +1,733 @@
> +/*
> + * Pinctrl driver for the Alphascale ASM9260 SoC
> + *
> + * Copyright (c) 2014, Oleksij Rempel <linux@rempel-privat.de>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + */

This states the license of this file is GPL v2.

> +MODULE_LICENSE("GPL");

Your reading of include/linux/module.h (see
https://lkml.org/lkml/2015/4/5/7 ) is incorrect. Because according to
that header "GPL" means
    GNU Public License v2 or later

while "GPL v2" means
    GNU Public License v2

So only "GPL v2" matches what's found in the comment at top of this
file.

Thanks,


Paul Bolle

