Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5DCC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 18:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C3EA21569
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 18:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgAWScr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 13:32:47 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:47974 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgAWScq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 13:32:46 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 5C32120031;
        Thu, 23 Jan 2020 19:32:42 +0100 (CET)
Date:   Thu, 23 Jan 2020 19:32:40 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
        peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com
Subject: Re: [PATCH v8 1/5] dt-bindings: display: ti, k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20200123183240.GD17233@ravnborg.org>
References: <cover.1579553817.git.jsarha@ti.com>
 <048190779ef056f407e812f85e955b6eecdf6cef.1579553817.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048190779ef056f407e812f85e955b6eecdf6cef.1579553817.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=sozttTNsAAAA:8 a=gEfo2CItAAAA:8 a=e5mUnYsNAAAA:8 a=yvRlycOsFd3cc9s2ybcA:9
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=aeg5Gbbo78KNqacMgKqU:22
        a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jyri.

dt_binding_check gives following warning:
 CHECK   Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml: dss@02540000: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dt.yaml: dss@02540000: 'port' is a required property

The ports definition in the yaml file does not looks like
what you have in the other yaml files.

The rest was fine - not other warnings in my build testing.

When you have the above warning fixed then I suggest you apply
the driver to drm-misc-next.
And then handle eventual updates in-tree.

If you lack commit-access I can commit the driver, but you should apply
for commit access theni, allowing you to maintain the driver in the future.

	Sam

On Mon, Jan 20, 2020 at 11:02:20PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
> 
> Version history:
> 
> v2: no change
> 
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
> 
> v4: - Add descriptions to reg and clocks properties
>     - Remove minItems when its value is the same as maxItems value
>     - Remove ports node
> 
> v5: - itemize reg and clocks properties' descriptions
> 
> v6: - Add Reviewed-by: from Rob Herring <robh@kernel.org> and
>       Benoit Parrot <bparrot@ti.com>
> 
> v7: no change
> 
> v8: no change
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> new file mode 100644
> index 000000000000..532bb4794968
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments K2G Display Subsystem
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +description: |
> +  The K2G DSS is an ultra-light version of TI Keystone Display
> +  SubSystem. It has only one output port and video plane. The
> +  output is DPI.
> +
> +properties:
> +  compatible:
> +    const: ti,k2g-dss
> +
> +  reg:
> +    items:
> +      - description: cfg DSS top level
> +      - description: common DISPC common
> +      - description: VID1 video plane 1
> +      - description: OVR1 overlay manager for vp1
> +      - description: VP1 video port 1
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: common
> +      - const: vid1
> +      - const: ovr1
> +      - const: vp1
> +
> +  clocks:
> +    items:
> +      - description: fck DSS functional clock
> +      - description: vp1 Video Port 1 pixel clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: vp1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  port:
> +    type: object
> +    description:
> +      Port as described in Documentation/devictree/bindings/graph.txt.
> +      The DSS DPI output port node
> +
> +  max-memory-bandwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Input memory (from main memory to dispc) bandwidth limit in
> +      bytes per second
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    dss: dss@02540000 {
> +            compatible = "ti,k2g-dss";
> +            reg =   <0x02540000 0x400>,
> +                    <0x02550000 0x1000>,
> +                    <0x02557000 0x1000>,
> +                    <0x0255a800 0x100>,
> +                    <0x0255ac00 0x100>;
> +            reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
> +            clocks =        <&k2g_clks 0x2 0>,
> +                            <&k2g_clks 0x2 1>;
> +            clock-names = "fck", "vp1";
> +            interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
> +
> +            power-domains = <&k2g_pds 0x2>;
> +
> +            max-memory-bandwidth = <230000000>;
> +            ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +                    port@0 {
> +                            dpi_out: endpoint {
> +                                    remote-endpoint = <&sii9022_in>;
> +                            };
> +                    };
> +            };
> +    };
> -- 
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
