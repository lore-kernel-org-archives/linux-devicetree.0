Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA551C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:43:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 925A32086A
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 19:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfK3Tnp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 14:43:45 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:41986 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfK3Tno (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 14:43:44 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A04EF8064B;
        Sat, 30 Nov 2019 20:43:38 +0100 (CET)
Date:   Sat, 30 Nov 2019 20:43:37 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20191130194337.GE24722@ravnborg.org>
References: <20191119231309.18295-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191119231309.18295-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=gEfo2CItAAAA:8
        a=e5mUnYsNAAAA:8 a=8AirrxEcAAAA:8 a=EuSqJ8UF6EV1JIAApPkA:9
        a=GrvzAp9TOHvJ5VVm:21 a=DjMGIxSI6dMzR4Fk:21 a=CjuIK1q_8ugA:10
        a=AjGcO6oz07-iQ99wixmX:22 a=pAN39diAhXWuPx0-Vjn3:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=sptkURWiP4Gy88Gu7hUp:22
        a=Vxmtnl_E_bksehYqCbjh:22 a=ST-jHhOKWsTCqRlWije3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

Thanks for doing this boring, trivial and tiresome task.

On Tue, Nov 19, 2019 at 05:13:09PM -0600, Rob Herring wrote:
> Convert all the 'simple' panels which either use the single
> 'power-supply' property or don't say and just reference
> simple-panel.txt. In the later case, bindings are clear as to which
> properties are required or unused.
> 
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

So Thierry and I ended up as Maintianes for them all.
I gues thats OK as we look after the panel stuff anyway.

> ---
> We could perhaps consolidate a bunch of these, but I have no idea how 
> accurate some of these are WRT what's required or not. Seems strange 
> that 'backlight' is optional unless the backlight is tied full on for 
> example. If that's the case, then should backlight ever be required?
I do not really follow you here.
Looking through the patch set things looks normal to me.

What do I miss here?


I did not find anything I consider bugs. It is mostly small
inconsistencies.

- Almost all new .yaml files ends with "..."
  Except one file: nec,nl12880b20-05.yaml


- When there is more than one compatible the extra compatible is specified
  in two ways:

  Like this with consts:
    properties:
    +  compatible:
    +    items:
    +      - const: bananapi,lhr050h41
    +      - const: ilitek,ili9881c
    +

  Link this with enum:
    +properties:
    +  compatible:
    +    enum:
    +      - urt,umsh-8596md-t
    +      - urt,umsh-8596md-1t
    +      - urt,umsh-8596md-7t
    +      - urt,umsh-8596md-11t
    +      - urt,umsh-8596md-19t
    +      - urt,umsh-8596md-20t

- My OCD prefer only one method to list more than
  one compatible. Using "enum" syntax above seems to be the common
  case - and the simple syntax.

- In several cases the original binding provided an example
  which is now dropped. Is this on purpose?
  This is very simple examples - so I am happy to see them go.
  They really did not provide anything extra.
  I have mentioned it for some - but I stopped as I think
  they are left out on purpose.
  The changelog should mention this.

- There are some bindings that list a reg property.
  I have noted that their comment is not keept.

- It seems inconsistent what is listed as properties and mandatory.
  Most, but not all, include "enable-gpios: true" in properties.
  And the listed mandatory properties sometimes
  differ even when the description does not give a hint why.
  Maybe this was needed to verify existing bindings?

See a few comments in the following.

	Sam


> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> index 47950fced28d..a5e6735fe34b 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun6i-a31-mipi-dsi.yaml
> @@ -85,7 +85,7 @@ examples:
>          panel@0 {
>                  compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
>                  reg = <0>;
> -                power-gpios = <&pio 1 7 0>; /* PB07 */
> +                power-supply = <&reg>;
>                  reset-gpios = <&r_pio 0 5 1>; /* PL05 */
>                  backlight = <&pwm_bl>;
>          };

This looks like an unrelated change - drop?


> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
> deleted file mode 100644
> index 49e4105378f6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.txt
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,g070vvn01"
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: single regulator to provide the supply voltage
> -
> -Required nodes:
> -- port: Parallel port mapping to connect this display
> -
> -This panel needs single power supply voltage. Its backlight is conntrolled
> -via PWM signal.
This comment is lost. It does not provide much info so the value of the
comment is questionable.

> -
> -Example:
> ---------
> -
> -Example device-tree definition when connected to iMX6Q based board
> -
> -	lcd_panel: lcd-panel {
> -		compatible = "auo,g070vvn01";
> -		backlight = <&backlight_lcd>;
> -		power-supply = <&reg_display>;
> -
> -		port {
> -			lcd_panel_in: endpoint {
> -				remote-endpoint = <&lcd_display_out>;
> -			};
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml
> new file mode 100644
> index 000000000000..6b2bbb2d4e2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,g070vvn01.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,g070vvn01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AU Optronics Corporation 7.0" FHD (800 x 480) TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: auo,g070vvn01
> +
> +  power-supply: true
> +  backlight: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - backlight
> +  - compatible
> +  - port
> +  - power-supply
> +
> +...

The example is lost in the conversion.


> diff --git a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
> deleted file mode 100644
> index 59bb6cd8aa75..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.txt
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,p320hvn03"
> -- power-supply: as specified in the base binding
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml
> new file mode 100644
> index 000000000000..0c0568456392
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,p320hvn03.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,p320hvn03.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AU Optronics Corporation 31.5" FHD (1920x1080) TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: auo,p320hvn03
> +
> +  power-supply: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - port
> +  - power-supply
> +
> +...
This is an example binding that do NOT have enbale-gpios.


> diff --git a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
> deleted file mode 100644
> index cbd9da3f03b1..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.txt
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "auo,t215hvn01"
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml
> new file mode 100644
> index 000000000000..5382d444509d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,t215hvn01.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,t215hvn01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AU Optronics Corporation 21.5" FHD (1920x1080) color TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: auo,t215hvn01
> +
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - power-supply
> +
> +...
This is a sample binding that have enable-gpios.
I am pointing out an inconsistency that I do not know if it matters.

> diff --git a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
> deleted file mode 100644
> index 55183d360032..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "boe,hv070wsa-100"
> -- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
> -- enable-gpios: GPIO pin to enable and disable panel (active high)
The (active high) comments seems like something we should keep.
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -The device node can contain one 'port' child node with one child
> -'endpoint' node, according to the bindings defined in [1]. This
> -node should describe panel's video bus.
> -
> -[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> -
> -Example:
> -
> -	panel: panel {
> -		compatible = "boe,hv070wsa-100";
> -		power-supply = <&vcc_3v3_reg>;
> -		enable-gpios = <&gpd1 3 GPIO_ACTIVE_HIGH>;
> -		port {
> -			panel_ep: endpoint {
> -				remote-endpoint = <&bridge_out_ep>;
> -			};
> -		};
> -	};
The example is missing after the conversion.

> diff --git a/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml
> new file mode 100644
> index 000000000000..d88ec2b42454
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/boe,hv070wsa-100.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/boe,hv070wsa-100.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: boe,hv070wsa-100
> +
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +  port: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +  - port
> +  - power-supply
> +
> +...

> deleted file mode 100644
> index 4a041acb4e18..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Ilitek ILI9881c based MIPI-DSI panels
> -
> -Required properties:
> -  - compatible: must be "ilitek,ili9881c" and one of:
> -    * "bananapi,lhr050h41"
> -  - reg: DSI virtual channel used by that screen
> -  - power-supply: phandle to the power regulator
> -  - reset-gpios: a GPIO phandle for the reset pin
> -
> -Optional properties:
> -  - backlight: phandle to the backlight used
> -
> -Example:
> -panel@0 {
> -	compatible = "bananapi,lhr050h41", "ilitek,ili9881c";
> -	reg = <0>;
> -	power-supply = <&reg_display>;
> -	reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_LOW>; /* PL05 */
> -	backlight = <&pwm_bl>;
> -};
Example are lost.


> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> new file mode 100644
> index 000000000000..473462863b33
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ilitek ILI9881c based MIPI-DSI panels
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: bananapi,lhr050h41
> +      - const: ilitek,ili9881c
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  power-supply: true
> +  backlight: true
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +  - reset-gpios
> +
> +...

> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> deleted file mode 100644
> index 3ab8c7412cf6..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "innolux,p079zca"
> -- reg: DSI virtual channel of the peripheral
The comment for reg seems relevant to keep, but it is lost in the
conversion.

> -- power-supply: phandle of the regulator that provides the supply voltage
> -- enable-gpios: panel enable gpio
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible = "innolux,p079zca";
> -			reg = <0>;
> -			power-supply = <...>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
Example is lost.

> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml
> new file mode 100644
> index 000000000000..539a871fa741
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/innolux,p079zca.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: innolux,p079zca
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +  - reg
> +  - power-supply
> +
> +...

> deleted file mode 100644
> index 513f03466aba..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Required properties:
> -- compatible: should be "innolux,p120zdg-bf1"
> -- power-supply: regulator to provide the supply voltage
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- no-hpd: If HPD isn't hooked up; add this property.
Keep comment?

> -
> -Example:
> -	panel_edp: panel-edp {
> -		compatible = "innolux,p120zdg-bf1";
> -		enable-gpios = <&msmgpio 31 GPIO_ACTIVE_LOW>;
> -		power-supply = <&pm8916_l2>;
> -		backlight = <&backlight>;
> -		no-hpd;
> -	};
Keep example?

> diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
> new file mode 100644
> index 000000000000..d7fbeedfa2b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/innolux,p120zdg-bf1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: innolux,p120zdg-bf1
> +
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +  port: true
> +  no-hpd: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - port
> +  - power-supply
> +
> +...

> diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
> deleted file mode 100644
> index cfefff688614..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "kingdisplay,kd097d04"
> -- reg: DSI virtual channel of the peripheral
Keep comment?

> -- power-supply: phandle of the regulator that provides the supply voltage
> -- enable-gpios: panel enable gpio
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	&mipi_dsi {
> -		panel@0 {
> -			compatible = "kingdisplay,kd097d04";
> -			reg = <0>;
> -			power-supply = <...>;
> -			backlight = <&backlight>;
> -			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
Keep example?

> diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml
> new file mode 100644
> index 000000000000..78b51257d24a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/kingdisplay,kd097d04.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: kingdisplay,kd097d04
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  enable-gpios: true
> +  power-supply: true
> +  backlight: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - enable-gpios
> +  - reg
> +  - power-supply
> +
> +...

> index be7ac666807b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/koe,tx14d24vm1bpa.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "koe,tx14d24vm1bpa"
> -- backlight: phandle of the backlight device attached to the panel
> -- power-supply: single regulator to provide the supply voltage
> -
> -Required nodes:
> -- port: Parallel port mapping to connect this display
> -
> -This panel needs single power supply voltage. Its backlight is conntrolled
> -via PWM signal.
> -
> -Example:
> ---------
> -
> -Example device-tree definition when connected to iMX53 based board
> -
> -	lcd_panel: lcd-panel {
> -		compatible = "koe,tx14d24vm1bpa";
> -		backlight = <&backlight_lcd>;
> -		power-supply = <&reg_3v3>;
> -
> -		port {
> -			lcd_panel_in: endpoint {
> -				remote-endpoint = <&lcd_display_out>;
> -			};
> -		};
> -	};
> -
> -Then one needs to extend the dispX node:
> -
> -	lcd_display: disp1 {
> -
> -		port@1 {
> -			reg = <1>;
> -
> -			lcd_display_out: endpoint {
> -				remote-endpoint = <&lcd_panel_in>;
> -			};
> -		};
> -	};
Keep example?

I have stopped writing "keep example" from now on...
The examples are more or less equal - so they are likely just noise.


> deleted file mode 100644
> index 203b03eefb68..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
> -
> -The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
> -a MIPI-DSI video interface. Its backlight is managed through the DSI link.
> -
> -Required properties:
> -  - compatible: "orisetech,otm8009a"
> -  - reg: the virtual channel number of a DSI peripheral
Keep comment?

> -
> -Optional properties:
> -  - reset-gpios: a GPIO spec for the reset pin (active low).
> -  - power-supply: phandle of the regulator that provides the supply voltage.
> -
> -Example:
> -&dsi {
> -	...
> -	panel@0 {
> -		compatible = "orisetech,otm8009a";
> -		reg = <0>;
> -		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
> -		power-supply = <&v1v8>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> new file mode 100644
> index 000000000000..5e791bcff12b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/orisetech,otm8009a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Orise Tech OTM8009A 3.97" 480x800 TFT LCD panel (MIPI-DSI video mode)
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |
> +  The Orise Tech OTM8009A is a 3.97" 480x800 TFT LCD panel connected using
> +  a MIPI-DSI video interface. Its backlight is managed through the DSI link.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: orisetech,otm8009a
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  power-supply: true
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +
> +...

> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> deleted file mode 100644
> index 37dedf6a6702..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Panasonic 10" WUXGA TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "panasonic,vvx10f034n00"
> -- reg: DSI virtual channel of the peripheral
Keep comment?

> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	mdss_dsi@fd922800 {
> -		panel@0 {
> -			compatible = "panasonic,vvx10f034n00";
> -			reg = <0>;
> -			power-supply = <&vreg_vsp>;
> -			backlight = <&lp8566_wled>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml
> new file mode 100644
> index 000000000000..fe9f7703c068
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panasonic,vvx10f034n00.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panasonic,vvx10f034n00.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Panasonic 10" WUXGA TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: panasonic,vvx10f034n00
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  power-supply: true
> +  backlight: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +
> +...

> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
> deleted file mode 100644
> index cbb79ef3bfc9..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
> -
> -The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> -panel connected using a MIPI-DSI video interface.
> -
> -Required properties:
> -  - compatible: "raydium,rm68200"
> -  - reg: the virtual channel number of a DSI peripheral
Keep comment?

> -
> -Optional properties:
> -  - reset-gpios: a GPIO spec for the reset pin (active low).
> -  - power-supply: phandle of the regulator that provides the supply voltage.
> -  - backlight: phandle of the backlight device attached to the panel.
> -
> -Example:
> -&dsi {
> -	...
> -	panel@0 {
> -		compatible = "raydium,rm68200";
> -		reg = <0>;
> -		reset-gpios = <&gpiof 15 GPIO_ACTIVE_LOW>;
> -		power-supply = <&v1v8>;
> -		backlight = <&pwm_backlight>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> new file mode 100644
> index 000000000000..d8b9321ba2aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raydium,rm68200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raydium Semiconductor Corporation RM68200 5.5" 720p MIPI-DSI TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +description: |+
> +  The Raydium Semiconductor Corporation RM68200 is a 5.5" 720x1280 TFT LCD
> +  panel connected using a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: raydium,rm68200
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  power-supply: true
> +  backlight: true
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +
> +...

> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
> deleted file mode 100644
> index 3770a111968b..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Sharp Microelectronics 4.3" qHD TFT LCD panel
> -
> -Required properties:
> -- compatible: should be "sharp,ls043t1le01-qhd"
> -- reg: DSI virtual channel of the peripheral
Keep comment?

> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties:
> -- backlight: phandle of the backlight device attached to the panel
> -- reset-gpios: a GPIO spec for the reset pin
> -
> -Example:
> -
> -	mdss_dsi@fd922800 {
> -		panel@0 {
> -			compatible = "sharp,ls043t1le01-qhd";
> -			reg = <0>;
> -			avdd-supply = <&pm8941_l22>;
> -			backlight = <&pm8941_wled>;
> -			reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
> new file mode 100644
> index 000000000000..ae0b72866f7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,ls043t1le01.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,ls043t1le01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 4.3" qHD TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Sam Ravnborg <sam@ravnborg.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,ls043t1le01-qhd
> +
> +  reg:
> +    maxItems: 1
> +
> +  port: true
> +  power-supply: true
> +  backlight: true
> +  reset-gpios: true
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-supply
> +
> +...

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d711f764dfb..ff8e38b269d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5431,7 +5431,6 @@ S:	Supported
>  F:	drivers/gpu/drm/fsl-dcu/
>  F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
>  F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
> -F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  
>  DRM DRIVERS FOR FREESCALE IMX

The binding for nec,nl4827hc19-05b.txt should list the original
maintainers:
M:      Stefan Agner <stefan@agner.ch>
M:      Alison Wang <alison.wang@nxp.com>


I did not check all - but the files I checked did not have an explicit
maintainer in MAINTAINERS.

	Sam
