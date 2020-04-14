Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713EFC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:29:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CA9D20575
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 19:29:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejCS7DL3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504762AbgDNT3A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 15:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504757AbgDNT26 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 15:28:58 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E29C0610D5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 12:28:57 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id k21so899795otl.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXl5LngxcEox6tFkMcsHWj7/e31HOzYbZGvPkAeshzo=;
        b=ejCS7DL3ag6duTxMi2Ewpv00tGgVeaaEYl909NqixmQ15Qfq51ylCT9rHeFXSPUOk2
         vtyBZ6NZuEAQdkWQHdUA1JMWEZ5a6JIJb0+mJx2uExrZl2LAL3R0IkdFluJ5FE4QU0H3
         XAZImBwtrpZeU6j+JV+hS3nuxF3J2vNG6uk42/IVOlWQo4YYxfDSRoioISx/gckZPhmt
         CQ2i4dwZhU7B1CYMJik4ck7ILQHs9mpEkR5EF377I+1sComWBiqgdjX+IdeAa6W8E8KK
         a2DSXOfoToBilcypqD49C2OvoP8jMRnBBfFpAJyp0pwsff8FnqzSXoiUU7D68iQ4qpqO
         rdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXl5LngxcEox6tFkMcsHWj7/e31HOzYbZGvPkAeshzo=;
        b=Xi8MW2Jbu1ybOVQOTdkiNbGD1cAJ6iaHyRyLbDlVPQtflOnCNa2RWpjJ0nZ3uC/DRT
         eB3cXA6eCd2eKgKv1HooNtOgRiYYxT8PquXiiKqR0NWXH4GdWOqWVQJfPs+j0S2sV147
         pAcmxajfl5wMtVbnzYTmJyNXNUlz2BbdP0wWX4LcRUumk+XXbG6lAwLKaypmtxziTAxU
         hFe3tsBq2wBPlz4KpqGiSniTjk/NbNfrLtIcP22hkDCDyFed779muIr7oanG9+lsFnQi
         au05KiiTD1qZYnaEXex5diETWByIlQvTpn6O4oxRAs72OdeYTSrV6VSVvRPPC+IFahtW
         t0lg==
X-Gm-Message-State: AGi0Pua6qTx+3fsJ6eFzBGG/UFur7e5NAxC2YHctgPQahnv+1Cpxk1Iz
        d+pr5Vm+f0cdEoxk5WgY9w9ZcPfD8mTgpF2E7K6H5A==
X-Google-Smtp-Source: APiQypLNgzWQIOmbMjbOIDPabi7ahVlW8rXca4fleUQzDSYq/+Zo4l7gzAwDGKt/X8yYn92PkHHYUl5oOnJLWGe/36A=
X-Received: by 2002:a4a:3006:: with SMTP id q6mr10846802oof.70.1586892536562;
 Tue, 14 Apr 2020 12:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414185744.84581-1-john.stultz@linaro.org> <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
In-Reply-To: <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 12:28:45 -0700
Message-ID: <CALAqxLWS7+wqARFVoDStVcf-B77sPc6GaHBKebfMh1gXyUP4HQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy"
 compat string
To:     Doug Anderson <dianders@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Apr 14, 2020 at 12:14 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, Apr 14, 2020 at 11:57 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > This patch fixes a regression in 5.7-rc1.
> >
> > In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> > PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> > as a generic compat string. However the change also removed
> > the "qcom,sdm845-qusb2-phy" compat string, which is documented
> > in the binding and already in use.
> >
> > This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> > which allows the driver to continue to work with existing dts
> > entries such as found on the db845c.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Manu Gautam <mgautam@codeaurora.org>
> > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> > Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> Re-adding reviews from:
> https://lore.kernel.org/r/158631458374.216820.17829557619378130779@swboyd.mtv.corp.google.com
> https://lore.kernel.org/r/CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Ah! Sorry, I thought I had added those to my git commit, but
apparently I didn't!

Many thanks!
-john
