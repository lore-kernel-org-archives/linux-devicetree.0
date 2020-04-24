Return-Path: <SRS0=9zIi=6I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69232C54FCB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 00:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48CBF20CC7
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Apr 2020 00:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gpboAXek"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgDXApR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Apr 2020 20:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgDXApQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Apr 2020 20:45:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225DFC09B044
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 17:45:15 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 145so3910328pfw.13
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2020 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hOf+x2Y/Qe7ScdzUkVaxYfAFCfFShTVPAhN8bzkGnXg=;
        b=gpboAXekQ409ikcKnsJINuleZnjwZW1LBae+1wFSPlBf4tiLiWDNQ50LbNngeu9sf/
         Xgw9IU+pc6c9DnwvAakrbtb4HLsIk+0g2BZkddeMsg4+2/8PQEIz10vKTmoT/NhZiFmK
         B48ElTPt8fsDWhuiJLmZE1NkMURXV9l0CNq1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hOf+x2Y/Qe7ScdzUkVaxYfAFCfFShTVPAhN8bzkGnXg=;
        b=ThDgwEsFD4XScwGJUVNsGPi81kUjxMttn/iOgDVBuTgp5OPHtcI905F6tkGXWqLmbD
         oOYWMZQ3W85bKBJvKBcm+Byw969dc2aW70h8ePIHKGP/2/bZQYcezuV7ux+BhAQTPk0b
         JrKkbD1j3HFyd/uUpJQ39oMw1E1Jc+pIoG/8/Ak60Az03op62k2GsqTRATYRSAc/oYyy
         9txFkYDM1BiSA5/3390qKXHX7qEFs37WPtqidTa41VOgMKEJ43P4U/eQrixf4m+Omoqo
         NU3Cx88/IlWvS9SHsBOeyqE2mrF6SnyGL+umG9sZeo7rh0OSEprEWglsBw8btXt99snd
         I27A==
X-Gm-Message-State: AGi0PubrNJRZuZtCCFYJ3jqyIJVNA/jtl8epc5whckoPxD6OONQet7/y
        isnmzMzgmsAzmUxnXWy/HdjHeg==
X-Google-Smtp-Source: APiQypIyIZtDVKhOHp8Y5kuCR8rED5XYlhlovTxBBx+WS6MOfMqJu+zBJGNouJUoijlxSK6x5TwpPw==
X-Received: by 2002:a63:41c2:: with SMTP id o185mr6315849pga.139.1587689114561;
        Thu, 23 Apr 2020 17:45:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y186sm3166133pgb.69.2020.04.23.17.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 17:45:13 -0700 (PDT)
Date:   Thu, 23 Apr 2020 17:45:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom-qusb2: Fix defaults
Message-ID: <20200424004512.GL199755@google.com>
References: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200423111015.1.Ifa8039b6f3031e9a69c4a526a6efc2f499f07292@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Apr 23, 2020 at 11:10:27AM -0700, Douglas Anderson wrote:
> The defaults listed in the bindings don't match what the code is
> actually doing.  Presumably existing users care more about keeping
> existing behavior the same, so change the bindings to match the code
> in Linux.
> 
> The "qcom,preemphasis-level" default has been wrong for quite a long
> time (May 2018).  The other two were recently added.
> 
> As some evidence that these values are wrong, this is from the Linux
> driver:
> - qcom,preemphasis-level: sets "PORT_TUNE1", lower 2 bits.  Driver
>   programs PORT_TUNE1 to 0x30 by default and (0x30 & 0x3) = 0.
> - qcom,bias-ctrl-value: sets "PLL_BIAS_CONTROL_2", lower 6 bits.
>   Driver programs PLL_BIAS_CONTROL_2 to 0x20 by default and (0x20 &
>   0x3f) = 0x20 = 32.
> - qcom,hsdisc-trim-value: sets "PORT_TUNE2", lower 2 bits.  Driver
>   programs PORT_TUNE2 to 0x29 by default and (0x29 & 0x3) = 1.
> 
> Fixes: 1e6f134eb67a ("dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning parameters")
> Fixes: a8b70ccf10e3 ("dt-bindings: phy-qcom-usb2: Add support to override tuning values")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 144ae29e7141..f8bd28ff31c1 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -97,7 +97,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 63
> -          default: 0
> +          default: 32
>  
>      qcom,charge-ctrl-value:
>       description:
> @@ -130,7 +130,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 3
> -          default: 2
> +          default: 0
>  
>      qcom,preemphasis-width:
>        description:
> @@ -152,7 +152,7 @@ then:
>          - $ref: /schemas/types.yaml#/definitions/uint32
>          - minimum: 0
>            maximum: 3
> -          default: 0
> +          default: 1
>  
>  required:
>    - compatible
> -- 
> 2.26.1.301.g55bc3eb7cb9-goog

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
