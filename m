Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6799C33CA1
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 00:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EB8622316
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 00:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FIQFJhjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfKSAMp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 19:12:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60876 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSAMo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 19:12:44 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BADA563;
        Tue, 19 Nov 2019 01:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574122362;
        bh=GP7ciNLF5eYh1JLsO7mIhGa5Max5aGk7MjHNaTeyNj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FIQFJhjB+x0+JCrFULqVLROHhIBXIa/3vM+E/rQCPVpwiFb8klbstYT0K/3VdEbcV
         3R4kQTKtrtcnFe1LqihWK0pFXR8l/HdFDnfJ/B20jjm1+7sIWeMqJ4zreJQj/md6ds
         Zi3Q3KXflkjwlotTsPDlxo42m0qwctGr3M/w3ysQ=
Date:   Tue, 19 Nov 2019 02:12:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 11/13] ARM: shmobile_defconfig: Enable support for
 panels from EDT
Message-ID: <20191119001226.GK5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:30PM +0000, Fabrizio Castro wrote:
> The iwg20d comes with an LCD panel from Emerging Display
> Technologies Corporation (EDT), therefore enable what's
> required to support it.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Geert to pick this up.

> ---
> v3->v4:
> * No change
> v2->v3:
> * No change
> v1->v2:
> * No change
> ---
>  arch/arm/configs/shmobile_defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index c6c7035..ab416a5 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -66,6 +66,7 @@ CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_GPIO=y
>  # CONFIG_INPUT_MOUSE is not set
>  CONFIG_INPUT_TOUCHSCREEN=y
> +CONFIG_TOUCHSCREEN_EDT_FT5X06=y
>  CONFIG_TOUCHSCREEN_ST1232=y
>  CONFIG_INPUT_MISC=y
>  CONFIG_INPUT_ADXL34X=y
> @@ -125,7 +126,9 @@ CONFIG_VIDEO_ADV7604=y
>  CONFIG_VIDEO_ML86V7667=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RCAR_DU=y
> +CONFIG_DRM_PANEL_SIMPLE=y
>  CONFIG_DRM_DUMB_VGA_DAC=y
> +CONFIG_DRM_LVDS_CODEC=y
>  CONFIG_DRM_SII902X=y
>  CONFIG_DRM_I2C_ADV7511=y
>  CONFIG_DRM_I2C_ADV7511_AUDIO=y

-- 
Regards,

Laurent Pinchart
