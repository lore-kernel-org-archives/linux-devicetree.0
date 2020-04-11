Return-Path: <SRS0=gZHh=53=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD729C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 01:36:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4F0E2082D
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 01:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kuCT9Q36"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDKBgS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 21:36:18 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39410 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgDKBgS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 21:36:18 -0400
Received: by mail-pg1-f193.google.com with SMTP id g32so1701430pgb.6
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 18:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=szn0SVPYeNNQGleo8ZPe1w9WYAtCAZtE1qvgMJhSYug=;
        b=kuCT9Q36KXa5CoJOyTI/wcHvuotv6ERpgGZNwJYhU9gm1dT2sjqWsy244SCWdC0Rdt
         TgUyD+RJLFlHmX08rI0A9SI2yyYV5ah4HovT/sA4p11xlct17mPZPVl2x+0HBeywO/OG
         smvB7OiB/x6aaEylicEWsHLRDgGaRVW3DEKj7V64xPcCaA1oPC5XoKZldXKFqtyLozUW
         +6jZ24k5BRMJxsk0MHm4QE2FqGuiv0tfY0avAPlDvW0dh5Ls1D13IVmLX2onSBdlIUPa
         irIOiLPR6YpvRPAJZZH250CoQjOT9mFWh9GoTsJC0gKpdq1eGGdQ7ZO3C2Oi/O8K1i+z
         +DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=szn0SVPYeNNQGleo8ZPe1w9WYAtCAZtE1qvgMJhSYug=;
        b=o7MEjhp76cKd4/qui/d3dnjAjdr7QCEEw44KDZnpGyeYTRsYvlHw0MSRUsPLMBCmVr
         3tVG/UxpJv1akI2im77G75Z0Dxna8FWztQIkKQ8ZELN69JOpCpyKq0AaNADN7c30lNlf
         eEZh6nH8HbxWwXL3gxJ5tSSYqIPfB6cncGsm5iGXRzRKBikNr8d2LnGVReE6I0mi/oUp
         WJ1uekR0iKVQfOmMdvI8zPwYvr4koZH6zvYuMkq++m0qwhVrEOT5JnRXR3M9x3ACrcdY
         HCwFN0sk4W4vlXPezcreYCYFIv1+NSrEgnG7CSdnww2k5p4Yxt4kqKTA6J0pkpZKkEf2
         vzuw==
X-Gm-Message-State: AGi0PuYtrKUVaA2oKXxn+NnKVCk/N/le1EJKCVx5xpTdxO9MoETc7XdL
        RNWtepCTfDu3vRfnVVtWlBKZqQ==
X-Google-Smtp-Source: APiQypLL9mN+Kmvylqj99MqiYdsOjmciZbm0t2E3UVcmMzsdG6sU0TZsFCxmeXLbHrXTHU4PP5Geqw==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr7834859pfm.230.1586568977403;
        Fri, 10 Apr 2020 18:36:17 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k189sm2574943pgc.24.2020.04.10.18.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 18:36:16 -0700 (PDT)
Date:   Fri, 10 Apr 2020 18:36:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/6] ARM: dts: qcom: msm8974: Add pma8084 regulator node
Message-ID: <20200411013627.GH576963@builder.lan>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
 <20200410023203.192048-2-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410023203.192048-2-iskren.chernev@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 09 Apr 19:31 PDT 2020, Iskren Chernev wrote:

> From: Daniele Debernardi <drebrez@gmail.com>
> 
> The pma8084 regulator node is added with status disabled.  It is used in
> the Samsung Galaxy S5 (klte) for various things including gpio keys,
> sdhci, usb, dsi
> 

On the newer platforms we learned that the PMIC configuration wasn't
strictly tied to the platform.

I think we should migrate the older platforms as well (and your series
is an argument for doing this), so in line with that I think it would be
better if you moved this chunk to the klte dts (and squash it with the
second patch).

Regards,
Bjorn

> Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 53 +++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 2ea2308d91b3..fdb93138be25 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1600,6 +1600,59 @@ pm8941-regulators {
>  					pm8941_lvs2: lvs2 {};
>  					pm8941_lvs3: lvs3 {};
>  				};
> +
> +				pma8084-regulators {
> +					compatible = "qcom,rpm-pma8084-regulators";
> +					status = "disabled";
> +
> +					pma8084_s1: s1 {};
> +					pma8084_s2: s2 {};
> +					pma8084_s3: s3 {};
> +					pma8084_s4: s4 {};
> +					pma8084_s5: s5 {};
> +					pma8084_s6: s6 {};
> +					pma8084_s7: s7 {};
> +					pma8084_s8: s8 {};
> +					pma8084_s9: s9 {};
> +					pma8084_s10: s10 {};
> +					pma8084_s11: s11 {};
> +					pma8084_s12: s12 {};
> +
> +					pma8084_l1: l1 {};
> +					pma8084_l2: l2 {};
> +					pma8084_l3: l3 {};
> +					pma8084_l4: l4 {};
> +					pma8084_l5: l5 {};
> +					pma8084_l6: l6 {};
> +					pma8084_l7: l7 {};
> +					pma8084_l8: l8 {};
> +					pma8084_l9: l9 {};
> +					pma8084_l10: l10 {};
> +					pma8084_l11: l11 {};
> +					pma8084_l12: l12 {};
> +					pma8084_l13: l13 {};
> +					pma8084_l14: l14 {};
> +					pma8084_l15: l15 {};
> +					pma8084_l16: l16 {};
> +					pma8084_l17: l17 {};
> +					pma8084_l18: l18 {};
> +					pma8084_l19: l19 {};
> +					pma8084_l20: l20 {};
> +					pma8084_l21: l21 {};
> +					pma8084_l22: l22 {};
> +					pma8084_l23: l23 {};
> +					pma8084_l24: l24 {};
> +					pma8084_l25: l25 {};
> +					pma8084_l26: l26 {};
> +					pma8084_l27: l27 {};
> +
> +					pma8084_lvs1: lvs1 {};
> +					pma8084_lvs2: lvs2 {};
> +					pma8084_lvs3: lvs3 {};
> +					pma8084_lvs4: lvs4 {};
> +
> +					pma8084_5vs1: 5vs1 {};
> +				};
>  			};
>  		};
>  	};
> -- 
> 2.26.0
> 
