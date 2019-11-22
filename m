Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BC6C43215
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 08:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37E4320708
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 08:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yEDyOG7p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfKVIwX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 03:52:23 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36124 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKVIwX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 03:52:23 -0500
Received: by mail-wm1-f65.google.com with SMTP id n188so4699596wme.1
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VLujAY+88BSOb76CMcCgkVoqi9J6jk/Juu0sTNbfFrc=;
        b=yEDyOG7p9b1boQO+yPx7T/orbtvdzS9mIWpquOyfMJ9T+E7hiwrWie93xwU1xvSViD
         bvudjI7Eq1xbenQ+82Ev17QXB9xQsOV0S8u0Aktao9baaIhS8eMQk3FktAdFybHCd3Bu
         kt+xSebTl/zAzI2oOpjKDxVRIt8+2qbzsYLewFCQaFi9/+hHk08CRmkI9kaLx/wDrxFv
         4h7GLulDtIIaaklXc93q6fwcm2eHriSRXc+ynHAMm3oEUEP3b0Ut6mmHKw2gEacTXmTO
         3K0EGm/AsE5DR5uS0b4ffNpnmx+FTzepNUVTUX8iTg7F0V4JrTGeCQSlYxu9K9ZtP2u1
         X6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VLujAY+88BSOb76CMcCgkVoqi9J6jk/Juu0sTNbfFrc=;
        b=XsBAcP5bi979yZV4SeaFg/IYrYSxnSL774ZuvQHYMO/Kd3LcqN7Gz2qw0qRXzBLXbE
         8q5PrzZY5Y6JGPl7/C67jECDNCijgTAzKxFoSuOjqAkHmxKYhIZc6+Gcr82RFFJ6BePi
         fjl0GD6tFO4G9+zZiyBDW5BKSQ2GFyBYdNhOfzDPmFs1JW32iqKNQC09Ww+JZXZdUO3a
         UsafA6UJU0czE1zB0TA8/QDyaO+0H4Pl0bXDNO5bnbw4pG23NGz3Z5AnhPLFZXesxSBk
         wq5rFfTDLCoCEiNeR97rMTqy0cVBH53HtV5jq7uyDnc0OSWM3o0YmTCa/TNZbWN+Xw0C
         lv8A==
X-Gm-Message-State: APjAAAX6uJ0IGFdR2ZTHcbNUDIxZpBVNVuep5/UHwoVdxAHe3152jycF
        X1lbdvo+6kSQoOfdLYKz0QEOuQ==
X-Google-Smtp-Source: APXvYqwwlH0gGZvD3X21WS+3zwwM2jmNykWqZjk3TmIFC2gjpoeu8T5W97x0a8ioyXpmeVYWqCEblg==
X-Received: by 2002:a1c:200f:: with SMTP id g15mr15378140wmg.96.1574412739032;
        Fri, 22 Nov 2019 00:52:19 -0800 (PST)
Received: from [192.168.1.68] (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id v6sm6946456wrt.13.2019.11.22.00.52.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 00:52:18 -0800 (PST)
Subject: Re: [PATCH 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
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
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
Date:   Fri, 22 Nov 2019 09:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,


On 22/11/2019 07:55, Hanjie Lin wrote:
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>  - a DWC3 IP configured as Host for USB2 and USB3
> 
> A glue connects the controllers to the USB2 PHY of A1 SoC.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> index 6ffb09b..63dc60b 100644
> --- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> @@ -128,3 +128,56 @@ Example device nodes:
>  				snps,quirk-frame-length-adjustment;
>  			};
>  	};
> +
> +Amlogic Meson A1 DWC3 USB SoC Controller Glue
> +
> +The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
> +host-only mode.
> +
> +Required properties:
> +- compatible:	Should be "amlogic,meson-a1-usb-ctrl"
> +- clocks:       The clocks needed by the usb controller
> +- clock-names:  Should contain the name of the clocks: "usb_ctrl", "usb_bus",
> +                "xtal_usb_phy", "xtal_usb_ctrl"
> +- resets:	a handle for the shared "USB" reset line
> +- reg:		The base address and length of the registers
> +- phys: 	handle to used PHYs on the system
> +	- a <0> phandle can be used if a PHY is not used
> +- phy-names:	names of the used PHYs on the system :
> +	- "usb2-phy0" for USB2 PHY if USBHOST port is used
> +
> +Required child nodes:
> +
> +A child node must exist to represent the core DWC3 IP block. The name of
> +the node is not important. The content of the node is defined in dwc3.txt.
> +
> +PHY documentation is provided in the following places:
> +- Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> +
> +Example device nodes:
> +	usb: usb@ffe09000 {
> +			status = "okay";
> +			compatible = "amlogic,meson-a1-usb-ctrl";
> +			reg = <0x0 0xffe09000 0x0 0xa0>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			clocks = <&clkc_periphs CLKID_USB_CTRL>,
> +				 <&clkc_periphs CLKID_USB_BUS>,
> +				 <&clkc_periphs CLKID_XTAL_USB_PHY>,
> +				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
> +			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
> +			resets = <&reset RESET_USBCTRL>;
> +			phys = <&usb2_phy0>;
> +			phy-names = "usb2-phy0";
> +
> +			dwc3: usb@ff400000 {
> +					compatible = "snps,dwc3";
> +					reg = <0x0 0xff400000 0x0 0x100000>;
> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +					dr_mode = "host";
> +					snps,dis_u2_susphy_quirk;
> +					snps,quirk-frame-length-adjustment = <0x20>;
> +			};
> +	};
> 

This seems very similar to the g12a bindings, seems you could update the yaml g12a bindings
with specific clocks and required for amlogic,meson-a1-usb-ctrl.

Neil
