Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C1C43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 05:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DBB920856
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 05:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OrmjFwvr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfKKFWn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 00:22:43 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38094 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfKKFWn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 Nov 2019 00:22:43 -0500
Received: by mail-pf1-f194.google.com with SMTP id c13so9870458pfp.5
        for <devicetree@vger.kernel.org>; Sun, 10 Nov 2019 21:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Wn68B/9oTQwMIS3XezYv2F3iHvuzpiojYbkvmpMuIps=;
        b=OrmjFwvr4biPvwrdT3kD+iqfanRLDTEy+qgIcQW0X6kulRevk5kmkeJoBypeigKALq
         y1VCFkDcyIPv4H7dQXHNCIH2F7D2WGzTza4DB20+hjf009mzaWm5pxLMrJebIetlfMSZ
         2oUcqsxGhobF3XOoVhw19OuiCTP4kYvTu1ZAFc7eB2hdEWHJ5w+hJh+iQikAQBdwxxjo
         U1dRZ6sY7pJe3GjME9fLguElpzgwwviwPcx5r8DfsHPwdMhFgUsxlrhfDqlwfkrQ/CS3
         rfMgtYMURSjBQWPkZa7Rmzw60qlbIwTg8dsKFnsLp+cSwUd2nugWvWycGEjCHK3+V+tE
         HR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Wn68B/9oTQwMIS3XezYv2F3iHvuzpiojYbkvmpMuIps=;
        b=j/qqyvsL1tVHrAIwDoUNHp/XSJuOgZjpiKCiCzhIDlHCs/WfQxCZ5azrwqFd/hJTOD
         Wy7ziosniSnfaI2+FhSn8jCnPLpEHgclWeyAnYCLAEn6ghPY0i7mVyTD67IPQF7Xe9Vp
         KFU3RdFo/227tkvkMIF+AjIL2rIjmwAhZST0qESl9j8A0YHzKkJ9ycViBzEukGrPcwsI
         bKDu5DOLjlstCbPFBSyvaYHr996hxPRlvC41k+MLmEUl0DyNF3qiDYULE2seBteZ360u
         4o5XwnmuqNthXtKJyxmRiIdqo/vDbDP4f9i7efJSO8YBbkCz0U7zKVm8jWo2ltYTCvjU
         T/lg==
X-Gm-Message-State: APjAAAXwM1Ww5UjO1QIeiPd3m/72M/4Rpc6I5PDBWUf6MIQlKgDOniAC
        aFqpN4q58vIjxesrjM2C7sr6
X-Google-Smtp-Source: APXvYqwyFuqsrSanrsgjZWam9y+4GIL/Fjuql1Gjr5R6qpTb9d+I0He5/Y2DwCn4UgfPYQhDRvm/pA==
X-Received: by 2002:a17:90a:741:: with SMTP id s1mr32134482pje.107.1573449762760;
        Sun, 10 Nov 2019 21:22:42 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:6309:fffb:304b:b40d:24e5:f9a8])
        by smtp.gmail.com with ESMTPSA id x25sm13239593pfq.73.2019.11.10.21.22.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2019 21:22:41 -0800 (PST)
Date:   Mon, 11 Nov 2019 10:52:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kever Yang <kever.yang@rock-chips.com>
Cc:     heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Akash Gajjar <akash@openedev.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: rk3399-rock960: add vdd_log
Message-ID: <20191111052232.GA2842@Mani-XPS-13-9360>
References: <20191111005158.25070-1-kever.yang@rock-chips.com>
 <20191111005158.25070-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111005158.25070-2-kever.yang@rock-chips.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Kever,

On Mon, Nov 11, 2019 at 08:51:57AM +0800, Kever Yang wrote:
> Add vdd_log node according to rock960 schematic V13.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> index c7d48d41e184..73afee257115 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
> @@ -76,6 +76,18 @@
>  		regulator-always-on;
>  		vin-supply = <&vcc5v0_sys>;
>  	};
> +
> +	vdd_log: vdd-log {
> +		compatible = "pwm-regulator";
> +		pwms = <&pwm2 0 25000 1>;
> +		regulator-name = "vdd_log";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <800000>;
> +		regulator-max-microvolt = <1400000>;
> +		regulator-init-microvolt = <950000>;

The default value seems to be 0.9v as per both Rock960 and Ficus schematics.

Other than that,
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> +		vin-supply = <&vcc_sys>;
> +	};
>  };
>  
>  &cpu_l0 {
> -- 
> 2.17.1
> 
