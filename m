Return-Path: <SRS0=bA0P=AA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DBAC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 01:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30B1D20776
	for <linux-devicetree@archiver.kernel.org>; Fri, 19 Jun 2020 01:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oLZbVHf8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgFSBMx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 21:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbgFSBMv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 21:12:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88835C0613EF
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d66so3660660pfd.6
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 18:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
        b=oLZbVHf8BIG6+THknBsryI8MvBmceKvdaIGFcE3E8GegV/CVRGi6iE+Kwgyq9mrL17
         XRSoTGChHFP9fypFoBBia72WZxyDSkB0DKPHBdJZDUNsFAhLAEFRLc/D+ClLJBVEUj5u
         8TfIW2yPdC0tRHqgM6ZlMpL1HE2kF0GK5OWBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=C2dez5Y5nxFP07QRNZ0OnRkJ8X7zqlBAGXKDCAlVfhY=;
        b=be/kMVKnsmpZIbYdWLfarGPaJJxQ0j/u47qxeLmSWczOdfaSZFtRKVZbYIXDCgS5dm
         dTabbSwOelh0AWF5ZoplZn2YgSuqYd7VEPOC9ylRFT2wsZoONIX5D1fFco4Ar7RSlo8v
         kPjghkbFIrIU63hWSIZ8ODh0GZcP1npKcgSJBs33wURFBgVWLwQf2jbG3gcrWl8ntFjt
         FWcfynbVCWvB6Fpiad2Ppa1TgZyiO/hKM70tY/cq+EKWO31tTovucmtUBbVRZPnIhEpS
         foBsMNtBGNFh3BhyqO5Q/VeIpRkqnZxOyJYFdn28GlLaZZ9zw9qoP6jaOusWjbczLMXD
         TeGQ==
X-Gm-Message-State: AOAM530ufgkKQJokKfb/obQPPI/1dBxnuUZR2HtHNILHUEPcwiIx9O74
        od/rJoI3qmCbF3nCf+KrxHi0EIrfRfc=
X-Google-Smtp-Source: ABdhPJzpkIA9xRXSKhL1HR6SniZnYA3qMlfoJJoj709qP03uEsU3yPapKSC/mT40nipGsCn4VwPPgg==
X-Received: by 2002:a65:614b:: with SMTP id o11mr995414pgv.443.1592529169747;
        Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id n1sm3622207pjn.24.2020.06.18.18.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 18:12:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200618232113.22687-1-tanmay@codeaurora.org>
References: <20200618232113.22687-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add Display Port dt node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, dianders@chromium.org,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        bjorn.andersson@linaro.org, Tanmay Shah <tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>, agross@kernel.org
Date:   Thu, 18 Jun 2020 18:12:47 -0700
Message-ID: <159252916745.62212.16228625951632835694@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Tanmay Shah (2020-06-18 16:21:13)
> Enable DP driver for sc7180.

Add DP device node on sc7180? This isn't a driver.

>=20
> This change depends-on following series:
> https://patchwork.freedesktop.org/series/78583/
> and https://patchwork.freedesktop.org/patch/351990/
>=20
> Changes in v2:
>=20
> - Add assigned-clocks and assigned-clock-parents
> - Remove cell-index and pixel_rcg
> - Change compatible to qcom,sc7180-dp
>=20
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 57 ++++++++++++++++++++++++++--
>  1 file changed, 53 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 916401f7e87c..26fe623e3b0f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2216,10 +2216,19 @@ ports {
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> =20
> +                                       port@1 {
> +                                               reg =3D <1>;
> +                                               dpu_intf1_out: endpoint {
> +                                                       remote-endpoint =
=3D
> +                                                                <&dsi0_i=
n>;
> +                                               };
> +                                       };
> +
>                                         port@0 {
>                                                 reg =3D <0>;
> -                                               dpu_intf1_out: endpoint {
> -                                                       remote-endpoint =
=3D <&dsi0_in>;
> +                                               dpu_intf0_out: endpoint {
> +                                                       remote-endpoint =
=3D
> +                                                                <&dp_in>;
>                                                 };
>                                         };
>                                 };

I thought this wasn't supposed to change? At least according to the
binding it shouldn't be needed.

> @@ -2293,6 +2302,46 @@ dsi_phy: dsi-phy@ae94400 {
>                         };
>                 };
> =20
> +               msm_dp: displayport-controller@ae90000{
> +                       status =3D "ok";

Please use status =3D "disabled";

> +                       compatible =3D "qcom,sc7180-dp";
> +
> +                       reg =3D <0 0xae90000 0 0x1400>;
> +                       reg-names =3D "dp_controller";
> +
> +                       interrupt-parent =3D <&mdss>;

Any reason why this isn't under the mdss node like the other display
device nodes?

> +                       interrupts =3D <12 0>;
> +
> +                       clocks =3D <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                       clock-names =3D "core_aux", "ctrl_link",
> +                                     "ctrl_link_iface", "stream_pixel";
> +                       #clock-cells =3D <1>;
> +                       assigned-clocks =3D <&dispcc DISP_CC_MDSS_DP_PIXE=
L_CLK_SRC>;
> +                       assigned-clock-parents =3D <&msm_dp 1>;
> +
> +                       data-lanes =3D <0 1>;

This can and should be left to the board files. At the SoC level my
understanding is that there are four lanes possible, so no need to
artificially limit it here.

> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                               port@0 {
> +                                       reg =3D <0>;
> +                                       dp_in: endpoint {
> +                                               remote-endpoint =3D
> +                                                        <&dpu_intf0_out>;

I'd prefer these were on one line, regardless of the 80 character line
limit/suggestion.

> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                                       dp_out: endpoint { };
> +                               };
> +                       };
> +               };
> +
>                 dispcc: clock-controller@af00000 {
>                         compatible =3D "qcom,sc7180-dispcc";
>                         reg =3D <0 0x0af00000 0 0x200000>;
