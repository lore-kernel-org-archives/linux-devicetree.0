Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08C8C35247
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 00:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B915F2084E
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 00:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kDr0RDif"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgBDAxk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 19:53:40 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55478 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgBDAxj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 19:53:39 -0500
Received: by mail-pj1-f67.google.com with SMTP id d5so559509pjz.5
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 16:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=EqilKiHTNveKi1LcyG0EtAuH8ju2tyf0K0wsaH9n1ew=;
        b=kDr0RDifk3SFubp70TBZTkLSR6FxsFHG0EwSkSviv16+9REy+v0hQtEZvdXhAhpVO2
         +M6QVOjdZyNKAtmCzjpW65eH3PEOxNLxRgfYdaCQx2tjK9eysC80ikKhrzrKQ8M4eAAA
         9NetXitSHx4WLcW4O1H2slOlX09g5ISARRaaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=EqilKiHTNveKi1LcyG0EtAuH8ju2tyf0K0wsaH9n1ew=;
        b=czWOoTNUS/ZBQpfqBIL7T6vxVEGeb3o30lUfYsvQvHQYl8cDRFvHGs4/DUr4KVF+e+
         qEl5bDAL5LJojfAX+k1PI9lG31kEWmmx+yuhY7BHrayotUU+TUPaeOvFCm1x6H59GYoD
         dWym+fN904LjSqkysaT0Tq2UYXqVvLh4/N+4bbp6pl6AtKvGVb0jMVL1C9vKBAvuuHma
         3Z5qHIU1KDEOcPpCjuQJ1QDRoA07pAU+lOc9fCqNTqTty6lTcZXLyr1T98ize6wIqZw0
         OFK2M5PM+Rr4ddyT55rGWRAuKZo51826w2JJAcOhj0kZAOYhs0zSN8JctX/u7VAa6AX3
         kL1w==
X-Gm-Message-State: APjAAAV21VBj01SkKJEXH7ffsfTR6zywuTBWqcIiQiXwbhn3r1ufS5Pq
        DdA068Hyl0weOjzcT7GpZNo7NA==
X-Google-Smtp-Source: APXvYqxlB47a5/4QDe/3t/8a8B4QKjse7vdvn9CcX4pnLDTWPR0vqmEqkli5mAM62adYF46yaLwiEQ==
X-Received: by 2002:a17:90b:1110:: with SMTP id gi16mr2326917pjb.110.1580777618467;
        Mon, 03 Feb 2020 16:53:38 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m22sm22680995pgn.8.2020.02.03.16.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 16:53:38 -0800 (PST)
Message-ID: <5e38c092.1c69fb81.4fbb2.d9df@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org> <1580305919-30946-9-git-send-email-sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP device
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 16:53:37 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2020-01-29 05:51:59)
> Overriding the QUSB2 V2 Phy tuning parameters for SC7180 IDP device.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dt=
s/qcom/sc7180-idp.dts
> index 388f50a..826cf02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -276,9 +276,11 @@
>         vdda-pll-supply =3D <&vreg_l11a_1p8>;
>         vdda-phy-dpdm-supply =3D <&vreg_l17a_3p0>;
>         qcom,imp-res-offset-value =3D <8>;
> -       qcom,hstx-trim-value =3D <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> -       qcom,preemphasis-level =3D <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> +       qcom,preemphasis-level =3D <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
>         qcom,preemphasis-width =3D <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> +       qcom,bias-ctrl-value =3D <0x22>;
> +       qcom,charge-ctrl-value =3D <3>;
> +       qcom,hsdisc-trim-value =3D <0>;

Actually, I'd prefer it uses /bits/ 8 here if it's just 8 bits.

