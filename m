Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAACCC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 23:55:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84BF4206CD
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 23:55:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ocqfy6Xp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBXz6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 19:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgFBXz5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 19:55:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFF8C08C5C0
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 16:55:57 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 001D92A4;
        Wed,  3 Jun 2020 01:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591142155;
        bh=QtC3d2zH8DvFEwa0moDTJilzuumkV/LvgEbTdNULovA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ocqfy6XpPY3bki60FZmXAQnOeRHTXk9yfiZnJYlrxI67ycgpEWcjwt77EMv82uRoJ
         /4eM0GZZgce7hc4XbjxGP5LMItAc0N0QfTkHPbCVkupk/BtT9HePPGR+mJpU6Y6FQi
         +1ofohPyC4dedG6DBkD0OxhjZdwkoV/GybrWBHmU=
Date:   Wed, 3 Jun 2020 02:55:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        xuwei5@hisilicon.com, michal.simek@xilinx.com,
        mcoquelin.stm32@gmail.com, marex@denx.de
Subject: Re: [PATCH v3 3/4] ARM: dts: stm32: make hdmi-transmitter node
 compliant with DT bindings
Message-ID: <20200602235539.GT6547@pendragon.ideasonboard.com>
References: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
 <20200601063308.13045-4-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200601063308.13045-4-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Mon, Jun 01, 2020 at 08:33:07AM +0200, Ricardo Cañuelo wrote:
> Reorder the I2C slave addresses of the hdmi-transmitter node and remove
> the adi,input-style and adi,input-justification properties to meet the
> adi,adv7513 binding requirements.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> index 930202742a3f..b67a21a8698a 100644
> --- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> +++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
> @@ -185,8 +185,8 @@
>  &i2c4 {
>  	hdmi-transmitter@3d {
>  		compatible = "adi,adv7513";
> -		reg = <0x3d>, <0x2d>, <0x4d>, <0x5d>;
> -		reg-names = "main", "cec", "edid", "packet";
> +		reg = <0x3d>, <0x4d>, <0x2d> , <0x5d>;
> +		reg-names = "main", "edid", "cec", "packet";
>  		clocks = <&cec_clock>;
>  		clock-names = "cec";
>  
> @@ -204,8 +204,6 @@
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
