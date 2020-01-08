Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C04BC00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 03:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DFDD2070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 03:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="csH6h22W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAHD12 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 22:27:28 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36690 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgAHD12 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 22:27:28 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so1478201oic.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 19:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=csH6h22WfZnD1xkdgwOCne3Jv32LmlbUzVEaLBevEMe50H5rAy4ECEVfBiovZy8xDu
         b6pHK8e06WX+imuJ6fHw26HY714lCwLnbniIGh5DWXQQ+ipOUvm0uHPExjCoeL58F4te
         MCDUDMy2u+PUNUzChxap4ixBAdfsjM/rm0ovA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xceLEnO3BCgE8gw6ehmf7oIvMEjYUFeqhS/nKgWDqFI=;
        b=C3QeNHI0+4yoRq0alOeozX7IUdFaKbJZvwslElwwglpbATcbrnMorozaUrEoplDREF
         McQ51v6ZxbUvW2G15huXdpnAB4an7F3eL9+5d70x4BfR9a+uAxItrtGTMpj3j+b772AU
         LSBy87sH+kLwvMdOqp0NcOO1i/M57gSnHUjRY9iD9xLGQC6lUlSPPyZqzFwz0Iyde5mh
         veEiD++bN9VUUuBfX8Sznm2V1ZPlq8pPW0rUBuBkOztC46LumZc9taC1zz+kPT/N9U3O
         Q8npHMqETj6+ed/BqKh379al8xnidCZgJDdun4VHtnIlFEVb+LRvnAV+Oed7EQcFWpwr
         0dow==
X-Gm-Message-State: APjAAAVJKQ8onX7KS+AGVkqd7Pj08PRGCWdetoVgNVs7fB7eCKOsowSW
        I62qojSw/1cwx2PEJx1VD77GVdZ031MTkg==
X-Google-Smtp-Source: APXvYqzwQPtc6Fzi+cgAhdM1aA5kyaJsZGw/TEwepc/gppO9s49FekWHDaYMr3mwoZYOQIku+4XSAg==
X-Received: by 2002:a05:6808:8f5:: with SMTP id d21mr1509861oic.58.1578454047738;
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id w72sm675867oie.49.2020.01.07.19.27.26
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 19:27:27 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id l9so1469612oii.5
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 19:27:26 -0800 (PST)
X-Received: by 2002:aca:d0b:: with SMTP id 11mr1457408oin.71.1578454046328;
 Tue, 07 Jan 2020 19:27:26 -0800 (PST)
MIME-Version: 1.0
References: <20200107143402.122455-1-acourbot@chromium.org> <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
In-Reply-To: <3aef91ea-30c1-530f-0c18-ea52b92347f9@linaro.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 8 Jan 2020 12:27:15 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Message-ID: <CAPBb6MWY6OEc2EbPW=k8vFU32POamNs0FHJus8fg1u5A2uxrzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add Venus firmware node on Cheza
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jan 7, 2020 at 11:50 PM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hi Alex,
>
> On 1/7/20 4:34 PM, Alexandre Courbot wrote:
> > Cheza boards require this node to probe, so add it.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 6 ++++++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > index 9a4ff57fc877..35ba65cd9822 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > @@ -1279,3 +1279,9 @@ config {
> >               };
> >       };
> >  };
> > +
> > +&venus_codec {
>
> We have similar patch for sc7180 and call it just "venus". Do you think
> we should shorten it here too?

Sure - sent a v2 with that change.
