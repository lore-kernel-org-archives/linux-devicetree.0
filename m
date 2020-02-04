Return-Path: <SRS0=skvR=3Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43F1C3524B
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 20:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95F502166E
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Feb 2020 20:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jvi8QbyK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgBDUti (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Feb 2020 15:49:38 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:38023 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgBDUth (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Feb 2020 15:49:37 -0500
Received: by mail-vs1-f68.google.com with SMTP id r18so12399268vso.5
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=Jvi8QbyK+alPjB3i+rU2Ydb52K2Cr2ER4rlq6Ohk4VOaRNp3T+BkEDdEzkvR4yW9F0
         +3q3G2bto22tSH/jvMKXTBNdgwvUKeL72DKrAg8Lrd7M0vBvUcj6nT1GAMCxqtVlvVMD
         J97ugqLNv8AVmQrF7E6TIbQNA8POEkoe1hiak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDMn7tspiLbabREBPncdwnRL1LH/yW4VpIem+eMXcdY=;
        b=YUzp3EL4Xtqtgt4Y9dgA9eZomSkaf1X2YZFwWJnuGxtGqHAhCtodyaM2T79xRdaWV0
         t8cZQCWulaFv9kjUYrsXQPNVoPqSFoGxnPe8qNVKgPQmjQggfsMrrIbreEG3eUU6gs2+
         eKABX4CvvFw68E9WkamxOcaJtU/4rqGKHdnnELisQ+ASRLXytm+HjxgCY/Enl1bLTX9J
         8JNlf1ZJtKGNqeE2qB6tr6YrcsJVHQUhFhfLuPyMr+1P1QbSV3cuyX+u9x6F8X8Lz1vX
         ARU4V6WqZkgMBJ9repjz8/8JAR3YsYM4dGhI3m7o2Kr93xG2AVADFN6JW7qilH4dUcWw
         EsMA==
X-Gm-Message-State: APjAAAVVvQs2nQ4v9QVST3lDnoIyI9HjMoNCu8yhmFZ0y8Ez3Pj9ZO4I
        uiKoK0Ki5b5Ellmai9tdrJSPGn2vCEk=
X-Google-Smtp-Source: APXvYqztOAFrw8JP3gnK3Zahh64pVpiydg0go1H47dF2SELKrWfSZCMZUO4+VmfF4LmK7yQlRxc/2g==
X-Received: by 2002:a05:6102:757:: with SMTP id v23mr20455679vsg.35.1580849376163;
        Tue, 04 Feb 2020 12:49:36 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id p4sm6597441vsg.10.2020.02.04.12.49.34
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 12:49:34 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id i4so5601338vkc.3
        for <devicetree@vger.kernel.org>; Tue, 04 Feb 2020 12:49:34 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr18261663vkl.92.1580849373967;
 Tue, 04 Feb 2020 12:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20200203183149.73842-1-dianders@chromium.org> <20200203103049.v4.11.I27bbd90045f38cd3218c259526409d52a48efb35@changeid>
 <20200204174900.45A5420674@mail.kernel.org>
In-Reply-To: <20200204174900.45A5420674@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 12:49:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Message-ID: <CAD=FV=VaK6faWiAC1CHd081UzWCLEE42dHBq22ZyaSaUu8CXhA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] dt-bindings: clock: Cleanup qcom,videocc
 bindings for sdm845/sc7180
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 9:49 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-02-03 10:31:44)
> > This makes the qcom,videocc bindings match the recent changes to the
> > dispcc and gpucc.
> >
> > 1. Switched to using "bi_tcxo" instead of "xo".
> >
> > 2. Adds a description for the XO clock.  Not terribly important but
> >    nice if it cleanly matches its cousins.
> >
> > 3. Updates the example to use the symbolic name for the RPMH clock and
> >    also show that the real devices are currently using 2 address cells
> >    / size cells and fixes the spacing on the closing brace.
> >
> > 4. Split into 2 files.  In this case they could probably share one
> >    file, but let's be consistent.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Added Rob's review tag.
>
> I don't see it. I guess I should add it?

Whoops.  I knew I'd mess something like this up.  Looks like it got
pushed without his tag but I don't think it's a big deal.  For
reference, he added his tag in:

https://lore.kernel.org/r/CAL_Jsq+_2E-bAbP9F6VYkWRp0crEyRGa5peuwP58-PZniVny7w@mail.gmail.com

I did manage to remove the "/bindings" from the ID as he requested, so
at least I didn't mess up the important part...

-Doug


-Doug
