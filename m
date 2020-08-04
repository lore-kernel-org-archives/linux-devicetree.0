Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D86C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 21:24:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1BB220842
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 21:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LthmW3Lz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgHDVY1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 17:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgHDVY0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 17:24:26 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E967C06174A
        for <devicetree@vger.kernel.org>; Tue,  4 Aug 2020 14:24:26 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id t7so17876447otp.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2020 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k9/tscxhQqLXMKufpxll8+O44Aoxn3IbN6hHzmHjeyk=;
        b=LthmW3LzzjhnSTSJ/Gk3/qE3qMtkbshJVZQ8VvPoQUD14fRb8+6ZREaa16vBXOv1B/
         iCz3iW+Ld6mgmeMw0916UckRv6jqN1O3aiBgPtqwXE14SpVgCbHxPPjndJ5a0qf9ZuBO
         0DMgY2VCRRgo1VuhaAsG3Pq2eLgLRLyQmtbm1paF9aVKd5GPRUp+JagTiJ0ixRjJYWtH
         vH9TTHge8Lz6YzaqokOI9017/ZYGVovnurHehoFn81WWkRgDL898MDEvu/hvL7nKxE4P
         ijvjQkL0+o3F4MiCZyH/zbsTqkGpi/VEbJP7wQBQwImsUtMHCzmwfIv6IIvz+tstdU3G
         0GdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k9/tscxhQqLXMKufpxll8+O44Aoxn3IbN6hHzmHjeyk=;
        b=fi8/vadUNJJY4jzlr/HkD0kCVvyQOnoI0WKRbpcJeaWbL+gt/ikVWE0r+TVMf6y4Ux
         QGw3PJH4j77TaPG07qayzKQdKGMEsN7JPy+UJyqfZhsYycZCn6HrUSr+J4NasiLtBVgQ
         AIw85aoo25rWNX4ihHCSaSM9LgaumlL9cBYF15iaV8LeuUzB9IGSQpxJdHlL6LkSk1Wa
         xKaE4bz6oLij072vp41Ky1Hqycy5ChR7uGBlfTt/Vz3412aWYN05H3RyLl/sMkvypj4C
         LQxj+EM0ZIMHLrMoiV5h9SUOGMGbYaneg9ncoog+Oo1J4Bsq9dOlTGD9xwir1C+++f7v
         q7/Q==
X-Gm-Message-State: AOAM531pmdJiWLGy3ureh9LXlDOcSwK701Z9v6o9rIp92wY+BO0lOJyU
        /fgOSXBAyCZYYMemOWSNzM1bAsYbrZ71xRbOLZfSzg==
X-Google-Smtp-Source: ABdhPJwrlWMjyO3HV4MDFR4gb4NaCjbwSiumlhalogqG2gqSuAloVI6+obWms7yfcFnZi+bTMkLl8+r5tY36mh/4U4o=
X-Received: by 2002:a05:6830:237b:: with SMTP id r27mr45696oth.352.1596576265757;
 Tue, 04 Aug 2020 14:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
 <20200511110611.3142-5-ricardo.canuelo@collabora.com> <CALAqxLWCCH8sDD+3-Qe=+siUAQgB2jn3349w+VTAj6uySKc8NA@mail.gmail.com>
In-Reply-To: <CALAqxLWCCH8sDD+3-Qe=+siUAQgB2jn3349w+VTAj6uySKc8NA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Aug 2020 14:24:13 -0700
Message-ID: <CALAqxLVgJYD_n8Y0YrkNt5TRFxWExcNqP5CW_EQiK8XghZO9Lw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: hisilicon: hikey: fixes to comply with
 adi, adv7533 DT binding
To:     =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wei Xu <xuwei5@hisilicon.com>,
        Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 4, 2020 at 1:57 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, May 11, 2020 at 4:07 AM Ricardo Ca=C3=B1uelo
> <ricardo.canuelo@collabora.com> wrote:
> >
> > hi3660-hikey960.dts:
> >   Define a 'ports' node for 'adv7533: adv7533@39' and the
> >   'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
> >   binding.
> >
> >   This fills the requirements to meet the binding requirements,
> >   remote endpoints are not defined.
> >
> > hi6220-hikey.dts:
> >   Change property name s/pd-gpio/pd-gpios, gpio properties should be
> >   plural. This is just a cosmetic change.
> >
> > Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
>
> As a heads up.
> So this change sounds sane, but I just bisected it down as the cause
> of a regression on HiKey960 where the adv7511 driver doesn't probe.
>
> I'll dig a bit more on what is going on (the DRM driver is still out
> of tree, so maybe the DTS bits for that are not quite right?), but if
> you have any suggestions, I'll give those a try.

Yes. It ends up the DRM driver dts changes were being done in the
wrong file so it was adding adv7511 bits in the dtsi, which were then
being overridden by your tweak. I'll fixup the pending DRM driver dts
bits. Apologies for the noise.

thanks
-john
