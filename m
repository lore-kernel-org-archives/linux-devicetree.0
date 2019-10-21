Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832FBCA9EB5
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 05:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5773521835
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 05:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1zKZDQW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfJUFhn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 01:37:43 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43288 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfJUFhn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 01:37:43 -0400
Received: by mail-pg1-f196.google.com with SMTP id l24so2116970pgh.10
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 22:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bbUNWgsRrwJWrwwWTLHk1qwW37wMYMwgF4F15zaUzzU=;
        b=Q1zKZDQW5gnuspjNs1usaCrevnshmMvuB+xoli4H2diANik/5uAjAPgEbLMBkD0lDa
         8o6Dd8ct6/mAxIseE5Z4Pol1DHl+4iJAD/z+Uo1asXgjKmqryzqwZqFxtXj8u1ihsD1R
         wFuCo1iDhx2oyZCFzbbR8F/iPLuJYY99s6YIeQ+MaKkWV/QyduE3uwe78gUvIrwXNdaG
         rMgJYhe6WqWFWpFFBmMPruuiBewbcm5uK5rmpqBbM8yG9sv/pGuSXx+eHiyK3nqeLvb0
         q7aesF0odKzoCxrjExAIxs2ucsaVdQkO3t/ZTtT7do3Gd/H0uUn7wvx7R9mHDDwGnmHO
         N+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bbUNWgsRrwJWrwwWTLHk1qwW37wMYMwgF4F15zaUzzU=;
        b=T//wu3Swv2MfLlJHDvXFcycviLR5g3zeBVmjL8HxvtvcLSCdKZosKGejTg9QgOHQF5
         ZnRexLHL4q65Kpa+6rw10GQ9x2fXZzN2spZswPi4snT1ps+oZxsAGo6/IuHVHKK086jy
         gs/9EO3+uGx5ztGqIIzUWbAf7WsNtM5pTkM6R+6mdOrDV7U20RDkZ8otDzYaVwu5SPH2
         vTRcru0e4UP58URD+u3GrePiLLOADtgxb+Lhc126dfH4ZkSjTuSfceJRjPdHEU3Yr6qL
         JEvzgW5qAPHCT5xcPqJbVungWN4VmqZqWn0/rOh7I1bvUhn3A8jCFjjRQ25/UWUjQKur
         t53g==
X-Gm-Message-State: APjAAAXwwCq4HUEG5CxboIwKceVPLJIVxZv7SO3vup0En9CXieorfsJj
        x9a4Q+8K4U5Tll0nDy37uJnMaw==
X-Google-Smtp-Source: APXvYqzhJmsEQMl4XlB026kHJLPEEdGs7zYTphM5q2UH7U3e9SwXsDyeDdrVXbgIgVUq2H5mAsxKoA==
X-Received: by 2002:a65:4c03:: with SMTP id u3mr23643719pgq.440.1571636262410;
        Sun, 20 Oct 2019 22:37:42 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h6sm19646988pfg.123.2019.10.20.22.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:37:41 -0700 (PDT)
Date:   Sun, 20 Oct 2019 22:37:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, marijns95@gmail.com
Subject: Re: [PATCH 2/5] arm64: dts: pm8004: Add SPMI regulator and add
 phandles to lsids
Message-ID: <20191021053739.GH4500@tuxbook-pro>
References: <20191020150746.64114-1-kholk11@gmail.com>
 <20191020150746.64114-3-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020150746.64114-3-kholk11@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 20 Oct 08:07 PDT 2019, kholk11@gmail.com wrote:

> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add the SPMI regulator node in the PM8004 LSID5 (as there is where
> it resides basically 99% of the times) and set the nodes to be
> disabled by default, as not all boards have both or one of the
> lsids specified in this generic pm8004 DT.
> 
> While at it, also add nice phandles to the lsids specified in this
> DT, so that we can modify their configuration or add nodes to them
> from other DTs in a nicer and more human readable fashion.
> 

Shouldn't all blocks of pm8004 be declared in this file?

> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8004.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8004.dtsi b/arch/arm64/boot/dts/qcom/pm8004.dtsi
> index 297b57bfa87a..0abd1abe12fc 100644
> --- a/arch/arm64/boot/dts/qcom/pm8004.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8004.dtsi
> @@ -4,17 +4,23 @@
>  
>  &spmi_bus {
>  
> -	pmic@4 {
> +	pm8004_lsid4: pmic@4 {
>  		compatible = "qcom,pm8004", "qcom,spmi-pmic";
>  		reg = <0x4 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		status = "disabled";

I think you should just leave this enabled, boards that doesn't have a
pm8004 should be able to omit the include of this file.

>  	};
>  
> -	pmic@5 {
> +	pm8004_lsid5: pmic@5 {
>  		compatible = "qcom,pm8004", "qcom,spmi-pmic";
>  		reg = <0x5 SPMI_USID>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		status = "disabled";
> +
> +		pm8004_spmi_regulators: regulators {
> +			compatible = "qcom,pm8004-regulators";
> +		};

Looks good.

Regards,
bjorn

>  	};
>  };
> -- 
> 2.21.0
> 
