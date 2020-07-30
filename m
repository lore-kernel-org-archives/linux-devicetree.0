Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900F2C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BD2F208A9
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 13:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQZw+1lZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgG3Nqf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 09:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbgG3Nqe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 09:46:34 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455BAC061574
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:46:34 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id v6so13002298iow.11
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m3GxVmp28rAT+I62GoqjxPs5c3SaDbTvU5JFSanMnkc=;
        b=WQZw+1lZtq/DSy4+mFHyf3N6oIF2/p0tPdD431JQE9qLVseQcJFZ1tSYjRwU4soDU2
         Eg4XKLAXik7VZJI7Ai1J41xtzyiBj6i2oBDtCiaUstLUSGY7EzBD/mh2vKJk3Dzemrhm
         l7AbmNhyBi6YVlvTexPATJsM0o9I29Y5fTfgTx1Qyo3WyClkoF5EeHhUVSnetsvz1tRj
         d1P0a+3CsQzEW5Vak2DnuW1J7gtWICm4kH393a+N5TMhJQBzEIwpREco9V/g7gvHm6Qo
         zHkqGLuNVimjGQaXpnH/NQVzntvtfmqmcpP9bmDrrYCaeBxJ5U7boOlNmfMh1UVgyfIZ
         ugtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m3GxVmp28rAT+I62GoqjxPs5c3SaDbTvU5JFSanMnkc=;
        b=cINVamnKDF9XI4bd7x/Nmg4nQ77A7w0nHM09a4cldyIELHHakAi2aM52eQ/s4H/NdC
         4OC8edkc0KcHT4z7a5waKVunNzvI9HXqWmjJDkLxzeQl5mcC/4OUff/a/lzVIIfILGFa
         hFLtMaFwv79fOWfzuK8Jg8q2+LDMxyJm1H6jGGUbmy1hxvTfkBMO90tVoFK+emTH7MPm
         Ch5qhotDgsN37cvmAQRdygxhzXOD52cVU1bdK9cz27Oyk1+N3HDBEwvtm6JTdJ/++eds
         ggj/pd2KHQQCOXQI7/t8U+2Zf3ot41TaiBLXIm41EmHzCOqocuqYop7Oh34xQqk9wHIf
         6RfA==
X-Gm-Message-State: AOAM532r5wprbqQUspzsIYjAPCwUHNb8SkUJV3LkvtHkVhi330O+xlhI
        AlqercmoF/oatxOk+uKDxB3fOMsB+ym+lSsGxSM=
X-Google-Smtp-Source: ABdhPJw9nW5ayZBZvQ50736jt6FO3M6IPfdhzLBQC9Nt543tU3ea+chhsdEFGWLmGj18G+zlfmoGKHgsbJBoSvOEm3k=
X-Received: by 2002:a02:838e:: with SMTP id z14mr3641360jag.84.1596116793647;
 Thu, 30 Jul 2020 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200730100209.793-1-linux.amoon@gmail.com> <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
 <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 30 Jul 2020 19:16:23 +0530
Message-ID: <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
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

Hi Jerome

On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
> >> Some time Ethernet interface come up but no DHCP request
> >> is forwaded to the Router, this happens quite offern on
> >> my side. Adding Reset controller to ethernet node FIx the
> >> inilization issue.
> >>
> >
> > I'm seeing this on other device as well. Strange that it pops up only
> > now. Change tested on S905x, seems to help.
>
> Strike that one - still seeing random DHCP issue on boot with this
> applied
>
> >
> >> -Anand
> >>
> >> Anand Moon (3):
> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
> >
> > None of the patches apply, please rebase on kevin's dt64 branch.
> >
> > With that, you can add
> >
> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>
So I have to drop the Tested-by  ?

> So still worth rebasing and applying on I suppose but I don't think it
> solves the problem as described in this cover letter.
>

I have a mac address mapped to the ip address on my router,
So I am just testing with the latest u-boot-2000.07 on my boards.
Usually the ethernet comes up with no packet getting forwarded,
Even ping to the device is not working, which is what I observed at
my end many times.

I will try to rebase on top of Kevin's v5.9/dt64 if needed.
Please let me know.

-Anand
