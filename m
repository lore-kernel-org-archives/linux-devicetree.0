Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01048C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 17:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D13D820767
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 17:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="oh/vaVMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGIRan (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgGIRan (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jul 2020 13:30:43 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC7CC08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 10:30:43 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id g37so2240965otb.9
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3m60qlJpb4zSVwjX3KfuFM5A8w6HuVKnF0CMOiaKyO0=;
        b=oh/vaVMffz6NBpk57JhA0bccxQ+CgY2N8B2O4IVgQU4KbWtY9xo9fUav21zjzPGRFu
         XzNKfFHDPNOfIkq/8qYU7rpnUPPTFWELncvRei93tj7/zkq1Y7dFa7rEUaMclB0JOBqV
         OUtatGCohXqF1J7LdbhoOA84aqKaifMwZaw74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3m60qlJpb4zSVwjX3KfuFM5A8w6HuVKnF0CMOiaKyO0=;
        b=oIRwgRhErGoxv9mr7jz/WodadvHhXD/FxcW26HaM0BeblWvyKQ8eWYeQlDJ5q+Spmf
         c+3Cj+OY/TVtKt1UIGczgBlbe+fpVkgMyOxEu/yEc4LfIHdQW59WjMf36nycM0dJcnS3
         WeULGwMHnPrxaA2pJdV4x+oreB2mteOG8Hhj9bdn6nxjgMHwlht9mgnXjlcDxNEseGel
         Xhpl2RQbqFBX3KiNGuL45lk/q7OVOAFsRw5tAl3ulJCyqdhBM45XjyXQKTnOTmPUZbpI
         WkG41KTn+CAgTIO5i3z+rKz9x9EQuFoYqMyI+xpkKMlnFxw1sRrt3/YQUkyle1ZyDFvG
         2YdA==
X-Gm-Message-State: AOAM531QQ8x60kocMg6DIvTpAE9t93YUQIbMPzkwNmdHmreb93pVD4yb
        Elef9o2xVY9VIQw9dfXZTON2AZMg0CehCG304GmOlA==
X-Google-Smtp-Source: ABdhPJw7G6FF2diX1q8cHlRwPzJnbtDmb9sO/T7kW+epnUE2deow+2VW1fqrGUJP7FP/wVSXruBBnpkZ0T81v6/XMvw=
X-Received: by 2002:a9d:674a:: with SMTP id w10mr49598426otm.305.1594315842379;
 Thu, 09 Jul 2020 10:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200709144527.23528-1-uwe@kleine-koenig.org>
In-Reply-To: <20200709144527.23528-1-uwe@kleine-koenig.org>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Thu, 9 Jul 2020 18:30:31 +0100
Message-ID: <CAM9ZRVt8V9mPwAtQ3pvPqGc-Zuxs-SkcoSNk49JipwvERByGdw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: default to #pwm-cells = <3> in the SoC
 dtsi files
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 9 Jul 2020 at 15:45, Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> =
wrote:
>
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> The imx-pwm driver supports 3 cells and this is the more flexible setting=
.
> So use it by default and overwrite it back to two for the files that
> reference the PWMs with just 2 cells to minimize changes.
>
> This allows to drop explicit setting to 3 cells for the boards that alrea=
dy
> depend on this.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> this picks up an old mail thread where Paul Barker started to work on
> this in March. He got some feedback but didn't come up with a new
> approach.
>
> Compared to his patch (Message-Id:
> 20200309145558.16098-1-pbarker@konsulko.com) I overwrite back to
> #pwm-cells =3D <2> in the board .dts files to minimize changes there.
>
> Best regards
> Uwe

Thanks for picking this up Uwe, I must admit it fell off my todo list
due to the coronavirus situation.

Is there a reason why imx23.dtsi, imx28.dtsi and imx51.dtsi have not
been changed?

--=20
Paul Barker
Konsulko Group
