Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985D8C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E1C7214D8
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578493296;
	bh=pHZk204jRTsrrG4ljaa9nBcxson6V5DKqUvVTGbmIXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=A8N/66ZIrsUpQPB+CbwkGrYqv16rOyyAB/sDqO1BNATIsfU4WWFOe3ZacEwwWA8bD
	 n8GgZndXKkTBOTxsoxWy1udVbsQWKj+ZyGINAlNBe0uON6sTq2wLp2C1qpPnI2DPVv
	 GUkthjX2/8r1weDoVpTQfjnMPXoJD0HdKyaSgbsY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgAHOVf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 09:21:35 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46451 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgAHOVf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 09:21:35 -0500
Received: by mail-ot1-f67.google.com with SMTP id r9so3670897otp.13
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 06:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oeAm7H9MXTcOn7oMc/cjvjqdocfYyvFvZAivnMFc/sA=;
        b=qO5CgIwuRZJlkZQXRCVkce8ady9/XDlzrVgMaA1tBj8zMWj9VBe0YcmHjL3yyrrW76
         GGKW4kQCpxdQBi2SpojGDt/xW0/pvC4Ja5f7HEjjnFfX6ne9o3wbIXiZ4Z81ZF8UIDAm
         EddB1cbYYcAdT+q/e+pq+aoedFcBhTyD/9zzo/SFG1S7gkSRduLYGTpXLzondwXAsTk+
         WgmaoHkG48sySopa5pwvMG1Lndp6L5KJBhXv1UC6Boq+jiD3W9o6VCXU6FssgMTnt21p
         zk8L4P9nhh4wjD87V+tsPn/YdIZMji7cmsow43PVex8Mwb7FgZzvEVVOFsCMj8yjdgug
         /wSg==
X-Gm-Message-State: APjAAAWBN/RS5dtlo/gp8J7qHfvUp+G2IiJKwszyqLZ+OKWsBRFbWefe
        dx+lr8dP9Ev0KQ3ISwlMWtMolhQ=
X-Google-Smtp-Source: APXvYqwYKo3RqZf1CyqMBFIZFu6RZk+PStedySRss6FeQnPTcTEArz39r/IUx9HhH+8gDU8i2enlRA==
X-Received: by 2002:a05:6830:1047:: with SMTP id b7mr4505626otp.77.1578493293987;
        Wed, 08 Jan 2020 06:21:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g61sm1149199otb.53.2020.01.08.06.21.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 06:21:33 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22001a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 08:21:32 -0600
Date:   Wed, 8 Jan 2020 08:21:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: display: Add Chrontel CH7033 Video
 Encoder binding
Message-ID: <20200108142132.GA4830@bogus>
References: <20191220074914.249281-1-lkundrak@v3.sk>
 <20191220074914.249281-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220074914.249281-3-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 20, 2019 at 08:49:13AM +0100, Lubomir Rintel wrote:
> Add binding document for the Chrontel CH7033 VGA/DVI/HDMI Encoder.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../display/bridge/chrontel,ch7033.yaml       | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> new file mode 100644
> index 0000000000000..f19b336a99c78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +# Copyright (C) 2019 Lubomir Rintel <lkundrak@v3.sk>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/chrontel,ch7033.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chrontel CH7033 Video Encoder Device Tree Bindings
> +
> +maintainers:
> +  - Lubomir Rintel <lkundrak@v3.sk>
> +
> +properties:
> +  compatible:
> +    const: chrontel,ch7033
> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device
> +
> +  ports:
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: |
> +          Video port for RGB input.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          DVI port, should be connected to a node compatible with the
> +          dvi-connector binding.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dvi-connector {
> +        compatible = "dvi-connector";
> +        ddc-i2c-bus = <&twsi5>;
> +        hpd-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
> +        digital;
> +        analog;
> +
> +        port {
> +            dvi_in: endpoint {
> +                remote-endpoint = <&encoder_out>;
> +            };
> +        };
> +    };
> +
> +    vga-dvi-encoder@76 {
> +        compatible = "chrontel,ch7033";
> +        reg = <0x76>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                endpoint {
> +                    remote-endpoint = <&lcd0_rgb_out>;
> +                };
> +            };
> +
> +            encoder_out: port@1 {
> +                reg = <1>;
> +                endpoint {
> +                    remote-endpoint = <&dvi_in>;
> +                };
> +            };
> +
> +        };
> +    };
> -- 
> 2.24.1
> 
