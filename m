Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pd0-f169.google.com ([209.85.192.169]:48807 "EHLO
	mail-pd0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751633Ab3G3Qeg (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 12:34:36 -0400
Received: by mail-pd0-f169.google.com with SMTP id y11so1403473pdj.14
        for <devicetree@vger.kernel.org>; Tue, 30 Jul 2013 09:34:35 -0700 (PDT)
Date: Tue, 30 Jul 2013 09:34:41 -0700
From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 1/4] mtd: nand: gpio: Determine bus width automatically
Message-ID: <20130730163441.GB13634@quad.lixom.net>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 30, 2013 at 03:05:24PM +0400, Alexander Shiyan wrote:
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
>  - chip-delay : chip dependent delay for transferring data from array to
>    read registers (tR).  If not present then a default of 20us is used.
>  - gpio-control-nand,io-sync-reg : A 64-bit physical address for a read

This would break backwards compatibility, something we're now starting to push
back at.

Instead what you can do is add a bank-width-auto property that, if present and
bank-width being absent, will result in the automatic determination of bank
width.


-Olof

