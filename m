Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F2C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3022D21569
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V41NXNx9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728916AbgAMWAA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:00:00 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45488 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgAMWAA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:00:00 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so5508175pfg.12
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FDBSCFeDWTbY58059YufZG1qGkZAqqtwHIzXdBIurps=;
        b=V41NXNx92G9QE82/gdHR924ckvA7zTp+qtJThQsSIz9mtMXQqqw6+f4jyoq1JY4idd
         WTmT6EDp+PIaUeLZT7swCYSXt+vED8KssypVQpDcsnUkUaQLW8DP8hfOYGewdCQ7XJom
         8c3LBlb80ztpXppjm8NPjK4cbCIMK1A5IbLsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FDBSCFeDWTbY58059YufZG1qGkZAqqtwHIzXdBIurps=;
        b=k8iIobaejIvgS+mb2b1A01yqfigHg2wzoXbVehKgvkBu9AUZxZ5ieoIvso+Uvmq+ER
         3K7/pv7oMFgm6DESacVe7IRJ29ZYofRGDNeyjDHrKODfZA5+xzGMm/4sSxgG6acortxE
         cmU67oDSVYz0KZSoDRIiIkGbatMUg125lRu2j9AlBCUHyoBAitbdYtK9xI7KcB3BZanw
         lnOP0zdaOmoQkx2wwjZ5TKAFvLb/HuJI4j+nVdSFG3g5OJgp92uk1MoupU9eqbEodykn
         WKWwRqY+3BzHQzT2ceVH0m5vkoyLngkmQOTZNM2YpgdD65RCEhtOKNZiYQimxlRHXj/m
         WB6A==
X-Gm-Message-State: APjAAAWp3gRPbOAqyif/ddLFJ5wC/uAs3rd3BbM4BsbFZ/muBH0wW0FE
        ri6wwnqvFsvtv4zbkxA/Kh/F6g==
X-Google-Smtp-Source: APXvYqwBTZWU7x3UKOtRpFfBMLgYzxZkpEU97jGquP31XxAuDz7Rtm2g44M1sjVBdEr3X+k+2XymsQ==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr21459678pfm.60.1578952799897;
        Mon, 13 Jan 2020 13:59:59 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x11sm14772117pfn.53.2020.01.13.13.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 13:59:59 -0800 (PST)
Date:   Mon, 13 Jan 2020 13:59:58 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add sc7180 panel variant
Message-ID: <20200113215958.GI89495@google.com>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Jan 07, 2020 at 04:59:56PM +0530, Harigovindan P wrote:
> Subject: dt-bindings: display: add sc7180 panel variant
>
> Add a compatible string to support sc7180 panel version.

The sc7180 is a SoC, I suppose you are referring to the sc7180-idp, a
board based on this SoC. But even with the correct board name, this
isn't a good commit message. The board is irrelevant here, the display
could be used on dozens of other boards.

Apparently the panel is the Visionix RM69299, please use this instead
of 'sc7180'.

Thanks

Matthias

> Changes in v1:
> 	-Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	-Removed unwanted properties from description.
> 	-Creating source files without execute permissions(Rob Herring).
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> new file mode 100644
> index 0000000..d7bbd5f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> @@ -0,0 +1,48 @@
> +Visionox model RM69299 DSI display driver
> +
> +The Visionox RM69299 is a generic display driver, currently only configured
> +for use in the 1080p display on the Qualcomm SC7180 MTP board.
> +
> +Required properties:
> +- compatible: should be "visionox,rm69299-1080p-display"
> +- vdda-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- vdd3p3-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  (active low)
> +- ports: This device has one video port driven by one DSI. Their connections
> +  are modeled using the OF graph bindings specified in
> +  Documentation/devicetree/bindings/graph.txt.
> +  - port@0: DSI input port driven by master DSI
> +
> +Example:
> +
> +	dsi@ae94000 {
> +		panel@0 {
> +			compatible = "visionox,rm69299-1080p-display";
> +			reg = <0>;
> +
> +			vdda-supply = <&src_pp1800_l8c>;
> +			vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +			pinctrl-names = "default", "suspend";
> +			pinctrl-0 = <&disp_pins_default>;
> +			pinctrl-1 = <&disp_pins_default>;
> +
> +			reset-gpios = <&pm6150l_gpios 3 0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					panel0_in: endpoint {
> +						remote-endpoint = <&dsi0_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> -- 
> 2.7.4
> 
