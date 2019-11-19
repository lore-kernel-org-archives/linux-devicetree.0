Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66A7C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:52:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B03442231E
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OldZWeSd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfKSSwS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 13:52:18 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36632 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbfKSSwS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 13:52:18 -0500
Received: by mail-pf1-f196.google.com with SMTP id b19so12643468pfd.3
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=02FNspwvnShCzwuS3D9UHrpf//faH9xNiHvzPZ2fzcs=;
        b=OldZWeSdKcojoNJiG5FIzcA0+2e55YljQt0j8hzTIg9glu0hwyGsivV9vLzjGBLk6a
         PQFt2+eLeLp2dpDd/ZbZ4tkXX3FxPEAQ72kGL4c6bMxNbZqwi5V1jjD3xzZ+2zRxWKTo
         IlXeZioZrga5Ch/lVAMr9bmiag6RADocbGCXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=02FNspwvnShCzwuS3D9UHrpf//faH9xNiHvzPZ2fzcs=;
        b=HSWcTN+KYq94PdzuRwaSnl6/9+4WSguwrz4W1/LPADDjCeBwgA1S3dQRb5HpWJzKYU
         iIM8LVl90AWIpOgSTEoVoDwMmz9VJWCe8bQp1s03/Sh08JILM3rU4AKwHheHBBybo4xW
         6i6IdL3tO+cMuw6oDQsspPuQpzhH4Qm/WNfr937xD1d5eKtGWy5YsGUPmONlOemjXJl+
         W/tZSextUbNSVbeuRZMuews6/JVcrFsxbLWLL5vwx477wzplJ1rxJA9Tg3D4zuAQFXkm
         0xwC1eZJfjPVUEk30v2XMiTEAj3JRcKbGtItV/cNlPexceVQvw5CSvpOM13zQjABTRDN
         u8uQ==
X-Gm-Message-State: APjAAAWXrhdYPbDyj2viTqZzdcV+pSlpMDV9A8n5rfPB9xGeJI3EcTQN
        onuXIn+qjugpJ8HTXrMfm7DcTA==
X-Google-Smtp-Source: APXvYqzNAFgRKg1fPICooJRMWduFfNrB8qvvRq7/qfmAip+mC2Bv1oY7A10Y/ObJtyGbd1Nm2rrLwQ==
X-Received: by 2002:a65:52c8:: with SMTP id z8mr5876506pgp.13.1574189537307;
        Tue, 19 Nov 2019 10:52:17 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k4sm26158658pfa.25.2019.11.19.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:52:16 -0800 (PST)
Message-ID: <5dd439e0.1c69fb81.f690a.e152@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99df8a-05504a3e-9962-4255-94e0-706e8186cd0a-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99df8a-05504a3e-9962-4255-94e0-706e8186cd0a-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 5/6] soc: qcom: rpmhpd: Add SC7180 RPMH power-domains
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:52:16 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:21)
> Add support for cx/mx/gfx/lcx/lmx/mss power-domains found
> on SC7180 SoCs.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/soc/qcom/rpmhpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 3b109ee67a4d2..599208722650d 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -166,7 +166,26 @@ static const struct rpmhpd_desc sm8150_desc =3D {
>         .num_pds =3D ARRAY_SIZE(sm8150_rpmhpds),
>  };
> =20
> +/* SC7180 RPMH powerdomains */
> +

Nitpick: Remove the extra newline

> +static struct rpmhpd *sc7180_rpmhpds[] =3D {
> +       [SC7180_CX] =3D &sdm845_cx,
> +       [SC7180_CX_AO] =3D &sdm845_cx_ao,
> +       [SC7180_GFX] =3D &sdm845_gfx,
> +       [SC7180_MX] =3D &sdm845_mx,
> +       [SC7180_MX_AO] =3D &sdm845_mx_ao,
> +       [SC7180_LMX] =3D &sdm845_lmx,
> +       [SC7180_LCX] =3D &sdm845_lcx,
> +       [SC7180_MSS] =3D &sdm845_mss,
> +};
