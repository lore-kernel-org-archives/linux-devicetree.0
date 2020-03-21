Return-Path: <SRS0=1bdf=5G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6CBC43332
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 22:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E30CB2076E
	for <linux-devicetree@archiver.kernel.org>; Sat, 21 Mar 2020 22:10:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N20YsOKc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbgCUWKz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 21 Mar 2020 18:10:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38053 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727995AbgCUWKz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 21 Mar 2020 18:10:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id z25so1015615pfa.5
        for <devicetree@vger.kernel.org>; Sat, 21 Mar 2020 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=0VFm/16cWCdasG0RFaX8ZzkPYRlA2DGlA/X5V7KG3C4=;
        b=N20YsOKcIV4V4oWzYOo0Ef93tvll4iE5su8rBp+1dYTWCNbmImdseghgTQwHIoVIJI
         IwR0OmKBKgTtufgdpjNoUkdHIM/kWnOtodWbeCl+EwmT64wVFon/z1rwAQoYaN8QBFHB
         20cL58aIyot7dS3zem3srqNHJjOl24EgKfC7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=0VFm/16cWCdasG0RFaX8ZzkPYRlA2DGlA/X5V7KG3C4=;
        b=jYQdTA9IB9Rn8zvArp7ojarSxjoR2zrQMPtLrqLjhvN1Ea9/jQP0iY5M2imHm9Yf1y
         3SrWLr/9PXFDO2vR/u018cWgVZYduUQQlZdeOuoofa5B/OqlO+hPz3OT/ljFSgQOMSjv
         0hD2sQ4rLWn2CdxFjhx24ArCA3U4TkItYzB/BHOZQAiGv4/wTdo0k0Ce4+gMMD+Xd1o/
         VHiufqXtpTPUcWFUys9LxGwEJdlCb9bUtV2OdYlSLs6rmzeyPv2AoUiQz0mIxQYeTiNi
         mZS1oTz8/5NQU+JKTdGOZQjHMwVQoaMWyGmtq/37LrHJnR31wTNDLkXo5e58cwGKnRia
         64Tw==
X-Gm-Message-State: ANhLgQ1oiPa0QA7kwZwKHPwGbZimcEcYmpa5dNKOl2VmjW54srNN0LV/
        lu2eL/rwU6uWCTvjLVAE952Ghw==
X-Google-Smtp-Source: ADFU+vtmg4y8gZK2RW82im9mLMJgdG+LNdFTlO2IwNXkHGgptNE87iYSfm9GE6CytTMDuufv/3KyHA==
X-Received: by 2002:a65:558a:: with SMTP id j10mr8651848pgs.13.1584828652463;
        Sat, 21 Mar 2020 15:10:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w17sm9046637pfi.59.2020.03.21.15.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 15:10:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org> <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add Coresight support
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org
Date:   Sat, 21 Mar 2020 15:10:51 -0700
Message-ID: <158482865109.125146.10520179077419628836@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-03-20 00:44:29)
> Add coresight components found on Qualcomm SC7180 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>

One nit below.

>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 507 +++++++++++++++++++++++++++
>  1 file changed, 507 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 998f101ad623..d8fe960d6ace 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1294,6 +1294,513 @@
>                         };
>                 };
> =20
> +               stm@6002000 {
> +                       compatible =3D "arm,coresight-stm", "arm,primecel=
l";
> +                       reg =3D <0 0x06002000 0 0x1000>,
> +                             <0 0x16280000 0 0x180000>;
> +                       reg-names =3D "stm-base", "stm-stimulus-base";
> +
> +                       clocks =3D <&aoss_qmp>;
> +                       clock-names =3D "apb_pclk";
> +
> +                       out-ports {
> +                               port {
> +                                       stm_out: endpoint {
> +                                               remote-endpoint =3D
> +                                                 <&funnel0_in7>;

Given that this is DT I'd say we just put this remote-endpoint all on
one line. Makes it more readable and I don't think we really care about
the line length in these cases. We're nested pretty deep because it's a
graph binding.

> +                                       };
> +                               };
> +                       };
> +               };
> +
