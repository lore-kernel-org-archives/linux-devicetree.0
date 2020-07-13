Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A670C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 18:17:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E1DE2076D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 18:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="Hj//nTx3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729826AbgGMSRo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 14:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgGMSRo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 14:17:44 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FB4C061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 11:17:44 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t74so9665846lff.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=re205F3z3WnfkvkgeXz1WwNi629ipzRJD7RAzs2IT/Q=;
        b=Hj//nTx3wiyhyMOG0DRHL40AiUQGiiV0QjLDcfsoYHd0ulVNeUy/HazwItkhkNsoBh
         KedpuoDmmlePxXOAy0PIjnRrUYTRng2WaVkhpy4sWZ4wRtLCF0sqEddfX/oRxCFtXYhX
         b96pvBpx4MoYcGOVPWncW0dX1j6emDUl+0MfUMbIp4SVQOFJmuFMrI1t52LIezxI6kdq
         Z4JDcmG+2BuHalWOz2h/RJ9YWpKryffVOD5iarkiBdZkpDxLNVJQSPy1HpJzPP6uIc4e
         lIRbT/dZPQbroR0KEisFZ1nZHN8qdqQJgqxGSWnCgdmeqabN4UBCedwlEEgUmnXbgV33
         pCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=re205F3z3WnfkvkgeXz1WwNi629ipzRJD7RAzs2IT/Q=;
        b=qp7bO1FXBn2hGJNuioXd1rrVV6sM3N0yo7xfVrDDYkkio6euQuNrR4bnkiVgnLTl8d
         BAnHzTXz0/sUckQdwlDcBb5IE5dSLoizGbBe4kHlJRcZDQcgoLlh8vo6u7mjgHD3ECHm
         piHRUCwguKppT33iVa3cRXiIYEy5mgRl+yPbSr/ocZIkL6uLau9doLpswqicawA0eMv8
         rxqxL/h/iWBNNkaU3GUfIyhq8t8+o8KtuzOBrpk79Uzb9YljqlYqfdpvaYjNuSSL2Zid
         AXTSXj82dx6xuEFpzh+7Fsjm7omsO3vRAx7Jzbjb9BhZsK00xZBG5r42K3EWacLQnHXB
         3zUQ==
X-Gm-Message-State: AOAM532jV8BPcfMpF1RABhfQANrMqiAUj9c2BjvC/YOVmXxzg1d6UVCh
        M7goFxfIVvGmvPqi8h8/IyqT+g==
X-Google-Smtp-Source: ABdhPJyps+72YbhYLSrI/QoXfBHkSCwlUK9RsRzM//V9Gv5XBFs75HmSmpJLl1uYq5z0yokW8JyH+g==
X-Received: by 2002:a19:604f:: with SMTP id p15mr216863lfk.59.1594664262404;
        Mon, 13 Jul 2020 11:17:42 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id e9sm4178332ljn.61.2020.07.13.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:17:41 -0700 (PDT)
Date:   Mon, 13 Jul 2020 20:17:40 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: adv7604: Convert bindings to json-schema
Message-ID: <20200713181740.GO2866302@oden.dyn.berto.se>
References: <20200713111844.528313-1-niklas.soderlund+renesas@ragnatech.se>
 <20200713111844.528313-3-niklas.soderlund+renesas@ragnatech.se>
 <20200713154449.GA256154@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713154449.GA256154@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Thanks for your feedback.

