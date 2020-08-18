Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480D6C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 00:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25EDB2078E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 00:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lD3hYa4S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgHRAW3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 20:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgHRAW2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Aug 2020 20:22:28 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71B5C061343
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 17:22:28 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x6so8895662pgx.12
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 17:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=G4S72b5uoF0KvLSq8Fxn7M3pQq4TBaiGBup4iTUl/TU=;
        b=lD3hYa4SkXByNwvhpt56gj/tstJy1tqXwYDtCWD3Qh1s2U6dZw5MEzqRk08E30ztkT
         H/Lu0d2EH0rF/bkPDTJVXWn47uVNcdiGJ1hCMU3zKIXlLYl+dtVhUKvm1nAu1iFV1A6i
         FBmisgXAtLRbUcQ4JPFyzI1jg1WPfNLwNE1gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=G4S72b5uoF0KvLSq8Fxn7M3pQq4TBaiGBup4iTUl/TU=;
        b=c+gFaA7xn3Zqtd3Xd2ZDYeXQPLa4rOi/qLLMVzOZcTWVSpJsQCVKMOe69bqPyoAIqS
         QOf03305iNCHIXZVNKPdGYklo1xYM3n69VZ8R3Jr31oTCuu7VSNP1wVAwyNY4COaL2P1
         xvtnss7uS4I0xM6Q79T8Gpdz0vHPoiJC/5oZDjsJQiIlGx40bZIimz9gwf/s/DFT7bos
         0or2QCx/ffpESnOcdcSsyKpOenF/l56qVMiUOPPZVW4W9X4qnoCsCknwUor222kaossr
         HTfu5dNW4niyYWcT9gY2gFZ/VAgaKpde5JqMgjItdkMii78ySPx298TZDTpxb7dKyYZ+
         QPGA==
X-Gm-Message-State: AOAM5329lgIlGemZsXuaMyu/hDd1MjWqnyozFe4PHDpwFNl3wFY7Ii61
        aCCWph4XzOFed/+un4DDat6m9er4PAVLqw==
X-Google-Smtp-Source: ABdhPJyx5W7AFU45MW9bjlWtaga4TqK2K/MQWMdH80dZVXkjSwadqmJpL5/JLqjL+aKPBgsgPwBzeg==
X-Received: by 2002:a63:30c6:: with SMTP id w189mr11295826pgw.241.1597710147966;
        Mon, 17 Aug 2020 17:22:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id h5sm21282963pfq.146.2020.08.17.17.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 17:22:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200817225912.3149-1-tanmay@codeaurora.org>
References: <20200817225912.3149-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        khsieh@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Date:   Mon, 17 Aug 2020 17:22:25 -0700
Message-ID: <159771014584.2423498.11072252787625455437@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Tanmay Shah (2020-08-17 15:59:12)
> This node defines alternate DP HPD functionality of GPIO.
>=20
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index bf2f2bb1aa79..0eedf057acc1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1457,6 +1457,19 @@ pinconf-sd-cd {
>                                         drive-strength =3D <2>;
>                                 };
>                         };
> +
> +                       dp_hot_plug_det: dp-hot-plug-det {

And this should be sorted alphabetically instead of put at the end of
the node.

> +                               pinmux {
> +                                       pins =3D "gpio117";
> +                                       function =3D "dp_hot";
> +                               };
> +
> +                               pinconf {
> +                                       pins =3D "gpio117";
> +                                       bias-disable;
> +                                       input-enable;
> +                               };
> +                       };
>                 };
> =20
>                 gpu: gpu@5000000 {
>
