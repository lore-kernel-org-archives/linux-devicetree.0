Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5132C2D0CD
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BDEE227BF
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 13:13:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lttaK0Hs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfLRNNX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 08:13:23 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42604 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbfLRNNX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 08:13:23 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so2219641wro.9
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 05:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=t+4jzB6sE+fqrmVWu+/FVUEbgglpQkdz/+ilf8BHhZk=;
        b=lttaK0HsF40qk2FpUmiMWTdU9a07UDhhNazB4yD7NVPvOQfHDs34tm+sFvgTmaV0bg
         6n9AHTYVJR+1JjbpVISj78B05DD64jN5NYBhmshCVDFic5cUBMEPN2huseaQiTAtgosd
         eDJB1RfX9ixrbwWyeLjSFrp4+gaW+ai/E/goCNuepBBKoh21orF02y3y0J9ffMqG7mu4
         HGW2Y1oee973PTtpNkg+LaFKcBrUoQFR7qibn5oY+XudfU9lwUJ+R7OrHZun/QZVH+yV
         Hc5PAC4CrEGzewdxsSZHeaob3ekY8G2Qdl4rAjc0gXe0mhO1WPcGh85GTBgB6Jvx9m2O
         Bv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=t+4jzB6sE+fqrmVWu+/FVUEbgglpQkdz/+ilf8BHhZk=;
        b=fl7VoGOo4LesHTe6gmdou1WMJuRtw97sm4/hUP6vL8Ct9jfW9gL4HkACBCSF9mAlcb
         tMQdAcVvQTKI/FjJqJbwtEbPToERmgUzY1CgSygo3J1okHBJza06QjXpi9t62z9t4Rag
         X2PV4elA1XdHe+ZbXmMQKU8rSZC37xgpGXS29C1awPHTMZUaibfK1veWNjly56igtxmi
         6ldSfHvbj0o/W083iQNL/RYYkVDpkRIoZb6xoTdTsia6w2NZjUkvN/fU4M3Q7whJA4Ij
         bqkx/fxIiyf+XLxVdq6nU02kuw8vGzsMb2FY+mve7p89vsEjGp/vzcGgxu2qNqmSxN0C
         BTzA==
X-Gm-Message-State: APjAAAU3nWO6oG86SWhJrFFvX5lSI1AzVYIOJk+3pC1OSToPDKc1FthW
        2L7yLZd9jGgQM927VSzkPmxgMA==
X-Google-Smtp-Source: APXvYqxqg+jKaLJfUv8PDKCFelPCaeSnIR17IQsZYdfZiSJa/cL7ZMRBaeW6tXH5dJd+PsBR5Pt3gA==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr2702891wro.209.1576674800190;
        Wed, 18 Dec 2019 05:13:20 -0800 (PST)
Received: from [10.2.4.229] (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
        by smtp.gmail.com with ESMTPSA id b67sm2560851wmc.38.2019.12.18.05.13.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 05:13:19 -0800 (PST)
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Yue Wang <yue.wang@amlogic.com>, linux-amlogic@lists.infradead.org,
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
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
 <1576636944-196192-3-git-send-email-hanjie.lin@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <daa67976-e2ad-e114-b5fd-87eb5ae00eeb@baylibre.com>
Date:   Wed, 18 Dec 2019 14:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576636944-196192-3-git-send-email-hanjie.lin@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 18/12/2019 03:42, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
> index 4efb77b..9740027 100644
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
> @@ -124,4 +130,30 @@ examples:
>                snps,quirk-frame-length-adjustment;
>            };
>      };
> +  - |
> +    usb: usb@ffe09000 {
> +          status = "okay";
> +          compatible = "amlogic,meson-a1-usb-ctrl";
> +          reg = <0x0 0xffe09000 0x0 0xa0>;
> +          #address-cells = <2>;
> +          #size-cells = <2>;
> +          ranges;
>  
> +          clocks = <&clkc_periphs CLKID_USB_CTRL>,
> +           <&clkc_periphs CLKID_USB_BUS>,
> +           <&clkc_periphs CLKID_XTAL_USB_PHY>,
> +           <&clkc_periphs CLKID_XTAL_USB_CTRL>;
> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
> +          resets = <&reset RESET_USBCTRL>;
> +          phys = <&usb2_phy0>;
> +          phy-names = "usb2-phy0";
> +
> +          dwc3: usb@ff400000 {
> +                  compatible = "snps,dwc3";
> +                  reg = <0x0 0xff400000 0x0 0x100000>;
> +                  interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +                  dr_mode = "host";
> +                  snps,dis_u2_susphy_quirk;
> +                  snps,quirk-frame-length-adjustment = <0x20>;
> +          };
> +  };
> 

I doubt this passed the dt_binding_check !


Please add the clock-names only for amlogic,meson-a1-usb-ctrl,
set the phys maxItems to 1 for amlogic,meson-a1-usb-ctrl,
and set dr_mode as host in the example or make it required only
for amlogic,meson-g12a-usb-ctrl.

Neil
