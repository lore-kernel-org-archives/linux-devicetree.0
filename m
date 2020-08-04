Return-Path: <SRS0=zwrU=BO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A848C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 20:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E86B2086A
	for <linux-devicetree@archiver.kernel.org>; Tue,  4 Aug 2020 20:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cofNJGqX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgHDU5d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 16:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbgHDU5b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 16:57:31 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D4BC06174A
        for <devicetree@vger.kernel.org>; Tue,  4 Aug 2020 13:57:31 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id x24so7530044otp.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2020 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ew7RpwihRSTCnUgcvw5AbxI8h8NUrdZdMwtakCPnHo4=;
        b=cofNJGqXeQw6v7cqYxAvPmopvbKtLPmZ6VgOWXWb60MAG6K91VLZyZm0cCEo9zt4/R
         fi2ILKX8HJazErPrDyZIbZHctMxS05+6Z2EA/Tr/9qTp0ogeG6yNIWGyMeVv8SE0GPXk
         uzOkZagf7L7ojHM03l5xFit7wCASfbhupERrwm1VIxC1UCBDp56ON1GC7IutwPb/CStM
         XIGPOdE3A+kjxPilnUOVcwqe9qTWsmYHUKODOPwvOgU6eW4BAb2/kHu7mRc9K/8LOLr7
         vi5++r7Bj3eQ4kcF5xoSLz8UnRhjz9vs/Tg1+r79wAGIeFg+CmpgLSOEyGiPx6Upa57j
         MsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ew7RpwihRSTCnUgcvw5AbxI8h8NUrdZdMwtakCPnHo4=;
        b=mcDlhbGedUvjimHHl/2zUY03In87nKIrXuoMV9vk2876io6m/IkSoISBwFoNtX/0B7
         GKqwMGJmXRbEqk7QZ1KYn9RHyWyYgI2dN7SFPioIwbOBu2AV6sJxk3Ng/UBDItuY3KS+
         eZqw6uQYHE+faoPCrX2A+KwHH9gAh/7XYAkC+sNvEZr0R39ncnF+vH8Jvh74FDkhWIAe
         Yk/zK2r2jpvl0j6growh7f1R2zHA55PCqvo7a6kDg2DHLfKczpwArTmgKhXuT7tom4qI
         kWVrVSs8cXwGPnpl/fh3PyKL1Qq29FjzRkLqzyOUSMxsUK8F5xJMAtPChZYItDfj01JO
         qfvQ==
X-Gm-Message-State: AOAM530ii+jwJpxKV9/60t5ijt3UyGwbdPcqmA5OavBaWp/wJy4bh7lb
        kWjCVmMRdnB60yJC1T1vtjo39qTfeffsdvtrrSvK0g==
X-Google-Smtp-Source: ABdhPJwssL95/NKq1hq6qV7chgO3lIiK0ksJVekE+5Kda/WgnbkduHUSAtXrjtJlbKaHlL6MbnqZ39u0lGVEDDu55Fk=
X-Received: by 2002:a05:6830:237b:: with SMTP id r27mr18375403oth.352.1596574650640;
 Tue, 04 Aug 2020 13:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com> <20200511110611.3142-5-ricardo.canuelo@collabora.com>
In-Reply-To: <20200511110611.3142-5-ricardo.canuelo@collabora.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Aug 2020 13:57:18 -0700
Message-ID: <CALAqxLWCCH8sDD+3-Qe=+siUAQgB2jn3349w+VTAj6uySKc8NA@mail.gmail.com>
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

On Mon, May 11, 2020 at 4:07 AM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
> hi3660-hikey960.dts:
>   Define a 'ports' node for 'adv7533: adv7533@39' and the
>   'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
>   binding.
>
>   This fills the requirements to meet the binding requirements,
>   remote endpoints are not defined.
>
> hi6220-hikey.dts:
>   Change property name s/pd-gpio/pd-gpios, gpio properties should be
>   plural. This is just a cosmetic change.
>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>

As a heads up.
So this change sounds sane, but I just bisected it down as the cause
of a regression on HiKey960 where the adv7511 driver doesn't probe.

I'll dig a bit more on what is going on (the DRM driver is still out
of tree, so maybe the DTS bits for that are not quite right?), but if
you have any suggestions, I'll give those a try.

If anyone is curious, my latest patches for the board is here:
https://git.linaro.org/people/john.stultz/android-dev.git/log/?h=3Ddev/hike=
y960-mainline-WIP&id=3D4e6cefcc9bc1c13a503fdcb3768b3fd6479d8655

thanks
-john
