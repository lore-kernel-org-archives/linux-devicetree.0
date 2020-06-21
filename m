Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A141C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 18:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F31B2221E7
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 18:56:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcJLlUlD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbgFUS4R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 14:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729783AbgFUS4R (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 14:56:17 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E798CC061794
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 11:56:15 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id i74so13665158oib.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2r26ZQAdN4GoklsV0xP0YFMPJK7NXM2OoxqIwBxLXXY=;
        b=gcJLlUlDkgfAiQ/+U9NJZYMVurjS7cq2M6Xvu50NY4nRFAfTXaZH69BBNPaFdW9pC6
         YTFCjDkHCGdPe7aBgsdXwfxDLlv/kX2WjBwkMWnaXxxK4tbwAsa7wozF/j14dhtIxnVA
         sJmS/JhJcnf9p1c+6uESIm9VNVdmlXlMTWUR86Fc4mAJkpXyn1+8HEVRUDIhVoLB0hfH
         8CJ1z8eXMrakjBAZqoaLFuD/A0nl8sOVpILVyFMO/1j5Y9VikIZyuywcT/OxmGgY6LFW
         Wx9c+Sh/A73cGUMMUGSTIFY4+Y6s8cEKQ8Cl9DjfVNp/3Qb5z+mvhinmNLyaJKknR5vW
         IpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2r26ZQAdN4GoklsV0xP0YFMPJK7NXM2OoxqIwBxLXXY=;
        b=aW7OsYeHkQsNQrznC57VWE+O31qpbl+eXUysu6t8aVX74xjDn09v5OBLGATHrX020Z
         S2TstMKAuCzT3eitu+GzF2fOO8mCZXvtONZlNsQKBHxa+02jTIUNQjqBatmXRhOk51/o
         IkZrZu2IXZXeSVVOucw3Yt5KiaM6fIi8nFtYcepmhIbZ+bISUiftS/vtgAARzS8aAE3O
         FHACCD/kCoI+XktcEdnDpnnReYhp0WwqLYIQ6lW5zMlFuYiyGPX1iEUgPWoyO/dFEpyz
         Y2jW3T1n+Nui1eT5p7EJTohFPo6vpCK5JoaFTrEeFamR8J41PSBfgFdnw65m93FJADNE
         RoZg==
X-Gm-Message-State: AOAM533uYKUlHvMA4HqOW3280Xo+KfDigq8MiUPGXS/otWjVhG/rhy0r
        gkWJutNtyL53CuYBDaVLZ5unInl2vhJoha3ogEDtJQ==
X-Google-Smtp-Source: ABdhPJyyjnHIxIz912lNk3b1yarc1xc9PkqtEyaXn3fCVH8+hjOgMIgybWwGJuyKC3uNZhkgm5f3A3RrFB6xEuoHrxQ=
X-Received: by 2002:a54:4399:: with SMTP id u25mr10581982oiv.177.1592765775327;
 Sun, 21 Jun 2020 11:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org> <20200621064214.GA128451@builder.lan>
In-Reply-To: <20200621064214.GA128451@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 21 Jun 2020 21:56:04 +0300
Message-ID: <CAA8EJprbWntcJ_9sKy3veNeEds8nR4cC6sbEcXbhtrsf5Q9O1w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org,
        Patch Tracking <patches@linaro.org>,
        linaro-kernel@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 21 Jun 2020 at 09:45, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 03 Jun 17:43 PDT 2020, Dmitry Baryshkov wrote:
>
> > Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> > new file mode 100644
> > index 000000000000..9f3e19b5bd00
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> > @@ -0,0 +1,40 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2019, Linaro Limited
> > + */
> > +
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > +
> > +&spmi_bus {
> > +     pmic@a {
> > +             compatible = "qcom,pm8009", "qcom,spmi-pmic";
> > +             reg = <0xa SPMI_USID>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             power-on@800 {
>
> Please name this "pon", just for consistency.
>
> > +                     compatible = "qcom,pm8916-pon";
>
> Can you confirm that pm8009 is subtype 1, and hence the reboot reason
> going into RB_SPARE should be shifted 2 steps, rather than 1 as in the
> newer PMICs?

For pm8009 the subtype reads as 0x07, while according to msm-4.19 gen2
handling is only enabled for subtypes 0x04 and 0x05.

> Would be nice if we had a generic compatible that read the subtype,
> rather than having to add new compatibles for each pmic (or use the old
> ones)...

Will do it in a separate patch.

-- 
With best wishes
Dmitry
