Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EA7C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 11:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02939205ED
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 11:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B6v1uXZ2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfLDL0I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 06:26:08 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56390 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbfLDL0I (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 06:26:08 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4BQ1C9015599;
        Wed, 4 Dec 2019 05:26:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575458762;
        bh=U9KwFUmtbhKcE0R5rk3qW4+wg7hHP+RvMDN9b8akF6E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=B6v1uXZ2Bb5TkY2O/LztY2GiaAuKpkAVGfEmgcvVXZi6MrWybpCcjQglivQdRovGy
         ZdZmIPn0DmHW5RfWQRkjnoQqqOSBmVcN1tJ3ELz+NF2/fksYeN5cKDIu5StthrcW/C
         nKS0Yzgq+gk5VOnh0YW6WTYoMMT2Y+/i4XBivmME=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4BQ1GJ064727;
        Wed, 4 Dec 2019 05:26:01 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 05:26:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 05:26:00 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4BPvwt123659;
        Wed, 4 Dec 2019 05:25:58 -0600
Subject: Re: [PATCH] ARM: dts: am335x-evmsk: Use drm simple-panel instead of
 tilcdc-panel
To:     Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>,
        <tony@atomide.com>, <bcousson@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <bparrot@ti.com>
References: <20191204105554.14212-1-jsarha@ti.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <1aa8c476-031a-e156-7648-c9740a98e3ee@ti.com>
Date:   Wed, 4 Dec 2019 13:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191204105554.14212-1-jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 04/12/2019 12.55, Jyri Sarha wrote:
> Move to use the new drm panel support in tilcdc together with added
> "newhaven,nhd-4.3-480272ef-atxl"-panel support in drm panel-simple.

Tested-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  arch/arm/boot/dts/am335x-evmsk.dts | 38 ++++++++++--------------------
>  1 file changed, 12 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
> index e28a5b82fdf3..b149e48520b4 100644
> --- a/arch/arm/boot/dts/am335x-evmsk.dts
> +++ b/arch/arm/boot/dts/am335x-evmsk.dts
> @@ -183,36 +183,16 @@
>  	};
>  
>  	panel {
> -		compatible = "ti,tilcdc,panel";
> +		compatible = "newhaven,nhd-4.3-480272ef-atxl";
> +
>  		pinctrl-names = "default", "sleep";
>  		pinctrl-0 = <&lcd_pins_default>;
>  		pinctrl-1 = <&lcd_pins_sleep>;
>  		backlight = <&lcd_bl>;
> -		status = "okay";
> -		panel-info {
> -			ac-bias		= <255>;
> -			ac-bias-intrpt	= <0>;
> -			dma-burst-sz	= <16>;
> -			bpp		= <32>;
> -			fdd		= <0x80>;
> -			sync-edge	= <0>;
> -			sync-ctrl	= <1>;
> -			raster-order	= <0>;
> -			fifo-th		= <0>;
> -		};
> -		display-timings {
> -			480x272 {
> -				hactive		= <480>;
> -				vactive		= <272>;
> -				hback-porch	= <43>;
> -				hfront-porch	= <8>;
> -				hsync-len	= <4>;
> -				vback-porch	= <12>;
> -				vfront-porch	= <4>;
> -				vsync-len	= <10>;
> -				clock-frequency = <9000000>;
> -				hsync-active	= <0>;
> -				vsync-active	= <0>;
> +
> +		port {
> +			panel_0: endpoint@0 {
> +				remote-endpoint = <&lcdc_0>;
>  			};
>  		};
>  	};
> @@ -750,6 +730,12 @@
>  	status = "okay";
>  
>  	blue-and-red-wiring = "crossed";
> +
> +	port {
> +		lcdc_0: endpoint@0 {
> +			remote-endpoint = <&panel_0>;
> +		};
> +	};
>  };
>  
>  &rtc {
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
