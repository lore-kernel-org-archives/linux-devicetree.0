Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B9FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 04:26:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4572B2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 04:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgFDE0n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 00:26:43 -0400
Received: from bmailout3.hostsharing.net ([176.9.242.62]:51373 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgFDE0m (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 00:26:42 -0400
X-Greylist: delayed 544 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jun 2020 00:26:41 EDT
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 1A940100DA1B3;
        Thu,  4 Jun 2020 06:17:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id AA79527E8AE; Thu,  4 Jun 2020 06:17:32 +0200 (CEST)
Date:   Thu, 4 Jun 2020 06:17:32 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH 3/3] spi: bcm2835: Enable shared interrupt support
Message-ID: <20200604041732.7ijkvad2yadtgjid@wunner.de>
References: <20200604034655.15930-1-f.fainelli@gmail.com>
 <20200604034655.15930-4-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604034655.15930-4-f.fainelli@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 03, 2020 at 08:46:55PM -0700, Florian Fainelli wrote:
> +static const struct of_device_id bcm2835_spi_match[] = {
> +	{ .compatible = "brcm,bcm2835-spi", .data = &bcm2835_spi_interrupt },
> +	{ .compatible = "brcm,bcm2711-spi", .data = &bcm2835_spi_sh_interrupt },
> +	{ .compatible = "brcm,bcm7211-spi", .data = &bcm2835_spi_sh_interrupt },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, bcm2835_spi_match);

Maybe I'm missing something but I think you either have to reverse the
order of the entries in this array or change patch [2/3] to drop
"brcm,bcm2835-spi" from the compatible string:

__of_match_node() iterates over the entries in the array above and
calls __of_device_is_compatible() for each of them, which returns
success if the entry matches any of the device's compatible string.

Because "brcm,bcm2835-spi" is checked first and that string is
present on the controllers with shared interrupt, they're all
deemed not to use shared interrupts.

If you opt so fix this by dropping "brcm,bcm2835-spi" from the
device's compatible strings, then you have to move patch [2/3]
behind patch [3/3].


>  static int bcm2835_spi_probe(struct platform_device *pdev)
>  {
> +	irqreturn_t (*bcm2835_spi_isr_func)(int, void *);

A more succinct alternative is:

	irq_handler_t bcm2835_spi_isr_func;

Otherwise this patch LGTM.

Thanks,

Lukas
