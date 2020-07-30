Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59F9C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 18:04:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3C6C2083B
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 18:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3DMeRPa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730204AbgG3SE2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 14:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbgG3SE1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 14:04:27 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B441AC061574
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 11:04:27 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id v6so13898541iow.11
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbohfH5DAY5a2wdU4IfWtw507ZRto9ZCyhmtrDJmfJE=;
        b=n3DMeRPadb4b0N87W5rCGjnywt3TF0JMKaw/3Uu2sBNI5sszD0HOJkArFiaJ1ctosG
         FyKkz4n0UwcxOx0YTCaYzD+3U16kMNHZwuLUwfSqE5dT4zY+kGPgh/gJqs6XxgakZRkA
         DVHECIdI+4N6cTgiobAua7m1ZRIb9nieZaJc75JgsORlY3U5p9hDgwha3HjX5uObdK/n
         wFaYHXPIsnnNlYOAJvyqTJzEtvzZ87LJMpG8h31luh1POMq51Nb9zYQ9AVFrGXV2YLCn
         evaOWzFHiZ3CeqbYvxI/C59+i51rLEEi5kYDATfz/1MCl5cmB0FUPry2GAO+QJhYcilt
         yPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbohfH5DAY5a2wdU4IfWtw507ZRto9ZCyhmtrDJmfJE=;
        b=oeWypH9rhruOosLiheBhmx+LWDLV3RVnJA7IQG3PWHAfJFbYDqsXh4tFvkyS0w4J/O
         PcJZFqUVhzq9uCey/B9jRzs+J3G4p2adXnMi1Uf8CaCifiVEYrDW22tU7EAA8nU5plyH
         CpeLh5R5Z63ebBAsuq67JzsKXS93jCtAOkQBCdDpLY1Zr3VSWfNNS+l8diPUBky79REQ
         TT5dnsUlX2oqFQhJycn5ja1VWeNTIw7YFjHdXC2v6znE6/eiZUAMe1XXGmm/azcSIAIn
         WXU9RIoraV50Pws6DmRx/Ij3MrQjMTaP4MRyLGx+V6nmEYogH9qpwVHfdXGbE2/bsCYb
         IGqA==
X-Gm-Message-State: AOAM5325lRFu46blC+kcPFFbUktm9mVMKqRWAE2pgMEhlIZ7q+MlsFWF
        x/0+o0bnLqvcoYhbQ8eYQ6l6Py2SpEo4Ln0/L20=
X-Google-Smtp-Source: ABdhPJwsrkVnTBNxc8+t6sYXnoo5mMO98kYe8TKS3cUmsvSpycNi3Qe/yhX2rj/mEJ9GoR77q+81OjUnJOhdLibazIg=
X-Received: by 2002:a05:6602:811:: with SMTP id z17mr17686604iow.110.1596132267120;
 Thu, 30 Jul 2020 11:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200730100209.793-1-linux.amoon@gmail.com> <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
 <1jd04d8air.fsf@starbuckisacylon.baylibre.com> <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
 <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 30 Jul 2020 23:34:16 +0530
Message-ID: <CANAwSgR2awx2SnwvVrkjnzBDaSU4rP4as2663+hD+wUddkHSqg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Jerome,

On Thu, 30 Jul 2020 at 19:25, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 30 Jul 2020 at 15:46, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Hi Jerome
> >
> > On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >>
> >> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
> >> >
> >> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
> >> >> Some time Ethernet interface come up but no DHCP request
> >> >> is forwaded to the Router, this happens quite offern on
> >> >> my side. Adding Reset controller to ethernet node FIx the
> >> >> inilization issue.
> >> >>
> >> >
> >> > I'm seeing this on other device as well. Strange that it pops up only
> >> > now. Change tested on S905x, seems to help.
> >>
> >> Strike that one - still seeing random DHCP issue on boot with this
> >> applied
> >>
> >> >
> >> >> -Anand
> >> >>
> >> >> Anand Moon (3):
> >> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
> >> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
> >> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
> >> >
> >> > None of the patches apply, please rebase on kevin's dt64 branch.
> >> >
> >> > With that, you can add
> >> >
> >> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> >>
> > So I have to drop the Tested-by  ?
>
> Yes
>
> >
> >> So still worth rebasing and applying on I suppose but I don't think it
> >> solves the problem as described in this cover letter.
> >>
> >
> > I have a mac address mapped to the ip address on my router,
> > So I am just testing with the latest u-boot-2000.07 on my boards.
> > Usually the ethernet comes up with no packet getting forwarded,
> > Even ping to the device is not working, which is what I observed at
> > my end many times.
>
> This is not the use case descibed in the cover letter. Please clarify if
> you resubmit.
>

This was some observation at my end. If these changes don't fix the issue.
I will drop my observation and just send the missing reset controller
for ethernet

-Anand
