Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389BAC432C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:05:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD33206E1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rLsj2sdL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfLBNFI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:05:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbfLBNFI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:05:08 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D613B309;
        Mon,  2 Dec 2019 14:05:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575291907;
        bh=jpdUZBJ94BkaUSvrghCoziBgf7hZdGXnWFPN0xjfpDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rLsj2sdLye0pP/jjzjSxLcYCOAd9e01HPIgUZtM5w5z22NAxYK10LWcgLDTGeGgAc
         NoIGREOc2e6D3TfGyflpynGabb5K5Vr413Awh4KltJwU01UvePoTUY6SOGsP9Gtg+b
         1ISWWfjXerUX9uVRhQTT5jvrj4Dodi9r6bNqmdII=
Date:   Mon, 2 Dec 2019 15:04:59 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 2/3] ARM: dts: am437x-gp/epos-evm: drop unused panel
 timings
Message-ID: <20191202130459.GH4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-3-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Nov 14, 2019 at 11:39:49AM +0200, Tomi Valkeinen wrote:
> panel-simple now handled panel osd070t1718-19ts, and we no longer need
> the panel timings in the DT file. So remove them.

Should you in that case drop the panel-dpi compatible string too, as the
panel-dpi bindings require panel timings in DT ?

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  arch/arm/boot/dts/am437x-gp-evm.dts  | 16 ----------------
>  arch/arm/boot/dts/am43x-epos-evm.dts | 16 ----------------
>  2 files changed, 32 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
> index 811c8cae315b..040403049cea 100644
> --- a/arch/arm/boot/dts/am437x-gp-evm.dts
> +++ b/arch/arm/boot/dts/am437x-gp-evm.dts
> @@ -91,22 +91,6 @@
>  
>  		backlight = <&lcd_bl>;
>  
> -		panel-timing {
> -			clock-frequency = <33000000>;
> -			hactive = <800>;
> -			vactive = <480>;
> -			hfront-porch = <210>;
> -			hback-porch = <16>;
> -			hsync-len = <30>;
> -			vback-porch = <10>;
> -			vfront-porch = <22>;
> -			vsync-len = <13>;
> -			hsync-active = <0>;
> -			vsync-active = <0>;
> -			de-active = <1>;
> -			pixelclk-active = <1>;
> -		};
> -
>  		port {
>  			lcd_in: endpoint {
>  				remote-endpoint = <&dpi_out>;
> diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
> index 078cb473fa7d..330fce060e8b 100644
> --- a/arch/arm/boot/dts/am43x-epos-evm.dts
> +++ b/arch/arm/boot/dts/am43x-epos-evm.dts
> @@ -47,22 +47,6 @@
>  
>  		backlight = <&lcd_bl>;
>  
> -		panel-timing {
> -			clock-frequency = <33000000>;
> -			hactive = <800>;
> -			vactive = <480>;
> -			hfront-porch = <210>;
> -			hback-porch = <16>;
> -			hsync-len = <30>;
> -			vback-porch = <10>;
> -			vfront-porch = <22>;
> -			vsync-len = <13>;
> -			hsync-active = <0>;
> -			vsync-active = <0>;
> -			de-active = <1>;
> -			pixelclk-active = <1>;
> -		};
> -
>  		port {
>  			lcd_in: endpoint {
>  				remote-endpoint = <&dpi_out>;

-- 
Regards,

Laurent Pinchart