On 2020-07-13 09:44:49 -0600, Rob Herring wrote:
> On Mon, Jul 13, 2020 at 01:18:43PM +0200, Niklas Söderlund wrote:
> > Convert ADV7604 video decoder documentation to json-schema.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../devicetree/bindings/media/i2c/adv7604.txt |  87 ---------
> >  .../bindings/media/i2c/adv7604.yaml           | 171 ++++++++++++++++++
> >  2 files changed, 171 insertions(+), 87 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.txt
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.txt b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> > deleted file mode 100644
> > index 8c7cdc7cd7aaebc8..0000000000000000
> > --- a/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> > +++ /dev/null
> > @@ -1,87 +0,0 @@
> > -* Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> > -
> > -The ADV7604 and ADV7611/12 are multiformat video decoders with an integrated
> > -HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one analog
> > -input, and the ADV7611 has one HDMI input and no analog input. The 7612 is
> > -similar to the 7611 but has 2 HDMI inputs.
> > -
> > -These device tree bindings support the ADV7611/12 only at the moment.
> > -
> > -Required Properties:
> > -
> > -  - compatible: Must contain one of the following
> > -    - "adi,adv7611" for the ADV7611
> > -    - "adi,adv7612" for the ADV7612
> > -
> > -  - reg: I2C slave addresses
> > -    The ADV76xx has up to thirteen 256-byte maps that can be accessed via the
> > -    main I2C ports. Each map has it own I2C address and acts as a standard
> > -    slave device on the I2C bus. The main address is mandatory, others are
> > -    optional and revert to defaults if not specified.
> > -
> > -The device node must contain one 'port' child node per device input and output
> > -port, in accordance with the video interface bindings defined in
> > -Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> > -are numbered as follows.
> > -
> > -  Port			ADV7611    ADV7612
> > -------------------------------------------------------------
> > -  HDMI			0             0, 1
> > -  Digital output	1                2
> > -
> > -The digital output port node must contain at least one endpoint.
> > -
> > -Optional Properties:
> > -
> > -  - hpd-gpios: References to the GPIOs that control the HDMI hot-plug
> > -    detection pins, one per HDMI input. The active flag indicates the GPIO
> > -    level that enables hot-plug detection.
> > -  - reset-gpios: Reference to the GPIO connected to the device's reset pin.
> > -  - default-input: Select which input is selected after reset.
> > -  - reg-names : Names of maps with programmable addresses.
> > -		It can contain any map needing a non-default address.
> > -		Possible maps names are :
> > -		  "main", "avlink", "cec", "infoframe", "esdp", "dpp", "afe",
> > -		  "rep", "edid", "hdmi", "test", "cp", "vdp"
> > -
> > -Optional Endpoint Properties:
> > -
> > -  The following three properties are defined in video-interfaces.txt and are
> > -  valid for source endpoints only.
> > -
> > -  - hsync-active: Horizontal synchronization polarity. Defaults to active low.
> > -  - vsync-active: Vertical synchronization polarity. Defaults to active low.
> > -  - pclk-sample: Pixel clock polarity. Defaults to output on the falling edge.
> > -
> > -  If none of hsync-active, vsync-active and pclk-sample is specified the
> > -  endpoint will use embedded BT.656 synchronization.
> > -
> > -Example:
> > -
> > -	hdmi_receiver@4c {
> > -		compatible = "adi,adv7611";
> > -		/*
> > -		 * The edid page will be accessible @ 0x66 on the I2C bus. All
> > -		 * other maps will retain their default addresses.
> > -		 */
> > -		reg = <0x4c>, <0x66>;
> > -		reg-names = "main", "edid";
> > -
> > -		reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
> > -		hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> > -
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		default-input = <0>;
> > -
> > -		port@0 {
> > -			reg = <0>;
> > -		};
> > -		port@1 {
> > -			reg = <1>;
> > -			hdmi_in: endpoint {
> > -				remote-endpoint = <&ccdc_in>;
> > -			};
> > -		};
> > -	};
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> > new file mode 100644
> > index 0000000000000000..d354fd8e0cc88d93
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
> > @@ -0,0 +1,171 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/adv7604.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADV7604/11/12 video decoder with HDMI receiver
> > +
> > +maintainers:
> > +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > +
> > +description:
> > +  The ADV7604 and ADV7611/12 are multiformat video decoders with an integrated
> > +  HDMI receiver. The ADV7604 has four multiplexed HDMI inputs and one analog
> > +  input, and the ADV7611 has one HDMI input and no analog input. The 7612 is
> > +  similar to the 7611 but has 2 HDMI inputs.
> > +
> > +  These device tree bindings support the ADV7611/12 only at the moment.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - adi,adv7611
> > +        - adi,adv7612
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 13
> > +
> > +  reg-names:
> > +    items:
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> > +      - enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]
> 
> This can be simplified to:
> 
> items:
>   enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]

