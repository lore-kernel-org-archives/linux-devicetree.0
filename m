Return-Path: <SRS0=1SIx=BS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708D6C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 21:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42257206CD
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 21:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q1Sj8O6O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgHHV3P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 8 Aug 2020 17:29:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38494 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHV3P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 8 Aug 2020 17:29:15 -0400
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B80C5F9;
        Sat,  8 Aug 2020 23:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596922152;
        bh=f2lHgYf6WYOdvOjrp4CcwlnFt3yP83jWPA/4jt44o1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q1Sj8O6OI3deQzz8+/OtMQNoSbu7Zhod/WXA7cEZBr+Y9D+kmgcSc1feOf+/ELr9a
         VNs6SFRF1BLHjLmACL9w9Qy6ZG5fcffBmFr4wZbNx+mKJyffbJFAMekxxGR3ajU1Qr
         /WsfKgmghVhM+GBDzzukXRKFkHFuk+JE1iMJU5A4=
Date:   Sun, 9 Aug 2020 00:28:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Message-ID: <20200808212858.GV6186@pendragon.ideasonboard.com>
References: <20200807152039.10961-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807152039.10961-1-biju.das.jz@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Fri, Aug 07, 2020 at 04:20:38PM +0100, Biju Das wrote:
> Remove powerdown-gpios property from lvds-receiver node as it results in
> touch controller driver probe failure.
> As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
> voltage for touch panel, LVDS receiver and RGB LCD panel.

If it controls the supply voltage, shouldn't it be modelled as a
regulator ? Dropping it completely would rely on the boot loader
powering the display on and keeping it powered, which isn't very nice.

> Fixes: 6f89dd9e9325 ("ARM: dts: iwg20d-q7-common: Add LCD support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index ebbe1518ef8a..4c8b9a6b0125 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -57,7 +57,6 @@
>  
>  	lvds-receiver {
>  		compatible = "ti,ds90cf384a", "lvds-decoder";
> -		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
>  
>  		ports {
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
