Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F25C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:29:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0177C2465B
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578173358;
	bh=3F8HVDANPGJIQVBGriQO/lQDfoplMWcL4UlGPr6P6lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Yhq8aIyFBHYBMF5ltsB750Z0SBaxCYIsXMkj0AmUPLUsgBB939d2qnUpCoigEl7U/
	 1glloBHmgeZetakzAyknxoE0U01jLu9p4QauwIJjmN4LYF1NVTqpTFSG22NadgkrTY
	 hQV24V7oumkdPgSAC4rXeF6DvD8NrR0qsBXjCBHY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADV3Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:29:16 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:36302 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgADV3Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:29:16 -0500
Received: by mail-io1-f67.google.com with SMTP id d15so1316067iog.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=acrY0+kOQM/iuVtgKfbOatR4QIHvs7UJPcpx6jaaklw=;
        b=IPlRtLsMx/kHtrZPJFhdqeF+y+Jv7SOBU8THUpzYWiEArCHdugKUw09AXtOFYHOQzS
         H4bW6YcejmemHK8C1zmwgN9YDr4wpXdsdc30EjtWBLZOu57ATRgUBCr6El/m7P8xkCAe
         2kI3kRf6/sWQhgHGCX1gc+jz+wDC5VhEziGfT+SML5fjjXc33Ob88ie5tFTyhE0xVgg0
         GB0FtpzX4zMVhqtbLeRsT5S4GsivfrReHGWNTEibVw+N0YcVMqoYwskjgBdds8PdJyT/
         we4bo5++lYTv+Qz00y7hGTppDJxRq15INjei9Wqrl+JC4vb3zG3EMkkn5FPrVw4pKHXx
         x9nQ==
X-Gm-Message-State: APjAAAUoHzzUEmrR1Sb02lGhBBsrJXtqGk5jIv2K93ZJWC1Gj8aLf9YD
        QMjhnATmg7Jhk8MltvbxG5yibaw=
X-Google-Smtp-Source: APXvYqzSOj4b4HSLBHFujLk7+W7puTZD75G2Gtao66+AAgR6uIcl7flKEQeGcj8HLdeTd4VAiFiabQ==
X-Received: by 2002:a05:6638:6a6:: with SMTP id d6mr75119233jad.132.1578173355738;
        Sat, 04 Jan 2020 13:29:15 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x25sm13725218iol.6.2020.01.04.13.29.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:29:14 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:29:13 -0700
Date:   Sat, 4 Jan 2020 14:29:13 -0700
From:   Rob Herring <robh@kernel.org>
To:     Yuti Amonkar <yamonkar@cadence.com>
Cc:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, maxime@cerno.tech, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, a.hajda@samsung.com,
        narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, praneeth@ti.com,
        jsarha@ti.com, tomi.valkeinen@ti.com, mparab@cadence.com,
        sjakhade@cadence.com
Subject: Re: [PATCH v2 1/3] dt-bindings: drm/bridge: Document Cadence MHDP
 bridge bindings in yaml format
Message-ID: <20200104212913.GA12151@bogus>
References: <1577114202-15970-1-git-send-email-yamonkar@cadence.com>
 <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577114202-15970-2-git-send-email-yamonkar@cadence.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Dec 23, 2019 at 04:16:40PM +0100, Yuti Amonkar wrote:
> Document the bindings used for the Cadence MHDP DPI/DP bridge in
> yaml format.
> 
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> new file mode 100644
> index 0000000..aed6224
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp.yaml
> @@ -0,0 +1,109 @@
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/bridge/cdns,mhdp.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Cadence MHDP bridge
> +
> +maintainers:
> +  - Swapnil Jakhade <sjakhade@cadence.com>
> +  - Yuti Amonkar <yamonkar@cadence.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cdns,mhdp8546
> +      - ti,j721e-mhdp8546
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      DP bridge clock, it's used by the IP to know how to translate a number of
> +      clock cycles into a time (which is used to comply with DP standard timings
> +      and delays).
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description:
> +          Register block of mhdptx apb registers upto PHY mapped area(AUX_CONFIG_P).
> +          The AUX and PMA registers are mapped to associated phy driver.
> +      - description:
> +          Register block for DSS_EDP0_INTG_CFG_VP registers in case of TI J7 SoCs.
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - const: mhdptx
> +      - const: j721e-intg
> +
> +  phys:
> +    description: see the Documentation/devicetree/bindings/phy/phy-cadence-torrent.yaml
> +
> +  phy-names:
> +    const: dpphy
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devicetree/bindings/graph.txt
> +    properties:
> +       '#address-cells':
> +         const: 1
> +       '#size-cells':
> +         const: 0
> +       port@0:

type: object

> +         description:
> +           input port representing the DP bridge input
> +
> +       port@1:

type: object

> +         description:
> +           output port representing the DP bridge output
> +    required:
> +      - port@0
> +      - port@1
> +      - '#address-cells'
> +      - '#size-cells'
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mhdp: dp-bridge@f0fb000000 {
> +        compatible = "cdns,mhdp8546";
> +        reg = <0xf0 0xfb000000 0x0 0x1000000>,
> +              <0xf0 0xfc000000 0x0 0x2000000>;
> +        clocks = <&mhdp_clock>;
> +        phys = <&dp_phy>;
> +        phy-names = "dpphy";
> +
> +        ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              port@0 {
> +                     reg = <0>;
> +                     dp_bridge_input: endpoint {
> +                                    remote-endpoint = <&xxx_dpi_output>;
> +                     };
> +              };
> +
> +              port@1 {
> +                     reg = <1>;
> +                     dp_bridge_output: endpoint {
> +                                     remote-endpoint = <&xxx_dp_connector_input>;
> +                     };
> +              };
> +      };
> +    };
> +...
> -- 
> 2.7.4
> 
