Return-Path: <SRS0=az0Z=AC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77421C433DF
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 512DC206F1
	for <linux-devicetree@archiver.kernel.org>; Sun, 21 Jun 2020 19:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uv29zYAV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729984AbgFUTGG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 21 Jun 2020 15:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgFUTGF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 21 Jun 2020 15:06:05 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50210C061795
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:06:04 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id a137so13678092oii.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2020 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o53PdA9uPCJnfRH0bPZtJEfl2g77G3rHoAKUfp/7kUo=;
        b=Uv29zYAVX0tqPL1HplFFe7dbL1EPjMyH4TJF2szni+U9GYruN0WuhWks/JS+IaTOH+
         CX+scc33/HczNRmVNRG8B9PISC+uFAmv6rivLOFuC7xQTtUUW5+IqrduxfQfTdDSUFOt
         r1+DA9dE6yIDNaBieTpNekHldFWe2JansxxSJPdROdjFbXTIjIWy001OEyZncJrWfu+w
         miwX4BzeePlx8QJfSbSakQnr3D3N1BPzSM/zQ1rckuVi+LEz8Sxbn4oC8MDopTlk0Dth
         9d5E3qusi3Zj8KoxRug/my8K35mpTuMrrbgQGb5z9i8+XhpthdE2k9EUGa3A5TE4nzZz
         5hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o53PdA9uPCJnfRH0bPZtJEfl2g77G3rHoAKUfp/7kUo=;
        b=LCR/iH8+sYSbknElu26GvHKclC+58IB0ALi6aAd6m39KUB4wsNRD67/4vpdj+fjBQG
         tLDXS4R4ifrFxbUhFmM7rQselu/tHj1HFM/vm6DyG4Zl4UUxBlDMG53hInxfi615Jl5m
         BzdiCwQ0rWxHOrBrZ9bh0TitOGDltrmC97R+uRJetUr60zrYjCbdSUSXzNrMkYvwQG0X
         tjX1YYciApJVef4IA47zIHWQoOYCE4BMsMvnANiryx9C45uHu+8UVRFxrXYGGW+AUyXI
         ZR1V3AorbYZ2132jn4RBd6WVm+ETdu0lERhkobsFWODfVyJGYpE+meTVapRe2aiCHzpj
         1uBg==
X-Gm-Message-State: AOAM531WfUM7sRF4zh9vzo1Du+tLv+byc+1/f9A4/cNjNVZo9Uu12ccl
        TBeN5yPsrxhT5rm8062+ckrWXNpCiIjbJ79VD0sI2Q==
X-Google-Smtp-Source: ABdhPJygSlEpGfYIODM6AAcGtxNLcZ1X5a2YfsVSiuNr/u6qm+cdiZexK56Wk++E/vmwlJm975sl0rcKDkXuh6ny4Vg=
X-Received: by 2002:aca:f40e:: with SMTP id s14mr2385939oih.92.1592766363735;
 Sun, 21 Jun 2020 12:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200606131300.3874987-1-dmitry.baryshkov@linaro.org> <20200621072655.GH128451@builder.lan>
In-Reply-To: <20200621072655.GH128451@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 21 Jun 2020 22:05:52 +0300
Message-ID: <CAA8EJprHke0=OhpP2WwPtJ-ttzOvx63j5BjHhZL0N1JO6uJZEQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: add I2C and SPI nodes
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

Hello,

On Sun, 21 Jun 2020 at 10:29, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sat 06 Jun 06:13 PDT 2020, Dmitry Baryshkov wrote:
>
> > Much like SDM845 each serial engine has 4 pins attached. Add all
> > possible I2C and SPI nodes for all 20 serial engines.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> This looks good, can you please give me a r-b or a-b on the patch adding
> the TLMM node so that I can merge the two.

I don't have it in my mbox, sorry. But anyway for TLMM patch:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
