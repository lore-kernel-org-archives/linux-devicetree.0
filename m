Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1DCCA9EB9
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 12:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 627C9218AE
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 12:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jid6ntUK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389056AbfJVMYX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 08:24:23 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36297 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388023AbfJVMYX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 08:24:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id c22so6852044wmd.1
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ut7DiejZhR1eCG20yMrwS8a1hqYS2ddBi/U75ecWkFY=;
        b=jid6ntUK0esQpG508NqfQT8zlE0uB1es+ezydvxrncS5YL4nlvOrDTIZAThJNt1JBz
         UrQKQDEA9sdYPOvuhFTDlPdmpkopnU/enaASQsHEBQaqZrYTdNIQqGCDfElQymPwO8Ll
         s+thwC7xS0XKxFqUyXqcA73LqBGFRnP99zXtj2Vt+p5Zrbnmv+JAR3tbjblJ1nUHlgYu
         b9YpZJ97WC7Ig6r49FwggaBC2uFCe2oUjfQFjPdo0DFpaOBtfs5rwa92IUbItW9vWfPg
         z9+rRt5ubyBiRN150rIQRhZOKeDwPfYRcLpQVmo+SWKDJzrsxhT4se8JkiP5gzWwVAkg
         J93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ut7DiejZhR1eCG20yMrwS8a1hqYS2ddBi/U75ecWkFY=;
        b=f171hGlOBkP8FEJ7RXpgwMyIrtwR81iMcSS+9ieLhGxl7T0h1bC17UQcCCdrPpW5vY
         mbToi4q9jOKqb6dX/Hh+giKV+iwbNd0Tv+zkvGFeKD7O6H4UiQtYepLE9f1Qq/LP7V5l
         QwI4eEeR5DEaCeR99Cb32KlBFkdFBS5tdIuILpXS85gDqjTu20xsRtttq1kng2VjOQgX
         Q/GE56hNSzLycovfeu2YT93maH6dtebVPLvj31/MoSlBFGy8nNWCyap/oIDn3nqgQNm+
         pQBpWGSgxxwhFDthoSBVh+pmxGboaIeTvn5FwjVPfdYH9CmhgGqe/tD21/28BlTlDOpG
         0Bow==
X-Gm-Message-State: APjAAAXNo/RQUchdAcnn4fIo8XXueqku/xeeFV6s+L4gMb++9wvKOKD8
        KQrtNw77if5ZWLo3xu/BShGZuQ==
X-Google-Smtp-Source: APXvYqwgjPDPNW7a1xJ2Rc6OO4jAurB2ZpMNxcJUVeFXsu+xl+Or1DkHLx+C8XVRN8u73S9NUcWQwg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr2708736wmj.91.1571747060898;
        Tue, 22 Oct 2019 05:24:20 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id u26sm19101660wrd.87.2019.10.22.05.24.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 05:24:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add binding for Rockchip OTP
 controller
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        christoph.muellner@theobroma-systems.com
References: <20190925184957.14338-1-heiko@sntech.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3b5f4018-82b1-946d-d81d-252eb872d5d1@linaro.org>
Date:   Tue, 22 Oct 2019 13:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925184957.14338-1-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 25/09/2019 19:49, Heiko Stuebner wrote:
> Newer Rockchip SoCs use a different IP for accessing special one-
> time-programmable memory, so add a binding for these controllers.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Applied both, thanks,
srini

> ---
>   .../bindings/nvmem/rockchip-otp.txt           | 25 +++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt b/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
> new file mode 100644
> index 000000000000..40f649f7c2e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/rockchip-otp.txt
> @@ -0,0 +1,25 @@
> +Rockchip internal OTP (One Time Programmable) memory device tree bindings
> +
> +Required properties:
> +- compatible: Should be one of the following.
> +  - "rockchip,px30-otp" - for PX30 SoCs.
> +  - "rockchip,rk3308-otp" - for RK3308 SoCs.
> +- reg: Should contain the registers location and size
> +- clocks: Must contain an entry for each entry in clock-names.
> +- clock-names: Should be "otp", "apb_pclk" and "phy".
> +- resets: Must contain an entry for each entry in reset-names.
> +  See ../../reset/reset.txt for details.
> +- reset-names: Should be "phy".
> +
> +See nvmem.txt for more information.
> +
> +Example:
> +	otp: otp@ff290000 {
> +		compatible = "rockchip,px30-otp";
> +		reg = <0x0 0xff290000 0x0 0x4000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		clocks = <&cru SCLK_OTP_USR>, <&cru PCLK_OTP_NS>,
> +			 <&cru PCLK_OTP_PHY>;
> +		clock-names = "otp", "apb_pclk", "phy";
> +	};
> 
