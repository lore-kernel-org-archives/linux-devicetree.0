Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 661D6C3524D
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 17:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A75B20674
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 17:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cG81154L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbgBDRCf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 12:02:35 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36725 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbgBDRCf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 12:02:35 -0500
Received: by mail-ua1-f66.google.com with SMTP id y3so7006985uae.3
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 09:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tbyhy2j9tl7lmdNZyQW97ifEWRaHT4auclOyiJhATrA=;
        b=cG81154LPl6MHpTi4K0mfvhqs8a7wrBNf08IQEhTRcKMO8cBXjk/69NkI4v5yGZDU1
         BN4jB3aRGY2vhXNVlTk5CJsvASg/55gcEfY1wmEX2HR5LLta90Ea9vB3mGkoWTakKO54
         2XdBgvH8iy/T9ZJnPkLGhWxyUEnPpaf3TrA/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tbyhy2j9tl7lmdNZyQW97ifEWRaHT4auclOyiJhATrA=;
        b=qv/oKkE+zuB+EYsZKuB4f3WVyNuRF8hcMl2mg3xyOorfQUku7QnkI0XkdE30duLSv1
         uKbTUPbsluyL4gyV8Tt7VZc1BPIZuBIKGYR9iW+rYO3GoLco1rCWRW7v1Ehz+yaHEPI8
         7a4YnUt/rEqnuFJGCaYqgqML8n3d+W3NUam/MGTthxqmQ3G4JncOIogGZZ6LbfjQGejs
         EO6rFanr++vIvagMe072XHSES1/bJXlmsGb3Zahw6bNsv6xTA1HWaOUeJi+FSz0WJgwV
         HaWtQUIts1DTk/SakjjVCrM2Qf7QHuAYB/fVeSTTd5q7MbiJwRRmpUabv5aMIuJcTcS8
         /CKA==
X-Gm-Message-State: APjAAAXeEh/uJCz3nlNVbcFgySNCnVCldH7fX78YSzxh8y45h+IS9hbl
        BFn7kiFsW+T4Oy48P5TjMWKYMIEER9I=
X-Google-Smtp-Source: APXvYqwRQXHtNrzvS52v2jSCeC2k1KU0i34xq5bxfQ7u+xXRXCimORnDVKhhvu/hm86ES7W3nHqvsA==
X-Received: by 2002:ab0:6001:: with SMTP id j1mr18084459ual.56.1580835754169;
        Tue, 04 Feb 2020 09:02:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id x22sm6514177vsq.6.2020.02.04.09.02.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 09:02:33 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 80so4129487uah.9
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 09:02:33 -0800 (PST)
X-Received: by 2002:ab0:5c8:: with SMTP id e66mr17743329uae.120.1580835752473;
 Tue, 04 Feb 2020 09:02:32 -0800 (PST)
MIME-Version: 1.0
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-9-git-send-email-sanm@codeaurora.org> <5e38c092.1c69fb81.4fbb2.d9df@mx.google.com>
In-Reply-To: <5e38c092.1c69fb81.4fbb2.d9df@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 09:02:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xi=SFAjz9dAJsz-UXNPpGoC+FT5j77t+r5xCNfGMgViQ@mail.gmail.com>
Message-ID: <CAD=FV=Xi=SFAjz9dAJsz-UXNPpGoC+FT5j77t+r5xCNfGMgViQ@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy
 params for SC7180 IDP device
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Feb 3, 2020 at 4:53 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sandeep Maheswaram (2020-01-29 05:51:59)
> > Overriding the QUSB2 V2 Phy tuning parameters for SC7180 IDP device.
> >
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 388f50a..826cf02 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -276,9 +276,11 @@
> >         vdda-pll-supply = <&vreg_l11a_1p8>;
> >         vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
> >         qcom,imp-res-offset-value = <8>;
> > -       qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
> > -       qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
> > +       qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_15_PERCENT>;
> >         qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
> > +       qcom,bias-ctrl-value = <0x22>;
> > +       qcom,charge-ctrl-value = <3>;
> > +       qcom,hsdisc-trim-value = <0>;
>
> Actually, I'd prefer it uses /bits/ 8 here if it's just 8 bits.

I have been giving the opposite advice and I thought in general Rob H
suggests against adding "/bits/ 8" unless it's absolutely needed (like
for an array).

One example from
<http://lore.kernel.org/r/97cd8c1d98d7406347e4e48f4c7383a394a2ae93.1451997697.git.oreste.salerno@tomtom.com>

> > + lp_intrvl = /bits/ 8 <0x0A>;
>
> If the size is not 32-bits, you need to state that in the description.
> There is not really much point in making these 8-bit though.

-Doug
