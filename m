Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:64392 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750745Ab3G3P47 (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 30 Jul 2013 11:56:59 -0400
Date: Tue, 30 Jul 2013 16:56:04 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/4] mtd: nand: gpio: Determine bus width
 automatically
Message-ID: <20130730155604.GD29859@e106331-lin.cambridge.arm.com>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 30, 2013 at 12:05:24PM +0100, Alexander Shiyan wrote:
> This patch provide automatically determine of NAND bus width if
> "bank-width" parameter is ommited.
> Patch depends on "mtd: nand: fix NAND_BUSWIDTH_AUTO for x16 devices".
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  .../devicetree/bindings/mtd/gpio-control-nand.txt         |  4 ++--
>  drivers/mtd/nand/gpio.c                                   | 15 ++++++++++-----
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> index 36ef07d..2ac14d8 100644
> --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
> @@ -15,8 +15,8 @@ Required properties:
>    optional gpio and may be set to 0 if not present.
>  
>  Optional properties:
> -- bank-width : Width (in bytes) of the device.  If not present, the width
> -  defaults to 1 byte.
> +- bank-width : Width (in bytes) of the device. If not present, the bus width
> +  of the device is determined automatically.

If we're always able to determine the bus width automatically, why would
we ever need to describe it? We should deprecate it instead.

The new binding defines OS behaviour (automatic determination) which is
a property of the OS, not the device. That does not belong in the dt
binding. The old binding implied that not having the bank-width
parameter was equivalent to having a bank-width parameter of 1 byte. If
it's not always possible to probe the width, and some dts somewhere is
relying on the single byte default, we must keep the property.

Thanks,
Mark.
