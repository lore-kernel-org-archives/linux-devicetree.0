Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC82C433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BABAA207F5
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 20:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i9sjjh5U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgG1Ur5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 16:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgG1Urz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 16:47:55 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58999C061794
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 13:47:55 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l4so21965205ejd.13
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ExajQAZpNTd+joqebqoVtMbLAI74qmTPLZGYxWwu4D0=;
        b=i9sjjh5UAFRZq+C3SoLUFHBEFZe6/rz5SKiFPjmp8dcIsULItKWNbWHaJLPdjgA3Mj
         TmKlkfab84dkU55DoSBegy1MTK+TCHgJKsRJtDKe0ppHkw9hqFaosw/z/OPlicU5HoFK
         om2qlX+kETm4XnxUxtAKkwLggUd0PsUuko2zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ExajQAZpNTd+joqebqoVtMbLAI74qmTPLZGYxWwu4D0=;
        b=TqEiy5iAeib3DGfcl1JklGIx0LMU6A+JKVIoLh6CncNML4QDX67XSU+JZJ2YBT+kGp
         Lg04VIUTn9VGa0LE+XPy3xWqKmyOF/4Bb7xZBbo3PNldbwuaxOHxYKGYY5GnTgH/e6+t
         7yzuIS7zY5dfRjQnsCOZo10awPfjhHrD4bSElBkqDfC4oAUQFLttGJeXxfJavnEEtBTA
         UNZXbJrKwUqkbUhIEB2XpvVsh8Z/izznmTwBJWpCtmdYZVP4mQvzx0LcZdPT+PlEPYMR
         oNGgeQ7akAyo5h70X2xeXZfegEXuKADCjuLziInQfqq1A5PZk0alhNVyYPAu9wtcYcJD
         0U1Q==
X-Gm-Message-State: AOAM5307k+aKMXVm7VOXOvSHM7k+16AVQTCcwnfbD5UGU466r8o7lTds
        ZvH+a7gl1/0yHA94EfJqe7WlUJL3arI=
X-Google-Smtp-Source: ABdhPJxMn74C27mtHV+/k6UqOFMW4PCGbPc2gx2AY6hBOf3Xqw+steyr50MhQC5pDVa2hyzW1O3DXw==
X-Received: by 2002:a17:906:d042:: with SMTP id bo2mr15755305ejb.152.1595969273791;
        Tue, 28 Jul 2020 13:47:53 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id z12sm48480edk.34.2020.07.28.13.47.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 13:47:52 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id k20so829415wmi.5
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 13:47:51 -0700 (PDT)
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr3518054wmh.79.1595969271235;
 Tue, 28 Jul 2020 13:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200724183954.1.I2e29ae25368ba8a72a9e44121cfbc36ead8ecc6b@changeid>
 <20200728151258.1222876-1-campello@chromium.org> <20200728091057.4.I33c50453845a8167969130d514af86e573b6ef31@changeid>
 <CAHp75VcRBCmRdGh5WVGDY28AzNhBufkoNkrEZ7uEFCW2MsJ=qg@mail.gmail.com>
In-Reply-To: <CAHp75VcRBCmRdGh5WVGDY28AzNhBufkoNkrEZ7uEFCW2MsJ=qg@mail.gmail.com>
From:   Daniel Campello <campello@chromium.org>
Date:   Tue, 28 Jul 2020 14:47:15 -0600
X-Gmail-Original-Message-ID: <CAHcu+Va0DVm1Pw__jYF_EhZHSQnSqb_zex2NN1M67zc=FTAitA@mail.gmail.com>
Message-ID: <CAHcu+Va0DVm1Pw__jYF_EhZHSQnSqb_zex2NN1M67zc=FTAitA@mail.gmail.com>
Subject: Re: [PATCH 04/15] iio: sx9310: Remove acpi and of table macros
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        kbuild test robot <lkp@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-iio <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 28, 2020 at 12:09 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Jul 28, 2020 at 6:16 PM Daniel Campello <campello@chromium.org> wrote:
> >
> > Avoids unused warnings due to acpi/of table macros.
> >
>
> At the same time I would check if mod_devicetable.h is included.
I did the following and no error showed up:
#ifndef LINUX_MOD_DEVICETABLE_H
#error Missing include
#endif

>
> > Signed-off-by: Daniel Campello <campello@chromium.org>
> > Reported-by: kbuild test robot <lkp@intel.com>
>
>
> --
> With Best Regards,
> Andy Shevchenko

Regards,
Daniel Campello
