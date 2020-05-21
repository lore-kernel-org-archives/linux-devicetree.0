Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B80C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 00:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 769722078C
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 00:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KDwjANyo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgEUAjW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 20:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgEUAjV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 20:39:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B93C061A0F
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 17:39:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m7so2082822plt.5
        for <devicetree@vger.kernel.org>; Wed, 20 May 2020 17:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AuRWVLRxtpPKYDJF4d6J01cX+Jpvtmn7S05Da/vU59I=;
        b=KDwjANyodnr/KdFhYC8iRTa2ogAw/Bmn9gfyG7mniJvh19F4yz/337R3gj6e+DqHrt
         rTP7CGc7RgAHP/snyqEed9iILEB3w5F0WvVuYJxW5gHbaUCv6e5g9bLJTRWp2AwKSlG9
         Dt1FiRtkBMad7nsIlSzTaymvQ/1pSWGanTjQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AuRWVLRxtpPKYDJF4d6J01cX+Jpvtmn7S05Da/vU59I=;
        b=hjZuvVARtSX888dTRq4klhfshyl9v2KmWrpwlYReFKBMhcHofqMi7t8EfLMIeUtrmd
         jug/HrgTWZ3nG8uo+ERapvzJ2QUFhgyzYsjOA3kLOblNo+hZ0XjEu4UOE3ev8p1V9CBh
         Jmko+9ni8gFLb+gHg6sb5E6/J7jHeOFweWKKS78aO4NsXU6Al6YuHDJUJUhXgd6l0+xr
         b+uhuEDRClMClqj3eXde/UqLjBKkChB1x4dow2TosQqSJ6Rwzx/GtiUCWc/06oCOak2m
         uBe1tCXfLVvUVHSBck/ZUZwQo6KD0b7mYbJ71vMk2e+Etls4YVcc4fqaQ7JNQVgOvcb2
         nQ4A==
X-Gm-Message-State: AOAM533ogeqd5rDxXQUKB9Vx3xbX2oZTfxwddRkXv6dSj+raw8m4bfXR
        3gfBHJiE2MjZip1HQm+ktwp6kg==
X-Google-Smtp-Source: ABdhPJzRZdcv1ZemD8aJI6y1ci2NNs5bMnvQk6huU94fVngbjOvzaNN5p1vkWzbEoycbfgUl4V3zoQ==
X-Received: by 2002:a17:90a:dd44:: with SMTP id u4mr7639086pjv.132.1590021560562;
        Wed, 20 May 2020 17:39:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y5sm3005608pjp.27.2020.05.20.17.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 17:39:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589804402-27130-1-git-send-email-mkshah@codeaurora.org>
References: <1589804402-27130-1-git-send-email-mkshah@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Correct the pdc interrupt ranges
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
To:     Maulik Shah <mkshah@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org
Date:   Wed, 20 May 2020 17:39:18 -0700
Message-ID: <159002155857.215346.7990318931003802964@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Maulik Shah (2020-05-18 05:20:02)
> Few PDC interrupts do not map to respective parent GIC interrupt.
> Fix this by correcting the pdc interrupt map.
>=20
> Fixes: 22f185ee81d2 ("arm64: dts: qcom: sc7180: Add pdc interrupt control=
ler")
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index f1280e0..f6b4ee8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2308,8 +2308,7 @@
>                 pdc: interrupt-controller@b220000 {
>                         compatible =3D "qcom,sc7180-pdc", "qcom,pdc";
>                         reg =3D <0 0x0b220000 0 0x30000>;
> -                       qcom,pdc-ranges =3D <0 480 15>, <17 497 98>,
> -                                         <119 634 4>, <124 639 1>;
> +                       qcom,pdc-ranges =3D <0 480 94>, <94 609 31>, <125=
 63 1>;

This is a sign that we shouldn't put this information in DT. It was
wrong once so who knows if it will be wrong again. We don't have an
automated way to check this like we can check other properties. And the
information isn't something that is changed by firmware or the OS
loader. It is static data about the internals of the PDC device and how
it maps PDC pins to GIC SPI lines. We are probably better off just
setting up these ranges in the driver vs. relying on DT authors to get
it right.
