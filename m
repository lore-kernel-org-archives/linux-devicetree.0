Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B32C34342
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A05FD2477A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbfLMS2Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:28:25 -0500
Received: from gloria.sntech.de ([185.11.138.130]:36696 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728807AbfLMS2Z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Dec 2019 13:28:25 -0500
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1ifpfq-0003GI-A5; Fri, 13 Dec 2019 19:28:22 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: Add PX30 CRTCs graph LVDS endpoints
Date:   Fri, 13 Dec 2019 19:28:21 +0100
Message-ID: <1933192.L6hp5CucIl@diego>
In-Reply-To: <20191213181051.25983-11-miquel.raynal@bootlin.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com> <20191213181051.25983-11-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Miquel,

Am Freitag, 13. Dezember 2019, 19:10:49 CET schrieb Miquel Raynal:
> Add the display subsystem routes with the two available CRTCs: vopb
> and vopl (big and little). For each CRTC, add the LVDS endpoints. MIPI
> DSI endpoints will come later.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/rockchip/px30.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> index b2af0f02ecbe..1c96ba556daf 100644
> --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> @@ -190,6 +190,16 @@
>  		compatible = "rockchip,display-subsystem";
>  		ports = <&vopb_out>, <&vopl_out>;
>  		status = "disabled";
> +
> +		route {
> +			route_vopb_lvds: route-vopb-lvds {
> +				connect = <&vopb_out_lvds>;
> +			};
> +
> +			route_vopl_lvds: route-vopl-lvds {
> +				connect = <&vopl_out_lvds>;
> +			};
> +		};

where does this route-stuff come from?
The vendor tree? Because so far I've not seen this in mainline-drm
in general nor the Rockchip drm driver itself.


>  	};
>  
>  	gmac_clkin: external-gmac-clock {
> @@ -976,6 +986,11 @@
>  		vopb_out: port {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			vopb_out_lvds: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&lvds_vopb_in>;
> +			};

This (and the one below) would create dangling phandle references
and compile errors, because the referenced phandles only get introduced
in patch12. So ideally merge this into the last patch.


Heiko

>  		};
>  	};
>  
> @@ -1008,6 +1023,11 @@
>  		vopl_out: port {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			vopl_out_lvds: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&lvds_vopl_in>;
> +			};
>  		};
>  	};
>  
> 




