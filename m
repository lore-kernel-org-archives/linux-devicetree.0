Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C1BC433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93C5C20663
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Os6izMQO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgGMTVf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgGMTVe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 15:21:34 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75889C08C5DB
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 12:21:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e18so6456610pgn.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 12:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lnlvSS8yRTjaa31L4bdqfl6S2JOUPE+8vLPyFLQzIA0=;
        b=Os6izMQO5HU2C9KMSKfCwZQxDgXOjXhkpAFRF2xk9FvopUV1KIpH3xyunGonqiRihD
         YJDPvYc1aFxRAMGvPN5QPXG3IG86/9ascA8OlOT68leWXeVDnTfdbbBA6ZZiG68UdNac
         QNzEtglbjw/alG4spZBMMxLRrFL8lgUlvHV7ERnck8TjIQSqwfXUmLIRjp+0zI/kFq0r
         UdWsXlpULiynQmoeYVzMUgp+Srg/ZqSXqXh3QOkrUbnARBtNAO5mJLFLk4UVJU3o5SBC
         dFfI3065HWFu8sUAD4e3lYGsD2YzmGKDNkatjLTAXI5tOTuyjRIAsnNZNpPOp4fgrK3S
         gu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lnlvSS8yRTjaa31L4bdqfl6S2JOUPE+8vLPyFLQzIA0=;
        b=WnseR4HNKZXMEblB5jr9nNEq7kg88D29VbZS2yx/cviwslM+FkKrNA2/MBpJXK4zrj
         MoKDCMGiKCW/8TLb1wQQmyYtiVKvFwDeabWyT1TZKRGsabXVLISsx7D7qPuzpot0wC4p
         uweGkUvvVY5pYwOMSvLhu2g537CXcIDBG2lxMvTKQxy0rHijP3UcSraLQ1wCv+JQJmC/
         mQoPif0vqeSnNLibbxtjLQArLPrdhoNRvsSRQ3pmhqHFO5BwuF0tR593bjfXGBlXGxB3
         Cen+ywOrz8FFexFXMdQaemKQ3tSjdMZWK+JlwfosbjlbtXbjbOxB4hMYN3b8OuBiG8Hr
         5nAQ==
X-Gm-Message-State: AOAM530WnRYxI6KD2XA+NXVsBLp7UOMpyvvtmA3kggFyRf+SWGjJx4Nl
        IJZirC7rxzhvskMHvRHmymoG+A==
X-Google-Smtp-Source: ABdhPJwGB1uxYOzm+iqLQAWuBTRahO/IW3KpbEcEwDkgmZiU7vjTTS+yyUzAEByjIHvJZETQz2iCaQ==
X-Received: by 2002:a63:564e:: with SMTP id g14mr550912pgm.326.1594668093886;
        Mon, 13 Jul 2020 12:21:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z10sm15863750pfr.90.2020.07.13.12.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 12:21:33 -0700 (PDT)
Date:   Mon, 13 Jul 2020 12:19:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alexey Minnekhanov <alexey.min@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/7] mailbox: qcom: Add sdm660 hmss compatible
Message-ID: <20200713191925.GD388985@builder.lan>
References: <20200622192558.152828-1-konradybcio@gmail.com>
 <20200622192558.152828-8-konradybcio@gmail.com>
 <20200623072535.GX128451@builder.lan>
 <CANi4RBQY8dXU=74JfB3hHZYMqMgVwtHoQsLZXV7CpwZ8ue2icw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANi4RBQY8dXU=74JfB3hHZYMqMgVwtHoQsLZXV7CpwZ8ue2icw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 26 Jun 08:48 PDT 2020, Alexey Minnekhanov wrote:

> Tue, 23 Jun. 2020. 10:29, Bjorn Andersson <bjorn.andersson@linaro.org>:
> >
> > On Mon 22 Jun 12:25 PDT 2020, Konrad Dybcio wrote:
> >
> > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> 
> Hi, I can see dts file in linux-next using compatible
> "qcom,sdm660-apcs-hmss-global",
> but not this patch that adds it into the driver?

I take the dts patches through the Qualcomm tree, but the driver patch
should go through the mailbox tree.

Regards,
Bjorn
