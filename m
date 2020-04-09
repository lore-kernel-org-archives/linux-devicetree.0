Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBE2C2BB54
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 07:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4E7A2075E
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 07:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NKXt6L08"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDIHTJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 03:19:09 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51027 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgDIHTI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 03:19:08 -0400
Received: by mail-pj1-f66.google.com with SMTP id b7so937851pju.0
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2020 00:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LjDNwr9hc6zw/ovFuo79eJ6mPjftFJLQluVccfJfC3k=;
        b=NKXt6L0809wT59OoC/lxSzJTR/UhuAL8l4ljcZw8g/LXk21E2/u9QSdKICUqqR4hFB
         Kj0m46XD1krSFWYdBJHCE/WBkPJg5m3EHH09usJkGeB8T9OFga6heaY6VbhAS6MagfXR
         r5sQCipeSlfTjBS5ftg48k0uPBTwKt4QjIhc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LjDNwr9hc6zw/ovFuo79eJ6mPjftFJLQluVccfJfC3k=;
        b=hGW4T1M9cl5GKMzdXInz5h8HYx1lwUcpBEPyLto17YHjYVpJ6iJwj86B3RPGH3uQdV
         zrrUWy12xBNAWkLwF9vC1cRBzQhStKzSxTtqjYFSGbkrpaOV/W1Qgg0Svjd/sveqgmvm
         QNQBnpuB6bn+RmG84k8JF9NvEv3ltusgAzwtAPmFWajh9GC8FXcW41Hk7WZ9iL4PpyAK
         OuB5Y45F++IC0zAhiLXiTZbm+vVM4xXCHXoMhd4s8nDZ8M1vB0GR/XiKU2q+85Umox+q
         mCB3u9SdRG9IBriRNkBcmTfP1raRFVmbD8U4cHCe/eTK1zAPKjB+cmz7W1ejh71gL7Hr
         4omw==
X-Gm-Message-State: AGi0PuaDFA42VG9AIe6RpK1fMHDrRFt5jhpsfToZrIbwvxaCOybmja+O
        +SjIWgaSSfxmoPWLp4C8594uTg==
X-Google-Smtp-Source: APiQypLfHMzDBFeHC74nZCdgQnkXwa/dP0kQJyTECHQenBLHI/lAQcGvJrKgOqIVxBsQpLgBNehlfQ==
X-Received: by 2002:a17:90a:a40d:: with SMTP id y13mr10027316pjp.116.1586416748619;
        Thu, 09 Apr 2020 00:19:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l18sm17273400pgc.26.2020.04.09.00.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 00:19:08 -0700 (PDT)
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
Date:   Thu, 09 Apr 2020 00:19:07 -0700
Message-ID: <158641674726.126188.15598430709257198656@swboyd.mtv.corp.google.com>
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

Does this SoC have a cpu-debug coresight component? Specifically
wondering if there's an 'arm,coresight-cpu-debug' compatible node that
can be added to this dtsi file.
