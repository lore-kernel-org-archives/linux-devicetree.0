Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695A9C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63A01205CB
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ybw7Obey"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgENBdw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 21:33:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51416 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENBdw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 21:33:52 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E609F51F;
        Thu, 14 May 2020 03:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589420030;
        bh=olQV28hHjT1F61ZHVAQssh78DJKqK0EnKPb7hDTWAyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ybw7ObeyyX/UNvvYt4wKZezmzBQzYsqj2vRlhUvw92687B6loPRys5DSv681ADazU
         3UnM7OWps7atkCZ6hJ0W9VJ0LjemDIBNEogAF+Ux66QkZ5ywsHUQAh7vDWCFCjVYpr
         QDFZvydxMkVstz26Qyj413pdXGN4OkyKFw3ceMY4=
Date:   Thu, 14 May 2020 04:33:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: Re: [PATCH v2 1/6] arm64: dts: renesas: make hdmi encoder nodes
 compliant with DT bindings
Message-ID: <20200514013343.GA7425@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-2-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200511110611.3142-2-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, May 11, 2020 at 01:06:06PM +0200, Ricardo Cañuelo wrote:
> Small fixes to make these DTs compliant with the adi,adv7511w binding.
> 
> r8a77970-eagle.dts,
> r8a77970-v3msk.dts,
> r8a77980-condor.dts,
> r8a77980-v3hsk.dts,
> r8a77990-ebisu.dts:
>   remove the adi,input-style and adi,input-justification properties.
> 
> r8a77995-draak.dts:
>   Reorder the I2C slave addresses of the hdmi-encoder@39 node and remove
>   the adi,input-style and adi,input-justification properties.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts  | 2 --
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts  | 2 --
>  arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 2 --
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  | 2 --
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts  | 2 --
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts  | 6 ++----
>  6 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 2afb91ec9c8d..ac2156ab3e62 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -137,8 +137,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> index d7c7b9156e08..01c4ba0f7be1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -150,8 +150,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> index 3dde028e22a6..ef8350a062af 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
> @@ -174,8 +174,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> index adbfd8f07d06..6dff04693223 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> @@ -141,8 +141,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 4fd2b14fbb8b..dc24cec46ae1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -360,8 +360,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> index 67634cb01d6b..79c73a99d2fe 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -272,8 +272,8 @@
>  
>  	hdmi-encoder@39 {
>  		compatible = "adi,adv7511w";
> -		reg = <0x39>, <0x3f>, <0x38>, <0x3c>;
> -		reg-names = "main", "edid", "packet", "cec";
> +		reg = <0x39>, <0x3f>, <0x3c>, <0x38>;
> +		reg-names = "main", "edid", "cec", "packet";
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
>  
> @@ -284,8 +284,6 @@
>  		adi,input-depth = <8>;
>  		adi,input-colorspace = "rgb";
>  		adi,input-clock = "1x";
> -		adi,input-style = <1>;
> -		adi,input-justification = "evenly";
>  
>  		ports {
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
