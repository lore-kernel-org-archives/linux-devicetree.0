Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB49C2BA16
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 06:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FCAD20692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 06:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgDHGHz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 02:07:55 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:44748 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgDHGHz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 02:07:55 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9C4732002C;
        Wed,  8 Apr 2020 08:07:50 +0200 (CEST)
Date:   Wed, 8 Apr 2020 08:07:44 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        robh+dt@kernel.org, thierry.reding@gmail.com,
        christoph.muellner@theobroma-systems.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add binding document
 for Leadtek LTK050H3146W
Message-ID: <20200408060744.GA14965@ravnborg.org>
References: <20200407232351.2547750-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407232351.2547750-1-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=NXpJzYs8AAAA:8
        a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=PNnMyF-q063_3wR0rKAA:9
        a=CjuIK1q_8ugA:10 a=cwV61pgf2j4Cq8VD9hE_:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=pHzHmUro8NiASowvMSCR:22
        a=nt3jZW36AmriUCFCBwmW:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Goodmorning Heiko.

On Wed, Apr 08, 2020 at 01:23:50AM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The LTK050H3146W is a 5.0" 720x1280 DSI display.
> 
> changes in v2:
> - add display variants
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Applied to drm-misc-next.

	Sam

> ---
>  .../display/panel/leadtek,ltk050h3146w.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> new file mode 100644
> index 000000000000..a372bdc5bde1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/leadtek,ltk050h3146w.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Leadtek LTK050H3146W 5.0in 720x1280 DSI panel
> +
> +maintainers:
> +  - Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - leadtek,ltk050h3146w
> +      - leadtek,ltk050h3146w-a2
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  iovcc-supply:
> +     description: regulator that supplies the iovcc voltage
> +  vci-supply:
> +     description: regulator that supplies the vci voltage
> +
> +required:
> +  - compatible
> +  - reg
> +  - backlight
> +  - iovcc-supply
> +  - vci-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "leadtek,ltk050h3146w";
> +            reg = <0>;
> +            backlight = <&backlight>;
> +            iovcc-supply = <&vcc_1v8>;
> +            vci-supply = <&vcc3v3_lcd>;
> +        };
> +    };
> +
> +...
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
