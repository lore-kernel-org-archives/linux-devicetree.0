Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A972C00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:35:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D82D821835
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098117;
	bh=M7aIwZfl2ohAAgMncAbyydKZCVSAvhAVlGopIdlIMfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UL6Z19OWRJVZNfBm/Ksgi216/KFqvst8mhTVC5kUtvj7vTqj8Eg4/Pvu71qbnKcZO
	 TobWqztOjpaQyJyNq5k14l2m3qvW3puCr7VOaJMfAd/TiVceA8lSN58ZJ2N1TIK8+l
	 X1UdkDrDuy5PiWekzpuy0FPqVbUOA62728H3B6pI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgADAfQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:35:16 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:35555 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgADAfQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:35:16 -0500
Received: by mail-io1-f66.google.com with SMTP id v18so43147658iol.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OkEhI0mGAaFruOBaLTQQRQIQxA1NVDP05WMjkcVPHmI=;
        b=jsWypKOG6TXpFzpgbOxwIGZLbkCnvTDE8kYIaAHLr/SkUZ6Tg47ipjLDf0EwuOE60y
         erf2+Wwax/mjdYs0ZR8PT7GKcfVvY1h8/LfG5m95LLumfDy/zqM33wh4DR9KrttN3xWi
         vr0/uZIM2ADGrkyFq+x6QSZLq9s9E0sWmeoVE0rrWVdJOKw8QfflH+Ujb0lDPGr1mjT8
         pMgpkPjgMW1E+qqURIxQxHl2t6cbisNRj9hR6EofgKRUp90Ted4hdKLzouwk6MBkttjo
         Htb+7sUxFtCe+b0ybdRO658O+HhI+N9zDh6ZpmRrGXz9jpnI4aeM+RsCgtfMZE4zvsRj
         ilWQ==
X-Gm-Message-State: APjAAAUX+QhPRMvHnagrKH6T/9mv2UPC5P3sa97y6k0/6MIKTnusP2Eq
        /ukhucNtMjTO2X+qXD/pyu8wj6c=
X-Google-Smtp-Source: APXvYqyzl9eC6OroCoQrtYhrIaRX+xl0WBCCohL4+qJwNrOP2uHdZYw5Ra4WdkKTHducAasd0KPATA==
X-Received: by 2002:a02:c787:: with SMTP id n7mr71930157jao.85.1578098114801;
        Fri, 03 Jan 2020 16:35:14 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z24sm21348328ilf.31.2020.01.03.16.35.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:35:14 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:32:10 -0700
Date:   Fri, 3 Jan 2020 17:32:10 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
Message-ID: <20200104003210.GA29074@bogus>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577428606-69855-3-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 27, 2019 at 02:36:42PM +0800, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 57 +++++++++++++++++++---
>  1 file changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> index 4efb77b..6103cc2 100644
> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> @@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
>  
>  maintainers:
>    - Neil Armstrong <narmstrong@baylibre.com>
> +  - Hanjie Lin <hanjie.lin@amlogic.com>
> +  - Yue Wang <yue.wang@amlogic.com>
>  
>  description: |
>    The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
> @@ -22,10 +24,14 @@ description: |
>    The DWC3 Glue controls the PHY routing and power, an interrupt line is
>    connected to the Glue to serve as OTG ID change detection.
>  
> +  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
> +  host-only mode.
> +
>  properties:
>    compatible:
>      enum:
>        - amlogic,meson-g12a-usb-ctrl
> +      - amlogic,meson-a1-usb-ctrl
>  
>    ranges: true
>  
> @@ -37,6 +43,11 @@ properties:
>  
>    clocks:
>      minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
>  
>    resets:
>      minItems: 1
> @@ -47,17 +58,22 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  phys:
> +    minItems: 1
> +    maxItems: 3
> +
>    phy-names:
>      items:
>        - const: usb2-phy0 # USB2 PHY0 if USBHOST_A port is used
>        - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
>        - const: usb3-phy0 # USB3 PHY if USB3_0 is used
>  
> -  phys:
> -    minItems: 1
> -    maxItems: 3
> -

Why the unnecessary move?

> -  dr_mode: true
> +  dr_mode:
> +    description: usb mode for G12A
> +    enum:
> +      - host
> +      - peripheral
> +      - otg

No, this is a common property that doesn't need to be redefined here. It 
was correct as-is.

>  
>    power-domains:
>      maxItems: 1
> @@ -80,9 +96,9 @@ required:
>    - resets
>    - reg
>    - interrupts
> -  - phy-names
>    - phys
>    - dr_mode
> +  - phy-names

Again, unnecessary change.

>  
>  examples:
>    - |
> @@ -124,4 +140,33 @@ examples:
>                snps,quirk-frame-length-adjustment;
>            };
>      };
> +  - |
> +    a1_usb: usb@ffe09000 {

You are only adding a compatible. No need for a whole new example.

> +          status = "okay";
> +          compatible = "amlogic,meson-a1-usb-ctrl";
> +          reg = <0 0xffe09000 0x0 0xa0>;
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
>  
> +          clocks = <&clkc_periphs 36>,
> +                   <&clkc_periphs 85>,
> +                   <&clkc_periphs 2>,
> +                   <&clkc_periphs 3>;
> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy",
> +                        "xtal_usb_ctrl";
> +
> +          resets = <&reset 36>;
> +
> +          phys = <&usb2_phy1>;
> +          phy-names = "usb2-phy1";
> +
> +          a1_dwc3: usb@ff400000 {
> +                  compatible = "snps,dwc3";
> +                  reg = <0xff400000 0x100000>;
> +                  interrupts = <0 90 4>;
> +                  dr_mode = "host";
> +                  snps,dis_u2_susphy_quirk;
> +                  snps,quirk-frame-length-adjustment = <0x20>;
> +          };
> +    };
> -- 
> 2.7.4
> 
