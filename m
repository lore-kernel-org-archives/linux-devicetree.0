Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15FBC2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7893B2074D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586890723;
	bh=SV4ev16XuzoxdVw5B027/DV8TEDGc3DFruMRrPVhCIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=nqga917GlYSzSJsWnZjCFFhG8mKeawEkyCpGk44JQi2koiCEkwIjlLMrOMxS6M/oZ
	 grHm5T1n1990RNxuaLLHMncn3d5Vd3br3n758yxMUKHMw2VO2SN8NQuE2QO+OfU9YY
	 +OgUCVHrWgTOxbB/aDlJctSHTAt/oWe0QNe5nC2Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504525AbgDNS6l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:58:41 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33758 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504518AbgDNS52 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:57:28 -0400
Received: by mail-ot1-f68.google.com with SMTP id j26so567428ots.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=S4V0K4DXloHPwiW2ZAuipSmnqt0O7XyONIjKHMDXTA8=;
        b=KC3PVtlfyU02Ayxs4iqilV97L/UnkzK+mUQn13DpkkXHxEWlDQfrxeHBo3nHXxCnbQ
         1Hy82KPLM9cVOWDGL2vZqopFfNxoBCHLqcgazFL1xzLure/O0IlzuWItxwgagnijdXaF
         636s6TwzOzrN4dKw5FahFUWDeigyo1c+ioM4ZAzQSWgCW36zq1A2LGIFqlthOq+TgEWN
         vhwvE+HKhTQg+CeQJSI5NnuNaqf4WI0r8pUVENgU20l1lf+7kiHaEw7Wf+ngHTnk5tWm
         4BtQs5BdWMkcMVL2+M4iVoFyORG9Uyg7kZKIZn7B7JuMVmBIvTxLbQeG2nSLAIK592VG
         qskA==
X-Gm-Message-State: AGi0PuZ+9aJG7VFAAGJ5YMQ8UMVrUYklsIBwAuWB9VpSOFeMPwHIDtI/
        s+9vAUhNulPbMqseekzQthSHYt8=
X-Google-Smtp-Source: APiQypKI77UPIxMD8w1IXEHDuJFuSTM92fqT4/xAc4vWPFbAk2SzZ33WE5qLXfrRfERU75j9SKay6w==
X-Received: by 2002:a9d:77d5:: with SMTP id w21mr8197777otl.5.1586890646394;
        Tue, 14 Apr 2020 11:57:26 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j3sm1210071otq.22.2020.04.14.11.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:57:25 -0700 (PDT)
Received: (nullmailer pid 13838 invoked by uid 1000);
        Tue, 14 Apr 2020 18:57:24 -0000
Date:   Tue, 14 Apr 2020 13:57:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 30/36] dt-bindings: display: convert sharp,lq101r1sx01
 to DT Schema
Message-ID: <20200414185724.GA9292@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-31-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-31-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 08, 2020 at 09:51:03PM +0200, Sam Ravnborg wrote:
> This binding describes a panel with a secondary channel.
> 
> v2:
>   - add check for required properties if link2 is present (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sharp,lq101r1sx01.txt       | 49 -----------
>  .../display/panel/sharp,lq101r1sx01.yaml      | 85 +++++++++++++++++++
>  2 files changed, 85 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
> deleted file mode 100644
> index f522bb8e47e1..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.txt
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -Sharp Microelectronics 10.1" WQXGA TFT LCD panel
> -
> -This panel requires a dual-channel DSI host to operate. It supports two modes:
> -- left-right: each channel drives the left or right half of the screen
> -- even-odd: each channel drives the even or odd lines of the screen
> -
> -Each of the DSI channels controls a separate DSI peripheral. The peripheral
> -driven by the first link (DSI-LINK1), left or even, is considered the primary
> -peripheral and controls the device. The 'link2' property contains a phandle
> -to the peripheral driven by the second link (DSI-LINK2, right or odd).
> -
> -Note that in video mode the DSI-LINK1 interface always provides the left/even
> -pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
> -is possible to program either link to drive the left/even or right/odd pixels
> -but for the sake of consistency this binding assumes that the same assignment
> -is chosen as for video mode.
> -
> -Required properties:
> -- compatible: should be "sharp,lq101r1sx01"
> -- reg: DSI virtual channel of the peripheral
> -
> -Required properties (for DSI-LINK1 only):
> -- link2: phandle to the DSI peripheral on the secondary link. Note that the
> -  presence of this property marks the containing node as DSI-LINK1.
> -- power-supply: phandle of the regulator that provides the supply voltage
> -
> -Optional properties (for DSI-LINK1 only):
> -- backlight: phandle of the backlight device attached to the panel
> -
> -Example:
> -
> -	dsi@54300000 {
> -		panel: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -
> -			link2 = <&secondary>;
> -
> -			power-supply = <...>;
> -			backlight = <...>;
> -		};
> -	};
> -
> -	dsi@54400000 {
> -		secondary: panel@0 {
> -			compatible = "sharp,lq101r1sx01";
> -			reg = <0>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> new file mode 100644
> index 000000000000..956608cada77
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,lq101r1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 10.1" WQXGA TFT LCD panel
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +
> +description: |
> +  This panel requires a dual-channel DSI host to operate. It supports two modes:
> +  - left-right: each channel drives the left or right half of the screen
> +  - even-odd: each channel drives the even or odd lines of the screen
> +
> +  Each of the DSI channels controls a separate DSI peripheral. The peripheral
> +  driven by the first link (DSI-LINK1), left or even, is considered the primary
> +  peripheral and controls the device. The 'link2' property contains a phandle
> +  to the peripheral driven by the second link (DSI-LINK2, right or odd).
> +
> +  Note that in video mode the DSI-LINK1 interface always provides the left/even
> +  pixels and DSI-LINK2 always provides the right/odd pixels. In command mode it
> +  is possible to program either link to drive the left/even or right/odd pixels
> +  but for the sake of consistency this binding assumes that the same assignment
> +  is chosen as for video mode.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,lq101r1sx01
> +
> +  reg: true
> +  power-supply: true
> +  backlight: true
> +
> +  link2:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      phandle to the DSI peripheral on the secondary link. Note that the
> +      presence of this property marks the containing node as DSI-LINK1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  required:
> +    - link2
> +then:
> +  required:
> +    - power-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dsi0 {

Probably should put a reg property and unit-address here so the 
dsi-controller schema will match on these.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel: panel@0 {
> +            compatible = "sharp,lq101r1sx01";
> +            reg = <0>;
> +
> +            link2 = <&secondary>;
> +
> +            power-supply = <&power>;
> +            backlight = <&backlight>;
> +        };
> +    };
> +
> +    dsi1 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        secondary: panel@0 {
> +            compatible = "sharp,lq101r1sx01";
> +            reg = <0>;
> +        };
> +    };
> +
> +...
> -- 
> 2.20.1
> 
