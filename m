Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FE5C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 19:40:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A2EE2064C
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 19:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X52tyLEz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgGQTkB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 15:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgGQTkA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 15:40:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA8EC0619D2;
        Fri, 17 Jul 2020 12:40:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AABD71D;
        Fri, 17 Jul 2020 21:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595014799;
        bh=btHyfamC2QRyKiifV3QLadgLjSktL0gmpwZBLM5IQDg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X52tyLEzK58YFtlUIQOim++zFKzLTTFRa5xmK+XQMgxpnYRQ+tNydOeMbD40nUDbQ
         IR4c9tXl1HYVx+gZ/tmwb2T7/Ss7UMiK71mcsb2ntkYeQXs6ua21OR6zuWTdfxIR1Q
         gl+QhxJ2/1Ltf9QYyvK1r+YzbddFFH+RCtJrscKE=
Date:   Fri, 17 Jul 2020 22:39:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, bparrot@ti.com
Subject: Re: [PATCH 04/13] dt-bindings: media: ti,cal: Remove sensor from
 example
Message-ID: <20200717193950.GF5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-5-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-5-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:50PM +0200, Jacopo Mondi wrote:
> The newly introduced dt-schema bindings for the ov5640 image
> sensor triggered a warning in the ti,cal.yaml bindings file, which
> has a camera sensor node marked compatible with the sensor.
> 
> As in the example is enough to report a node for the device that
> the bindings is about, and maintaining the sensor node up-to-date
> is a non-necessary burden, remove the image sensor node from the
> ti,cal bindings file.

The sensor node in the example gives a bit more clarity, but it's also
not super important. I'll let Tomi decide if he wants to keep it (and
thus get it fixed), or if he's fine dropping it.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/ti,cal.yaml     | 22 -------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
> index 5e066629287d..fe5c74dd246e 100644
> --- a/Documentation/devicetree/bindings/media/ti,cal.yaml
> +++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
> @@ -177,26 +177,4 @@ examples:
>          };
>      };
> 
> -    i2c {
> -        clock-frequency = <400000>;
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        camera-sensor@3c {
> -               compatible = "ovti,ov5640";
> -               reg = <0x3c>;
> -
> -               clocks = <&clk_ov5640_fixed>;
> -               clock-names = "xclk";
> -
> -               port {
> -                    csi2_cam0: endpoint {
> -                            remote-endpoint = <&csi2_phy0>;
> -                            clock-lanes = <0>;
> -                            data-lanes = <1 2>;
> -                    };
> -               };
> -        };
> -    };
> -
>  ...

-- 
Regards,

Laurent Pinchart
