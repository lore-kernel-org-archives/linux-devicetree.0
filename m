Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDC1C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06BB208E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CLz8ATsR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436501AbgE1VMd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 17:12:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57448 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgE1VMc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 17:12:32 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 858602A8;
        Thu, 28 May 2020 23:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1590700348;
        bh=mBPwghkxCn/U41zxI9xPuO+7LoQVh7Lh56biCkGXlQg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CLz8ATsR9sYMn576TdhXMznzLqdtPWMRJV9YwBHepqQT+e4Nm2JQBViTVVPJ8tjhc
         pedNkvB8zTtsi2pRAOgWBA/vC6ZWlBh/94N6Za9W2Vhe7GYEM2c+Wpr0zb7oowJugC
         rNucBfzOAdbsTAwI8Kjl18NZJVXA7EC6gQrJWk+Y=
Date:   Fri, 29 May 2020 00:12:14 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, airlied@linux.ie, shawnguo@kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: dove: Make the DT compliant with the
 ti,tfp410 binding
Message-ID: <20200528211214.GA14756@pendragon.ideasonboard.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-2-ricardo.canuelo@collabora.com>
 <20200528173755.GA113289@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200528173755.GA113289@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Thu, May 28, 2020 at 11:37:55AM -0600, Rob Herring wrote:
> On Thu, May 14, 2020 at 04:36:09PM +0200, Ricardo Cañuelo wrote:
> > Define a 'ports' node for 'dvi: video@39' and use the proper naming for
> > the powerdown-gpios property to make it compliant with the ti,tfp410
> > binding.
> > 
> > This fills the minimum requirements to meet the binding requirements,
> > port endpoints are not defined.
> 
> Just make 'ports' optional. This isn't really any better unless you add 
> endpoints too.

I wonder how this is supposed to work though. The ti-tfp410 driver will
fail to probe if there's no endpoint. I'd rather already add a node for
the DVI connector and connect it to port@1 of the TFP410.

> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > ---
> >  arch/arm/boot/dts/dove-sbc-a510.dts | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/dove-sbc-a510.dts b/arch/arm/boot/dts/dove-sbc-a510.dts
> > index 2bb85a9b7614..32804c981625 100644
> > --- a/arch/arm/boot/dts/dove-sbc-a510.dts
> > +++ b/arch/arm/boot/dts/dove-sbc-a510.dts
> > @@ -132,7 +132,18 @@
> >  	dvi: video@39 {
> >  		compatible = "ti,tfp410";
> >  		reg = <0x39>;
> > -		powerdown-gpio = <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> > +		powerdown-gpios = <&gpio_ext 3 GPIO_ACTIVE_LOW>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			port@0 {
> > +				reg = <0>;
> > +			};
> > +			port@1 {
> > +				reg = <1>;
> > +			};
> > +		};
> >  	};
> >  };
> >  

-- 
Regards,

Laurent Pinchart