I tried this at first,

properties:
  reg-names:
    items:
      enum: [ main, avlink, cec, infoframe, esdp, dpp, afe, rep, edid, hdmi, test, cp, vdp ]

But running the dt_binding_check on it fails with,

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/i2c/adv7604.yaml
  CHKDT   Documentation/devicetree/bindings/media/i2c/adv7604.yaml
/mnt/build/linux/Documentation/devicetree/bindings/media/i2c/adv7604.yaml: properties:reg-names:items: {'enum': ['main', 'avlink', 'cec', 'infoframe', 'esdp', 'dpp', 'afe', 'rep', 'edid', 'hdmi', 'test', 'cp', 'vdp']} is not of type 'array'
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/media/i2c/adv7604.example.dts] Error 1
make: *** [Makefile:1334: dt_binding_check] Error 2

What am I missing? I'm using latest master of dt-schema [1] if it makes 
any difference.

1. 1330cddcba757bee ("schemas: Make additionalProperties/unevaluatedProperties explicit")

> 
> (Make items a schema applying to all items, rather than a list)
> 
> Though we may want to enforce 'main' is first with:
> 
> minItems: 1
> maxItems: 13
> items:
>   - const: main
> 
> These 2 can be combined under an 'allOf'.

I also had this idea by dropping main from the list of enums for all but 
the first one. But I can't find any argument for why main needs to go 
first, but I agree it feels like the right thing.

> 
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  hpd-gpios:
> > +    minItems: 1
> > +    description:
> > +      References to the GPIOs that control the HDMI hot-plug detection pins,
> > +      one per HDMI input. The active flag indicates the GPIO level that
> > +      enables hot-plug detection.
> > +
> > +  default-input:
> > +    maxItems: 1
> > +    description:
> > +      Select which input is selected after reset.
> > +
> > +  ports:
> > +    type: object
> > +    description:
> > +      A node containing input and output port nodes with endpoint definitions
> > +      as documented in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,adv7611
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            '#address-cells':
> > +              const: 1
> > +            '#size-cells':
> > +              const: 0
> > +            port@0:
> > +              type: object
> > +              description: Input port
> > +            port@1:
> > +              type: object
> > +              description: Output port
> > +
> > +          required:
> > +            - port@1
> > +
> > +          additionalProperties: false
> > +
> > +      required:
> > +        - ports
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: adi,adv7612
> > +    then:
> > +      properties:
> > +        ports:
> > +          properties:
> > +            '#address-cells':
> > +              const: 1
> > +            '#size-cells':
> > +              const: 0
> > +            port@2:
> > +              type: object
> > +              description: Output port
> > +
> > +          patternProperties:
> > +            "^port@[0-1]$":
> > +              type: object
> > +              description: Input port
> > +
> > +          required:
> > +            - port@2
> > +
> > +          additionalProperties: false
> > +
> > +      required:
> > +        - ports
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            hdmi_receiver@4c {
> > +                    compatible = "adi,adv7611";
> > +                    /*
> > +                     * The edid page will be accessible @ 0x66 on the I2C bus. All
> > +                     * other maps will retain their default addresses.
> > +                     */
> > +                    reg = <0x4c>, <0x66>;
> > +                    reg-names = "main", "edid";
> > +
> > +                    reset-gpios = <&ioexp 0 GPIO_ACTIVE_LOW>;
> > +                    hpd-gpios = <&ioexp 2 GPIO_ACTIVE_HIGH>;
> > +                    default-input = <0>;
> > +
> > +                    ports {
> > +                            #address-cells = <1>;
> > +                            #size-cells = <0>;
> > +
> > +                            port@0 {
> > +                                    reg = <0>;
> > +                            };
> > +
> > +                            port@1 {
> > +                                    reg = <1>;
> > +                                    hdmi_in: endpoint {
> > +                                            remote-endpoint = <&ccdc_in>;
> > +                                    };
> > +                            };
> > +                    };
> > +
> > +
> > +            };
> > +    };
> > -- 
> > 2.27.0
> > 

-- 
Regards,
Niklas Söderlund
