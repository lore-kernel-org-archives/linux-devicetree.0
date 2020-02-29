Return-Path: <SRS0=QVf9=4R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65875C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 14:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43A9E246AE
	for <linux-devicetree@archiver.kernel.org>; Sat, 29 Feb 2020 14:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgB2O4j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 29 Feb 2020 09:56:39 -0500
Received: from gloria.sntech.de ([185.11.138.130]:51044 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbgB2O4j (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Feb 2020 09:56:39 -0500
Received: from p508fcd9d.dip0.t-ipconnect.de ([80.143.205.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1j83XX-0003Bd-B4; Sat, 29 Feb 2020 15:56:27 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, christoph.muellner@theobroma-systems.com,
        robin.murphy@arm.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add binding document for Elida KD35T133
Date:   Sat, 29 Feb 2020 15:56:26 +0100
Message-ID: <12676917.Ei69fZKULH@phil>
In-Reply-To: <20200229125052.GB5447@ravnborg.org>
References: <20200225093913.415844-1-heiko@sntech.de> <20200225093913.415844-2-heiko@sntech.de> <20200229125052.GB5447@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

Am Samstag, 29. Februar 2020, 13:50:52 CET schrieb Sam Ravnborg:
> Hi Heiko.
> 
> On Tue, Feb 25, 2020 at 10:39:12AM +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > 
> > The KD35T133 is a 3.5" 320x480 DSI display used in the RK3326-based
> > Odroid Go Advance handheld device.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> One small comment, but anyway:
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  .../display/panel/elida,kd35t133.yaml         | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > new file mode 100644
> > index 000000000000..4bd74eaa61be
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/elida,kd35t133.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Elida KD35T133 3.5in 320x480 DSI panel
> > +
> > +maintainers:
> > +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: elida,kd35t133
> > +  reg: true
> > +  backlight: true
> > +  reset-gpios: true
> > +  iovcc-supply:
> > +     description: regulator that supplies the iovcc voltage
> > +  vdd-supply:
> > +     description: regulator that supplies the vdd voltage
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - backlight
> Is backlight really required? If it is tied to for example vcc then
> there is nothing to express in the DT.

Not sure I follow. On the Odroid Go Advance (device in question)
the backlight is provided by a (adjustable) pwm-backlight.

So of course for probability it is not required by at least to make the
display usable it is ;-)

Heiko

> 
> 	Sam
> 
> > +  - iovcc-supply
> > +  - vdd-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    dsi@ff450000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        panel@0 {
> > +            compatible = "elida,kd35t133";
> > +            reg = <0>;
> > +            backlight = <&backlight>;
> > +            iovcc-supply = <&vcc_1v8>;
> > +            vdd-supply = <&vcc3v3_lcd>;
> > +        };
> > +    };
> > +
> > +...
> 




