Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E6C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 23:15:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D51320675
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 23:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589238958;
	bh=0WD07eVJDccvKgwXpv29f73hxoJvwzknlIqZQ9cEYeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Oqiooko4jPErCQgWVt20Rimia0IP7r9GmE6UzwQk7e+QKuoTj226t38qRDApP1GdR
	 Y5oB1sbTxSw6fS2Qjh3NUdEcjK07wpWr6WWL+ulL8ltmWkn0gsKiu2zP/ZMqWoRZfB
	 vo3KiCpHVxtrkHm9CVsE+OAF5XlIdx5VoFt9G/1g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgEKXP6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 19:15:58 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39429 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgEKXP5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 19:15:57 -0400
Received: by mail-oi1-f196.google.com with SMTP id b18so16650646oic.6
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 16:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WzMRJJiJS3jDKX4S6UKZJHW30saEkCLvSAVigDiDovQ=;
        b=rSdPlTy1IdiK1tx3v5PTSSVKOvHHCjgZPzFt20VTMyMxq4SNrc8vRM2J11fnNAABGo
         XAi5tv1KKmNnQF1judAHgfm3XHXrxur0FeF29lmMY6eWX3QjtoZ7ONHWYF1UNx9vL52O
         pfrHlHo14Wv/ElPKpgmublPQzoBfXH2Conc9zhghq+gT9PIg6xYZ/EjrSuRLXFj+KEUZ
         3aRvm6rv8BG36sfnmkqOJKdv/umJLtjKIz6qJ8CFok1FobNSGdHZW1BAeTteUCqhaCSC
         stCinMh/5C2AbzFxiM3huVQcKn4eqHazWv6U1RYvwAaIBYr0rl0zm19aL4bWwm69u4rI
         8gEw==
X-Gm-Message-State: AGi0PuYr/+GOM0fKBr9rfH/yD+ylwfNoVgfRIiLO6iWr8NZNYFL+zmEA
        SADIewOwNQAcNsn4nZghWLjPP54=
X-Google-Smtp-Source: APiQypLm7tq7BIUCDIvc1psG46O7o0EE7PfK0l+06rc9tI2PZnMBjqKgzAYy/l5gUlzlKgNaz05R5Q==
X-Received: by 2002:aca:75c3:: with SMTP id q186mr20355965oic.41.1589238956239;
        Mon, 11 May 2020 16:15:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 33sm2827163otx.31.2020.05.11.16.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:15:55 -0700 (PDT)
Received: (nullmailer pid 18639 invoked by uid 1000);
        Mon, 11 May 2020 23:15:54 -0000
Date:   Mon, 11 May 2020 18:15:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, devicetree@vger.kernel.org,
        kernel@collabora.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] dt-bindings: display: anx7814.txt: convert to yaml
Message-ID: <20200511231554.GA12152@bogus>
References: <20200427100908.11809-1-ricardo.canuelo@collabora.com>
 <676aaa45-b4cb-104e-de37-2508f0ab634d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <676aaa45-b4cb-104e-de37-2508f0ab634d@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Apr 27, 2020 at 03:52:44PM +0200, Enric Balletbo i Serra wrote:
> Hi Ricardo,
> 
> Thank you for your patch.
> 
> On 27/4/20 12:09, Ricardo Cañuelo wrote:
> > This converts the Analogix ANX7814 bridge DT binding to yaml. Port
> > definitions and descriptions were expanded, apart from that it's a
> > direct translation from the original binding.
> > 
> > Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > Changes in v3 (suggested by Sam Ravnborg):
> >   - Rename example node i2c0 to i2c.
> > 
> > Changes in v2 (suggested by Enric Balletbo):
> >   - File name change: use full compatible string.
> >   - Binding description removed.
> >   - #address-cells and #size-cells properties removed from ports node.
> >   - Example node renamed: anx7814 -> bridge.
> > 
> > Tested with:
> > make dt_binding_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>
> > make dtbs_check ARCH=arm64 DT_SCHEMA_FILES=<.../analogix,anx7814.yaml>
> > 
> >  .../display/bridge/analogix,anx7814.yaml      | 124 ++++++++++++++++++
> >  .../bindings/display/bridge/anx7814.txt       |  42 ------
> >  2 files changed, 124 insertions(+), 42 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/anx7814.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > new file mode 100644
> > index 000000000000..13f0b52edefd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > @@ -0,0 +1,124 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/analogix,anx7814.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> > +
> > +maintainers:
> > +  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - analogix,anx7808
> > +      - analogix,anx7812
> > +      - analogix,anx7814
> > +      - analogix,anx7818
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C address of the device.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: Should contain the INTP interrupt.
> > +
> > +  hpd-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for hpd.
> > +
> > +  pd-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for power down.
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: Which GPIO to use for reset.
> > +
> > +  dvdd10-supply:
> > +    maxItems: 1
> > +    description: Regulator for 1.0V digital core power.
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing input and output port nodes with endpoint
> > +      definitions as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +      Documentation/devicetree/bindings/graph.txt
> > +
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Video port for HDMI input.
> > +
> > +        properties:
> > +          reg:
> > +            const: 0
> > +
> > +      port@1:
> > +        type: object
> > +        description:
> > +          Video port for SlimPort, DisplayPort, eDP or MyDP output.
> > +
> > +        properties:
> > +          reg:
> > +            const: 1
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> 
> See below ...
> 
> > +  - hpd-gpios
> > +  - pd-gpios
> > +  - reset-gpios
> 
> I know that these gpio attributes were required in the old binding and the
> driver handles these gpios as required, but assuming that we should really
> describe the hardware _not_ the driver, strictly talking, none of these gpios
> are really required. The same happens with the interrupt, you can left the pin
> floating and poll the registers.
> 
> So I am wondering if you should remove interrupts, *-gpios from required. Maybe
> Rob Herring can give us more light on this?

Agreed.

One step further is hpd-gpios should be deprecated as it should be in a 
connector node.

> 
> Other than that:
> 
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 
> Thanks,
>  Enric
> 
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        anx7814: bridge@38 {
> > +            compatible = "analogix,anx7814";
> > +            reg = <0x38>;
> > +            interrupt-parent = <&gpio0>;
> > +            interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
> > +            hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
> > +            pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
> > +            reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +                    anx7814_in: endpoint {
> > +                        remote-endpoint = <&hdmi0_out>;
> > +                    };
> > +                };
> > +
> > +                port@1 {
> > +                    reg = <1>;
> > +                    anx7814_out: endpoint {
> > +                        remote-endpoint = <&edp_out>;
> > +                    };
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
