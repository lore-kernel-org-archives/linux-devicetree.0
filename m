Return-Path: <SRS0=J+Gt=Z5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD73DC43603
	for <linux-devicetree@archiver.kernel.org>; Sat,  7 Dec 2019 00:54:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80472217BA
	for <linux-devicetree@archiver.kernel.org>; Sat,  7 Dec 2019 00:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FcTHjpXt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfLGAyb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Dec 2019 19:54:31 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34529 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfLGAyb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Dec 2019 19:54:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so9721415wrr.1
        for <devicetree@vger.kernel.org>; Fri, 06 Dec 2019 16:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YyHqnh3RgU+jkragtEYCmywD+W1GeJPYa5pDIp3hGtA=;
        b=FcTHjpXtuWKl1ktGy/jvKmj2CEIxaOGf7WtJh22SSUSCoRnxI007b1epPMs2yzPAU6
         8XKVC+aUUW4HrvmDIskh7Faxk/Hkh/OBnV3BQ53u77XgaJZ944tnynobm08sy3X5HTGy
         p9ox1+HGbfpaQpNgvjmcoidglRxGol+snYZog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YyHqnh3RgU+jkragtEYCmywD+W1GeJPYa5pDIp3hGtA=;
        b=pQSVMkaewZpSQOWB/YO4A2/zVgpB/K82oG73eoxDkk2aSPfpi3G5k32OsAH0mHDZNy
         7Io9tqn03/JN0ymPOcOeux8vHukFxa53dZ+4qUL2KtSly/tTVKeYahtjocge3ZWG2Soh
         A9/399aHwuFjRI3Jsd++OQfv4Z/I04AIBqjHq7sq0CZeRf+WCDhWtG314/lmzVBJX58T
         J8SWGmGTjSlDdSuis9hYe2/tykdj3vtnu++tsL/k2/5KY+dJBMSz1mmjcfmfS12YoF9e
         PYcI/V4UMIa8DlBFKjPq4WMmoP1UE+v53IY8CeIa9FliLBZefS98XGnIFJIQPKzY+LM9
         qS4A==
X-Gm-Message-State: APjAAAXasKpuUJttJCeERfozLNPv2B4RbvupRXpHQK1xo39AOdac0v5t
        xnHO6US5YTJA14K1Al4jmQEYMw==
X-Google-Smtp-Source: APXvYqycLhNIOEqhQ1FJre7Q/J/PU8EfKeYG6wG58YToIgr2m9pkiKsbRjmM2iUnZ/GXddXke7yIhQ==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr17461759wrv.86.1575680069042;
        Fri, 06 Dec 2019 16:54:29 -0800 (PST)
Received: from rj-aorus.ric.broadcom.com ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h97sm19347000wrh.56.2019.12.06.16.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 16:54:28 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: Cygnus: Fix MDIO node address/size cells
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     grygorii.strashko@ti.com, simon.horman@netronome.com,
        robh+dt@kernel.org, rafal@milecki.pl, davem@davemloft.net,
        andrew@lunn.ch, mark.rutland@arm.com, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Eric Anholt <eric@anholt.net>,
        open list <linux-kernel@vger.kernel.org>
References: <20191206181909.10962-1-f.fainelli@gmail.com>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <86e8fbec-f9e5-28d8-cc58-c12ce53a18e9@broadcom.com>
Date:   Fri, 6 Dec 2019 16:54:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191206181909.10962-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 12/6/19 10:19 AM, Florian Fainelli wrote:
> The MDIO node on Cygnus had an reversed #address-cells and
>   #size-cells properties, correct those.
> 
> Fixes: 40c26d3af60a ("ARM: dts: Cygnus: Add the ethernet switch and ethernet PHY")
> Reported-by: Simon Horman <simon.horman@netronome.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   arch/arm/boot/dts/bcm-cygnus.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
> index 2dac3efc7640..1bc45cfd5453 100644
> --- a/arch/arm/boot/dts/bcm-cygnus.dtsi
> +++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
> @@ -174,8 +174,8 @@
>   		mdio: mdio@18002000 {
>   			compatible = "brcm,iproc-mdio";
>   			reg = <0x18002000 0x8>;
> -			#size-cells = <1>;
> -			#address-cells = <0>;
> +			#size-cells = <0>;
> +			#address-cells = <1>;
>   			status = "disabled";
>   
>   			gphy0: ethernet-phy@0 {
> 

Looks good! Thanks!

Reviewed-by: Ray Jui <ray.jui@broadcom.com>
