Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAAFC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D084D21655
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 17:57:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCIR5u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 13:57:50 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:55216 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgCIR5u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 13:57:50 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id B293B804F2;
        Mon,  9 Mar 2020 18:57:43 +0100 (CET)
Date:   Mon, 9 Mar 2020 18:57:42 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Phong LE <ple@baylibre.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: bridge: add it66121 bindings
Message-ID: <20200309175742.GB4841@ravnborg.org>
References: <20200309153654.11481-1-ple@baylibre.com>
 <20200309153654.11481-3-ple@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309153654.11481-3-ple@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=IpJZQVW2AAAA:8
        a=gEfo2CItAAAA:8 a=cX5Nq78nYJ3ux5aV4n4A:9 a=_o3i03AVA8FuQwU8:21
        a=XREf6cB9zaPaBULp:21 a=CjuIK1q_8ugA:10 a=IawgGOuG5U0WyFbmm1f5:22
        a=sptkURWiP4Gy88Gu7hUp:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Phong.

On Mon, Mar 09, 2020 at 04:36:53PM +0100, Phong LE wrote:
> Add the ITE bridge HDMI it66121 bindings.

Good to see that you used DT Schema.

> 
> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  .../bindings/display/bridge/ite,it66121.yaml  | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> new file mode 100644
> index 000000000000..f546c0b5a465
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0
For new schemas please use: (GPL-2.0 OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it66121.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE it66121 HDMI bridge Device Tree Bindings
> +
> +maintainers:
> +  - Phong LE <ple@baylibre.com>
> +
> +description: |
> +  The IT66121 is a high-performance and low-power single channel HDMI
> +  transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward compatible
> +  to DVI 1.0 specifications.
> +
> +properties:
> +  compatible:
> +    const: ite,it66121
> +
> +  reg:
> +    maxItems: 1
> +    description: base I2C address of the device
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to active low reset
> +
> +  vrf12-supply:
> +    maxItems: 1
> +    description: Regulator for 1.2V analog core power.
> +
> +  vcn33-supply:
> +    maxItems: 1
> +    description: Regulator for 3.3V digital core power.
> +
> +  vcn18-supply:
> +    maxItems: 1
> +    description: Regulator for 1.8V IO core power.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  pclk-dual-edge:
> +    maxItems: 1
> +    description: enable pclk dual edge mode.
> +
> +  port:
> +    type: object
> +
> +    properties:
> +      endpoint:
> +        type: object
> +        description: |
> +          Input endpoints of the bridge.
> +
> +    required:
> +      - endpoint
> +

Are we missing an additionalProperties: false?
So we do not have other properties than the ones listed here.

	Sam

> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vrf12-supply
> +  - vcn33-supply
> +  - vcn18-supply
> +  - interrupts
> +  - port
> +
> +examples:
> +  - |
> +    i2c6 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      it66121hdmitx: it66121hdmitx@4c {
> +        compatible = "ite,it66121";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&ite_pins_default>;
> +        vcn33-supply = <&mt6358_vcn33_wifi_reg>;
> +        vcn18-supply = <&mt6358_vcn18_reg>;
> +        vrf12-supply = <&mt6358_vrf12_reg>;
> +        reset-gpios = <&pio 160 1 /* GPIO_ACTIVE_LOW */>;
> +        interrupt-parent = <&pio>;
> +        interrupts = <4 8 /* IRQ_TYPE_LEVEL_LOW */>;
> +        reg = <0x4c>;
> +        pclk-dual-edge;
> +
> +        port {
> +          it66121_in: endpoint {
> +            remote-endpoint = <&display_out>;
> +          };
> +        };
> +      };
> +    };
> -- 
> 2.17.1
