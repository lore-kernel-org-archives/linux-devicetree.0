Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB30EC2D0C3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:34:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B9647206EC
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:34:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XB4eZu0l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729414AbfLPSeK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 13:34:10 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38655 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730435AbfLPSJ1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 13:09:27 -0500
Received: by mail-pj1-f65.google.com with SMTP id l4so3327172pjt.5
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=oLhatwVrJ644AorppWAQgibVdhj+hDy5xTYrVrxWuSY=;
        b=XB4eZu0lXjwSCThvHlfv8sQLrCkNqhUeZMxRKCn5ndRQ8BqBL26KJxKGDqYM4cYOyL
         +eKyYt/ih2o4fp9ijgj+CS02oNx5VT0dCy/oWIMKXb6MDVodmNcIDMyHyhb+a1I0vRKY
         oR7u8sgCYdbcgHMObVGab2vjhZP3z4HMVdaKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=oLhatwVrJ644AorppWAQgibVdhj+hDy5xTYrVrxWuSY=;
        b=se75zj5M0OgbS9GKmeOdYNeRv9QwFpjBv83cq/3EMJgZ0JAtHfbSE9Ma6dsISZSq3C
         TjokKRuk1JMp7I7Z9BrmRmii4TwwCXEqHzYHFFqpZq6T7oEdTRyp6GqCkyNP6wRGDgrJ
         hJshPGSipRqphgDDFlzhCoT6d9AcwM8jo5VbiAXQF+el5zn4rmyzhxenYYUGvDrOeJuJ
         U0OMrF1562rzbHrs5jqMv++M6e9GbH2F1TOQFz1w6lDXaTxpODo6WE+4AobG/3Du8UNk
         HbP2JeFpxueubjHBMtd/74+yBx/CL6dpnfdMeuuVuHHdAKFybx+yaKKfo8S8LLjWBwOf
         bbng==
X-Gm-Message-State: APjAAAWh0VfhmIFC5g4SfuXTlTKb5ZxYWpZNOmSHsSSrmnQGG7S03xie
        OB9gLM5voEs8ZyFksCu24DVWiw==
X-Google-Smtp-Source: APXvYqxrawoK5xzsyGWqjq5NJ8kXJHDEnSx6/wihLYKUsFNx+1Lz67ZcYpS5cmyXYR3OGT4jkBDn0w==
X-Received: by 2002:a17:90a:e64b:: with SMTP id ep11mr499838pjb.58.1576519766114;
        Mon, 16 Dec 2019 10:09:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u20sm22883784pgf.29.2019.12.16.10.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:09:25 -0800 (PST)
Message-ID: <5df7c855.1c69fb81.44dfc.29c1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org> <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 10:09:24 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2019-12-15 21:39:01)
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Docum=
entation/devicetree/bindings/usb/qcom,dwc3.yaml
> new file mode 100644
> index 0000000..c8eda58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,msm8996-dwc3
> +          - qcom,msm8998-dwc3
> +          - qcom,sdm845-dwc3
> +      - const: qcom,dwc3
> +
> +  reg:
> +    description: Offset and length of register set for QSCRATCH wrapper
> +    maxItems: 1
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]

Hm... ok. Interesting.

> +
> +  power-domains:
> +    description: specifies a phandle to PM domain provider node
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      A list of phandle and clock-specifier pairs for the clocks
> +      listed in clock-names.
> +    minItems: 3
> +    items:
> +      - description: System Config NOC clock. Not present on "qcom,msm89=
96-dwc3" compatible.
> +      - description: Master/Core clock, have to be >=3D 125 MHz for SS o=
peration and >=3D 60MHz for HS operation
> +      - description: System bus AXI clock. Not present on "qcom,msm8996-=
dwc3" compatible.
> +      - description: Mock utmi clock needed for ITP/SOF generation in ho=
st mode.Its frequency should be 19.2MHz.
> +      - description: Sleep clock, used for wakeup when USB3 core goes in=
to low power mode (U3).
> +
> +  clock-names:
> +    minItems: 3
> +    items:
> +      - const: cfg_noc
> +      - const: core
> +      - const: iface
> +      - const: mock_utmi
> +      - const: sleep

Order matters. Can 'core' and 'iface' come first and then the others
after that? Same comment applies to clocks property.

> +
> +  assigned-clocks:
> +    items:
> +      - description: Phandle to MOCK_UTMI_CLK.
> +      - description: Phandle to MASTER_CLK.
> +
> +  assigned-clock-rates:
> +    description:
> +      Should be 19.2MHz (19200000) for MOCK_UTMI_CLK
> +      >=3D125MHz (125000000) for MASTER_CLK in SS mode
> +      >=3D60MHz (60000000) for MASTER_CLK in HS mode
> +    maxItems: 2
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    description:
> +      Specifies interrupts from controller wrapper used
> +      to wakeup from low power/suspend state. Must contain
> +      one or more entry for interrupt-names property.
> +    items:
> +      - description: The interrupt that is asserted when a wakeup event =
is received on USB2 bus.
> +      - description: The interrupt that is asserted when a wakeup event =
is received on USB3 bus.
> +      - description: Wakeup event on DM line.
> +      - description: Wakeup event on DP line.
> +
> +  interrupt-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    items:
> +      - const: hs_phy_irq
> +      - const: ss_phy_irq
> +      - const: dm_hs_phy_irq
> +      - const: dp_hs_phy_irq
> +
> +  qcom,select-utmi-as-pipe-clk:
> +    description:

Don't these multi-line descriptions need a pipe, | ?

> +      If present, disable USB3 pipe_clk requirement.
> +      Used when dwc3 operates without SSPHY and only
> +      HS/FS/LS modes are supported.
> +    type: boolean
> +
> +# Required child node:
> +
> +patternProperties:
> +  "^dwc3@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A child node must exist to represent the core DWC3 IP block
> +      The content of the node is defined in dwc3.txt.
> +
> +# Phy documentation is provided in the following places:
> +# Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
> +# Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 =
PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names

Are 'interrupts' required?

> +
> +examples:
> +  - |
> +        usb3_0: usb30@a6f8800 {

Should node name be something like 'usb3'? Or is this usb 3.0 so it's
'usb30'?

> +            compatible =3D "qcom,dwc3";
> +            reg =3D <0xa6f8800 0x400>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            ranges;
> +            interrupts =3D <0 131 0>, <0 486 0>, <0 488 0>, <0 489 0>;
> +            interrupt-names =3D "hs_phy_irq", "ss_phy_irq",
> +                    "dm_hs_phy_irq", "dp_hs_phy_irq";
