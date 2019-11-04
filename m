Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA75CA9EC9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C32420848
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 21:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KQcEZHNm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfKDVo3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 16:44:29 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33011 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbfKDVo3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 16:44:29 -0500
Received: by mail-pf1-f194.google.com with SMTP id c184so13426062pfb.0
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 13:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=oDBr9/oFH4uj0TcWt5+hNxdLZNFzTGYbiWx7cDw1BXk=;
        b=KQcEZHNmmz0KcwFTyLZr214Hyq78kr87VR/k9odOVNnbzAJL+GLXRuxzL4jRfJ8fAb
         8NDz/wkG7qrmwBW89xK3lrqy7czNP39gNhn5TP44WRi2UhnE916/a8s/Uzu505IjIono
         NdyE0yEXI5SUoDpRq6j3bN9m4KTjeYxyJrmUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=oDBr9/oFH4uj0TcWt5+hNxdLZNFzTGYbiWx7cDw1BXk=;
        b=Xm0IM2jCJbUFtlkpD9l3JQgepkGahWlZIGavw0LS2Eg6i9oi0fkKO13ueISJs4/mLc
         sJPPpnoM0kmryPE9ooQHUU7rFmKPR9kgpgB72D+1/jzHd1i0+HhiOx0EC3OOkrdhR3Hp
         KiKGH+CiUyCyvCwSooHPmnIJrRF5r7PAWpPELlwzLNHaVFwbn3aIlgEES+DeMTqrITDD
         ryyTysRB4EumuwEuWNadmJAMceOULH5Ute9XxgJDODDN5/jeQtCaNS8BqOOy7CwDpRpT
         EaeOQIbznkXzSkMZHC46OLC5cvIpy8axQ74vB5VOSLjfRisc7BXOtshpmDSrApdfjIde
         krig==
X-Gm-Message-State: APjAAAWVMPUAlXN/nDwyHif/CTy0ysIwosMpRFkGeRDqdB4eIgf+zDD0
        57Hjqs882BCPMZPdtvRr5FdEsQ==
X-Google-Smtp-Source: APXvYqxULdu2yok9osG2dgC/wKOKO0AYP4xnZcw5ULrVYfDMRd3mLMzhSqWhO9gPC7VRZ3QfMrhwrA==
X-Received: by 2002:a65:49c7:: with SMTP id t7mr5242177pgs.431.1572903868384;
        Mon, 04 Nov 2019 13:44:28 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w26sm27836645pfj.123.2019.11.04.13.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:44:27 -0800 (PST)
Message-ID: <5dc09bbb.1c69fb81.196e5.9770@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572610108-1363-2-git-send-email-rkambl@codeaurora.org>
References: <1572610108-1363-1-git-send-email-rkambl@codeaurora.org> <1572610108-1363-2-git-send-email-rkambl@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org,
        sanm@codeaurora.org, Rajeshwari <rkambl@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180:  Add device node support for TSENS in SC7180
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajeshwari <rkambl@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:44:27 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajeshwari (2019-11-01 05:08:28)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 07ea393..06ded1d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -449,6 +465,508 @@
>                 };
>         };
> =20
> +       thermal-zones {
> +               aoss-0-usr {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;

Can we get real polling delays instead of 0?

> +                       thermal-governor =3D "user_space";
> +                       thermal-sensors =3D <&tsens0 0>;
> +                       wake-capable-sensor;

What is this property?

> +                       trips {
> +                               active-config0 {
> +                                       temperature =3D <125000>;
> +                                       hysteresis =3D <1000>;
> +                                       type =3D "passive";
> +                               };
> +                               reset-mon-cfg {
> +                                       temperature =3D <115000>;
> +                                       hysteresis =3D <5000>;
> +                                       type =3D "passive";
> +                               };
> +                       };
> +               };
> +
> +               cpu-0-0-usr {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-governor =3D "user_space";

What is this property?

