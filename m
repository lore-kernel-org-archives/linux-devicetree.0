From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/2] axs_nand - add driver for NAND controller used on
 Synopsys AXS dev boards
Date: Thu, 09 Apr 2015 23:28:23 +0200
Message-ID: <1428614903.17822.4.camel@x220>
References: <1428483478-22771-1-git-send-email-abrodkin@synopsys.com>
	 <1428483478-22771-2-git-send-email-abrodkin@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428483478-22771-2-git-send-email-abrodkin@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Vineet.Gupta1@synopsys.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Grant Likely <grant.likely@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Francois Bedard <Francois.Bedard@synopsys.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

What happened to 1/2? Whatever that was, I spotted a license mismatch in
this 2/2.

On Wed, 2015-04-08 at 11:57 +0300, Alexey Brodkin wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/axs_nand.c
> @@ -0,0 +1,412 @@
> +/*
> + * Copyright (C) 2014 Synopsys, Inc. (www.synopsys.com)
> + *
> + * Driver for NAND controller on Synopsys AXS development board.
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License v2. See the file COPYING in the main directory of this archive for
> + * more details.
> + */

This states the license of this file is GPL v2.

> +MODULE_LICENSE("GPL");

According to include/linux/module.h this states the license is GPL v2 or
later.


Paul Bolle
