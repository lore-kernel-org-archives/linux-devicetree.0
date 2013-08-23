Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37605 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754170Ab3HWTnu (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 15:43:50 -0400
Message-ID: <5217BB73.8050907@wwwdotorg.org>
Date: Fri, 23 Aug 2013 13:43:47 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V3] gpio: New driver for LSI ZEVIO SoCs
References: <1375879989-18606-1-git-send-email-fabian@ritter-vogt.de>
In-Reply-To: <1375879989-18606-1-git-send-email-fabian@ritter-vogt.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Fabian Vogt <fabian@ritter-vogt.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, grant.likely@linaro.org, pawel.moll@arm.com
List-ID: <devicetree@vger.kernel.org>

On 08/07/2013 06:53 AM, Fabian Vogt wrote:
> This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> It has been successfully tested on a TI nspire CX calculator.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zevio.txt b/Documentation/devicetree/bindings/gpio/gpio-zevio.txt

> +Zevio GPIO controller
> +
> +Required properties:
> +- compatible = "lsi,zevio-gpio"

Is there only one zevio chip, or a series? Is "zevio" the full name of
the chip, including any version number?

> +- reg = <BASEADDR SIZE>
> +- #gpio-cells = <2>
> +- gpio-controller;
> +
> +Optional:
> +- #ngpios = <32>: Number of GPIOs. Defaults to 32 if absent

Perhaps one can derive that from the compatible value? The fact this
property exists implies there's more than one zevio chip, so perhaps
each should have an explicit compatible value described above?

Is the GPIO block not also an interrupt source/controller? I see the
following in the patch, and references to some IRQ registers...

> +	select GENERIC_IRQ_CHIP

