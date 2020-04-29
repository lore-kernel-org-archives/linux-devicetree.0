Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33425C83004
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 18:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C08D20B1F
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 18:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pa4LWoXe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgD2S7g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 14:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726554AbgD2S7g (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 14:59:36 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A62C035494
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 11:59:36 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f8so1181742plt.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5T+EXrxP7lWEQxoVx8+oLDKkl3t74DvI2pCLas6bET0=;
        b=Pa4LWoXeMo4fJxrX/bASaPmAPGwFdkXd6wuTDoCLSvfVXScLl3XKsRFS5VFHMGj05/
         s7doZFZuDSYnbvXXIy4maWStVP+lLZzTQPgMZrPWNELweKdCLR1S7W2Ce59O2HxX8vNl
         gzxp/ogWtlpgt3POi9LokpFMn3dC8FsL1VFqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5T+EXrxP7lWEQxoVx8+oLDKkl3t74DvI2pCLas6bET0=;
        b=btyzyd6McxB9pOQXHU7eFB47Vbc5Qc5bMKW7JJBvFsI7cajauXXz8xiqGZ/D9EUOWz
         vURLxHqZcCE9jI/vs/8lnsbtofNjb245R2DUe4yzC3YGG8+GkV5G3LW128gRgg3vqkbb
         kEEth1qQwldsv0wmgcUDdPZ1oskKC/t+FJw0tDu/NQWpbCiEN7ICxz/u48xPApxPeW8v
         HzT6E3zG7jPopI1JZVYZb3bh+koC3eOPHU2z7j75fAGD3JUeIJz94Y4oK4O9pu+a7/6H
         +QvLuWt4htNIOgkU1g8wEEF8E+r9oO9tTC3yxBrWCIoV0I6UtOJiruL3Niy2G553rfF8
         VHhA==
X-Gm-Message-State: AGi0PuabY6qOpiZhiN1tAnbjoRMi03IyXt10kOdObDlAdLNXIPF/Sz1t
        ZT81L9tVpbv0351AvDmM5i/tLC5o+Vs=
X-Google-Smtp-Source: APiQypLGjxmoYOQYHORM/I4sB5Dc2jR592KUVDa5lfftZ+KXwPA/jfCzTy6Cgz7QCEdZ2o9p/MKB0g==
X-Received: by 2002:a17:90b:297:: with SMTP id az23mr4731753pjb.85.1588186775689;
        Wed, 29 Apr 2020 11:59:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id o99sm46973pjo.8.2020.04.29.11.59.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 11:59:34 -0700 (PDT)
Date:   Wed, 29 Apr 2020 11:59:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v6 2/4] dt-bindings: phy: qcom,qmp-usb3-dp: Add dt
 bindings for USB3 DP PHY
Message-ID: <20200429185933.GT4525@google.com>
References: <1588082775-19959-1-git-send-email-sanm@codeaurora.org>
 <1588082775-19959-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588082775-19959-3-git-send-email-sanm@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sandeep,

This is a bit misleading/confusing. Patch "1/4] dt-bindings: phy: qcom,qmp:
Convert QMP PHY bindings to yaml" does the conversion to yaml AND removes
the binding for USB3 DP PHY, then this patch adds it again. Patches should
be self-contained and their commit messages shouldn't omit important details.
If the first patch is applied in isolation the USB3 DP PHY binding disappears
silently, supposedly with the approval from Rob, who reviewed an earlier
version of the patch without the removal.

I think there are two options:

1) one patch with the (complete) conversion to a single yaml file, plus
   a separate patch that moves the DP PHY binding to its own file

2) a single patch which does the conversion to yaml and moves the DP PHY
   binding to its own file

IMO 1) is slightly better, but both should be ok.

Thanks

Matthias

On Tue, Apr 28, 2020 at 07:36:13PM +0530, Sandeep Maheswaram wrote:
> Split out the dt bindings for USB3 DP PHY from qcom,qmp bindings
> for modularity.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         | 135 +++++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> new file mode 100644
> index 0000000..6055786
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-usb3-dp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP USB3 DP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    const:
> +      qcom,sdm845-qmp-usb3-phy
> +  reg:
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +      - description: Address and length of the DP_COM control block.
> +
> +  reg-names:
> +    items:
> +      - const: reg-base
> +      - const: dp_com
> +
> +  "#clock-cells":
> +     enum: [ 1, 2 ]
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  clocks:
> +    items:
> +      - description: Phy aux clock.
> +      - description: Phy config clock.
> +      - description: 19.2 MHz ref clk.
> +      - description: Phy common block aux clock.
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +      - const: ref
> +      - const: com_aux
> +
> +  resets:
> +    items:
> +      - description: reset of phy block.
> +      - description: phy common block reset.
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +      - const: common
> +
> +  vdda-phy-supply:
> +    description:
> +        Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +        Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vddp-ref-clk-supply:
> +    description:
> +        Phandle to a regulator supply to any specific refclk
> +        pll block.
> +
> +#Required nodes:
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each device node of QMP phy is required to have as many child nodes as
> +      the number of lanes the PHY has.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#clock-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    usb_1_qmpphy: phy-wrapper@88e9000 {
> +        compatible = "qcom,sdm845-qmp-usb3-phy";
> +        reg = <0 0x088e9000 0 0x18c>,
> +              <0 0x088e8000 0 0x10>;
> +        reg-names = "reg-base", "dp_com";
> +        #clock-cells = <1>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +                 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +                 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
> +        clock-names = "aux", "cfg_ahb", "ref", "com_aux";
> +
> +        resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +                 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
> +        reset-names = "phy", "common";
> +
> +        vdda-phy-supply = <&vdda_usb2_ss_1p2>;
> +        vdda-pll-supply = <&vdda_usb2_ss_core>;
> +
> +        usb_1_ssphy: phy@88e9200 {
> +                reg = <0 0x088e9200 0 0x128>,
> +                      <0 0x088e9400 0 0x200>,
> +                      <0 0x088e9c00 0 0x218>,
> +                      <0 0x088e9600 0 0x128>,
> +                      <0 0x088e9800 0 0x200>,
> +                      <0 0x088e9a00 0 0x100>;
> +                #clock-cells = <0>;
> +                #phy-cells = <0>;
> +                clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +                clock-names = "pipe0";
> +                clock-output-names = "usb3_phy_pipe_clk_src";
> +            };
> +        };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
