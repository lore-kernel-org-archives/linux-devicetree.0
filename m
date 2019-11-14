Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A4DC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 082A6206DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 16:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LpuWBohR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKNQof (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 11:44:35 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32845 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNQof (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 11:44:35 -0500
Received: by mail-pg1-f193.google.com with SMTP id h27so4141594pgn.0
        for <devicetree@vger.kernel.org>; Thu, 14 Nov 2019 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=z9i2SqlCSPTf1RDuhk0bEKcTfgK1Ck/QMzmHGPOu1Rs=;
        b=LpuWBohR+eI58I69S8JmazOQI7uK9MdeqB/qCG3vB+6ZiitoDNR44CQn1G5NnP05is
         kS44gFry4VUCjQ4bpPpQ5drGUpUrltx6aZPKH1MGOP47ghIN2Zhre0nsu3kwrj5rv1xc
         xLkZSz9o2Bn6RaTPa7CDZJTt3yOOutG0JPtwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=z9i2SqlCSPTf1RDuhk0bEKcTfgK1Ck/QMzmHGPOu1Rs=;
        b=IlD9RbFwb2eNK9o+p5lrQbHuYMmy4drCbqVXmuamLkScy0rZ/1UKKmJFkyZuj8x1/w
         tbcmgmYB8EkUoXYmhlXQ9e6Dn5BoyBweG0DSTpzjvLh8WUhHgbkmG48LSX4NgpF7aOXc
         eFC2hplnThkQlbKZSM+QJg+CRPyvFXe+1SaGc3Z+79NFi3msbeQPbhWe5GISL7JJDic3
         xbViLufKO8sUSAyrueA22Hsa7LCWtnVF5fXW3Ffzzu7w0D+Lb+zYvzBwlKTn1ynn8mpE
         HdQYreqJQq72txxEC3//WxmR9h1H9Z8qlQSkFl4nxI5yyz5ZjbB7nQ73dCuWSrvRR2jo
         1lew==
X-Gm-Message-State: APjAAAWAE27zf0ZmhNEPDkvaRpqdoiVZBA5RUbXJbJBjXP+3fGj1S6Wp
        rVgukS+viJxyBvmwbg8zYgxANKxFic8=
X-Google-Smtp-Source: APXvYqxUHBzT+KizgsIBpqIVYFjEIgCJMN0NbhTOv7Ag5teVD4a5wX6WoGifevIQaDF2Amn0VoWyRw==
X-Received: by 2002:a17:90b:1243:: with SMTP id gx3mr13315314pjb.98.1573749874512;
        Thu, 14 Nov 2019 08:44:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 16sm8387255pfc.21.2019.11.14.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 08:44:33 -0800 (PST)
Message-ID: <5dcd8471.1c69fb81.aee46.634e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573733569-25940-2-git-send-email-sanm@codeaurora.org>
References: <1573733569-25940-1-git-send-email-sanm@codeaurora.org> <1573733569-25940-2-git-send-email-sanm@codeaurora.org>
Cc:     =linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add USB related nodes
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 08:44:32 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2019-11-14 04:12:49)
> Add nodes for DWC3 USB controller, QMP and QUSB PHYs.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One minor nit below.

> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 666e9b9..82f0b3a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -911,6 +924,98 @@
>                         status =3D "disabled";
>                 };
> =20
> +               usb_1_hsphy: phy@88e3000 {
> +                       compatible =3D "qcom,sc7180-qusb2-phy";
> +                       reg =3D <0 0x088e3000 0 0x400>;
> +                       status =3D "disabled";
> +                       #phy-cells =3D <0>;
> +                       clocks =3D <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names =3D "cfg_ahb","ref";

Add a space after that comma please.

> +                       resets =3D <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +
> +                       nvmem-cells =3D <&qusb2p_hstx_trim>;
> +               };
> +
