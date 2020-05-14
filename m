Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D4EC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA2272054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 01:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u35Xn5TG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgENBgb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 21:36:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51450 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgENBga (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 21:36:30 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9DD251F;
        Thu, 14 May 2020 03:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589420189;
        bh=ruaosMjEGymTCOyQ3kMWp7Sns7XqR9lnoEYcbipeJeM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u35Xn5TGdM8H5ZnWIfLPOWIBuH609Awkt4Zzl1wmTSCiqC/NMGAEWnBXBpblzs+Le
         vlwPz2r36WRo57GEkOY/RhL0dwQaXrOnMeTPW1140LI+bgo20MygWPei4pze0cITY5
         r1Sosg7m+/EivbShg5490woKvsroh1LxKH2RXq4k=
Date:   Thu, 14 May 2020 04:36:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        geert+renesas@glider.be, robh+dt@kernel.org, xuwei5@hisilicon.com,
        Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 3/6] ARM: dts: zynq: add port definitions to hdmi-tx@39
Message-ID: <20200514013622.GC7425@pendragon.ideasonboard.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-4-ricardo.canuelo@collabora.com>
 <28fa96d51523448656c71656dc80177d08c481ed.camel@collabora.com>
 <9d3a0eea-578d-3138-f386-a3f47fed4233@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d3a0eea-578d-3138-f386-a3f47fed4233@xilinx.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

On Mon, May 11, 2020 at 02:52:50PM +0200, Michal Simek wrote:
> On 11. 05. 20 14:24, Ezequiel Garcia wrote:
> > (Adding Michal)
> > 
> > On Mon, 2020-05-11 at 13:06 +0200, Ricardo Cañuelo wrote:
> >> Define a 'ports' node for 'adv7511: hdmi-tx@39' to make it compliant with
> >> the adi,adv7511 DT binding.
> >>
> >> This fills the minimum requirements to meet the binding requirements,
> >> remote endpoints are not defined.
> >>
> >> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> >> ---
> >>  arch/arm/boot/dts/zynq-zc702.dts | 10 ++++++++++
> >>  arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
> >>  2 files changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
> >> index 27cd6cb52f1b..79fd236edded 100644
> >> --- a/arch/arm/boot/dts/zynq-zc702.dts
> >> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> >> @@ -135,6 +135,16 @@
> >>  				adi,input-clock = "1x";
> >>  				adi,input-style = <3>;
> >>  				adi,input-justification = "right";
> >> +				ports {
> >> +					#address-cells = <1>;
> >> +					#size-cells = <0>;
> >> +					port@0 {
> >> +						reg = <0>;
> >> +					};
> >> +					port@1 {
> >> +						reg = <1>;
> >> +					};
> >> +				};
> >>  			};
> >>  		};
> >>  
> >> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
> >> index 77943c16d33f..99fa51ba6e93 100644
> >> --- a/arch/arm/boot/dts/zynq-zc706.dts
> >> +++ b/arch/arm/boot/dts/zynq-zc706.dts
> >> @@ -93,6 +93,16 @@
> >>  				adi,input-clock = "1x";
> >>  				adi,input-style = <3>;
> >>  				adi,input-justification = "evenly";
> >> +				ports {
> >> +					#address-cells = <1>;
> >> +					#size-cells = <0>;
> >> +					port@0 {
> >> +						reg = <0>;
> >> +					};
> >> +					port@1 {
> >> +						reg = <1>;
> >> +					};
> >> +				};
> >>  			};
> >>  		};
> >>  
> 
> Just c&p Laurent's reply to Ricardo about it.
> 
> "Completing the board definition is best I believe. Sometimes the
> endpoint is related to an add-on board that isn't described as part of
> the base DTS. The ports are required as they describe hardware
> interfaces, but having no endpoint in a port shouldn't be a problem, it
> just means the port is not connected."
> 
> I am ok with it too that's why
> 
> Acked-by: Michal Simek <michal.simek@xilinx.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
