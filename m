Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA81C7E09F
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 427052480D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfLMSiv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:38:51 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52819 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbfLMSiv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 13:38:51 -0500
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 75350C0002;
        Fri, 13 Dec 2019 18:38:47 +0000 (UTC)
Date:   Fri, 13 Dec 2019 19:38:46 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
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
Subject: Re: [PATCH 10/12] arm64: dts: rockchip: Add PX30 CRTCs graph LVDS
 endpoints
Message-ID: <20191213193846.5d28cc97@xps13>
In-Reply-To: <1933192.L6hp5CucIl@diego>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
        <20191213181051.25983-11-miquel.raynal@bootlin.com>
        <1933192.L6hp5CucIl@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Heiko,

Heiko Stübner <heiko@sntech.de> wrote on Fri, 13 Dec 2019 19:28:21
+0100:

> Hi Miquel,
> 
> Am Freitag, 13. Dezember 2019, 19:10:49 CET schrieb Miquel Raynal:
> > Add the display subsystem routes with the two available CRTCs: vopb
> > and vopl (big and little). For each CRTC, add the LVDS endpoints. MIPI
> > DSI endpoints will come later.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/px30.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > index b2af0f02ecbe..1c96ba556daf 100644
> > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > @@ -190,6 +190,16 @@
> >  		compatible = "rockchip,display-subsystem";
> >  		ports = <&vopb_out>, <&vopl_out>;
> >  		status = "disabled";
> > +
> > +		route {
> > +			route_vopb_lvds: route-vopb-lvds {
> > +				connect = <&vopb_out_lvds>;
> > +			};
> > +
> > +			route_vopl_lvds: route-vopl-lvds {
> > +				connect = <&vopl_out_lvds>;
> > +			};
> > +		};  
> 
> where does this route-stuff come from?
> The vendor tree? Because so far I've not seen this in mainline-drm
> in general nor the Rockchip drm driver itself.

Yes it comes from the vendor tree, I added a few things from the vendor
tree in the "I really want this panel to work" phase and I forgot to
check if it could be removed, I'll probably drop this.
 
> 
> 
> >  	};
> >  
> >  	gmac_clkin: external-gmac-clock {
> > @@ -976,6 +986,11 @@
> >  		vopb_out: port {
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> > +
> > +			vopb_out_lvds: endpoint@0 {
> > +				reg = <0>;
> > +				remote-endpoint = <&lvds_vopb_in>;
> > +			};  
> 
> This (and the one below) would create dangling phandle references
> and compile errors, because the referenced phandles only get introduced
> in patch12. So ideally merge this into the last patch.

Actually patch 12 also references these nodes so I should merge them.

> 
> 
> Heiko
> 
> >  		};
> >  	};
> >  
> > @@ -1008,6 +1023,11 @@
> >  		vopl_out: port {
> >  			#address-cells = <1>;
> >  			#size-cells = <0>;
> > +
> > +			vopl_out_lvds: endpoint@0 {
> > +				reg = <0>;
> > +				remote-endpoint = <&lvds_vopl_in>;
> > +			};
> >  		};
> >  	};
> >  
> >   
> 
> 
> 
> 

Thanks for the review!
Miquèl
