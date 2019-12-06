Return-Path: <SRS0=B/fR=Z4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF35C43603
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E64120659
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Dec 2019 15:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbfLFPsE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 10:48:04 -0500
Received: from gloria.sntech.de ([185.11.138.130]:41854 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726251AbfLFPsE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 6 Dec 2019 10:48:04 -0500
Received: from p57b772b2.dip0.t-ipconnect.de ([87.183.114.178] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1idFpp-0003G4-8O; Fri, 06 Dec 2019 16:48:01 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Change RK809 PMIC interrupt polarity
Date:   Fri, 06 Dec 2019 16:48:00 +0100
Message-ID: <3285991.EbEXlA3CnX@phil>
In-Reply-To: <20191206154247.28057-1-miquel.raynal@bootlin.com>
References: <20191206154247.28057-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

Am Freitag, 6. Dezember 2019, 16:42:47 CET schrieb Miquel Raynal:
> PMIC interrupt can be active high or active low depending on BIT(1) of
> the GPIO_INT_CFG pin. The default is 0x1, which means active
> high. Change the polarity in the device tree to reflect the default
> state.
> 
> Without this and with the current code base, the interrupt never stops
> triggering while the MFD driver does not see anything to
> check/clear/mask so after 100000 spurious IRQs, the kernel simply
> desactivates the interrupt:
> 
>         irq 36: nobody cared (try booting with the "irqpoll" option)
>         [...]
>         handlers:
>         [<(____ptrval____)>] irq_default_primary_handler threaded
> 	[<(____ptrval____)>] regmap_irq_thread
>         Disabling IRQ #36
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

*coughs slightly*

mfd: rk808: Set RK817 interrupt polarity to low
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/drivers/mfd/rk808.c?h=for-mfd-next&id=dbd16ef53487084816a20f662423ab543a75fc83

Should be in the current merge window already I guess ;-)

Having this consistent over all rk8xx seemed nicer.


Heiko


> ---
>  arch/arm64/boot/dts/rockchip/px30-evb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30-evb.dts b/arch/arm64/boot/dts/rockchip/px30-evb.dts
> index 869f90cbf0da..a922ea75639d 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-evb.dts
> +++ b/arch/arm64/boot/dts/rockchip/px30-evb.dts
> @@ -138,7 +138,7 @@
>  		compatible = "rockchip,rk809";
>  		reg = <0x20>;
>  		interrupt-parent = <&gpio0>;
> -		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pmic_int>;
>  		rockchip,system-power-controller;
> 




