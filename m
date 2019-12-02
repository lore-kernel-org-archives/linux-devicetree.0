Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75041C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41B8E2073C
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 13:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nIbIj2PO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLBNBj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 08:01:39 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfLBNBj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 08:01:39 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D718309;
        Mon,  2 Dec 2019 14:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575291697;
        bh=WYmra6jda+Fp8NOdE5uzn+oGXn851nCErVz2IiLcgxA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nIbIj2POuyZeAMi5k6PheqcZfLAavfLvEMEus7Cs7/Xyxl7ZXPI33YgTrgqT6O3kv
         3cFP+VG3F+s/yLhV6BxubaRm68MKmJG175CTynEeMwJRaHr6XOIqtD5UImdSWOvGuy
         e5FU0OsETy9qXVdLv4iPFmR7H3CYQrT0febZBnB4=
Date:   Mon, 2 Dec 2019 15:01:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/3] ARM: dts: am437x-gp/epos-evm: fix panel compatible
Message-ID: <20191202130129.GG4929@pendragon.ideasonboard.com>
References: <20191114093950.4101-1-tomi.valkeinen@ti.com>
 <20191114093950.4101-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114093950.4101-2-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Nov 14, 2019 at 11:39:48AM +0200, Tomi Valkeinen wrote:
> The LCD panel on AM4 GP EVMs and ePOS boards seems to be
> osd070t1718-19ts. The current dts files say osd057T0559-34ts. Possibly
> the panel has changed since the early EVMs, or there has been a mistake
> with the panel type.
> 
> Update the DT files accordingly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/am437x-gp-evm.dts  | 2 +-
>  arch/arm/boot/dts/am43x-epos-evm.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/am437x-gp-evm.dts b/arch/arm/boot/dts/am437x-gp-evm.dts
> index cae4500194fe..811c8cae315b 100644
> --- a/arch/arm/boot/dts/am437x-gp-evm.dts
> +++ b/arch/arm/boot/dts/am437x-gp-evm.dts
> @@ -86,7 +86,7 @@
>  		};
>  
>  	lcd0: display {
> -		compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
> +		compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
>  		label = "lcd";
>  
>  		backlight = <&lcd_bl>;
> diff --git a/arch/arm/boot/dts/am43x-epos-evm.dts b/arch/arm/boot/dts/am43x-epos-evm.dts
> index 95314121d111..078cb473fa7d 100644
> --- a/arch/arm/boot/dts/am43x-epos-evm.dts
> +++ b/arch/arm/boot/dts/am43x-epos-evm.dts
> @@ -42,7 +42,7 @@
>  	};
>  
>  	lcd0: display {
> -		compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
> +		compatible = "osddisplays,osd070t1718-19ts", "panel-dpi";
>  		label = "lcd";
>  
>  		backlight = <&lcd_bl>;

-- 
Regards,

Laurent Pinchart
