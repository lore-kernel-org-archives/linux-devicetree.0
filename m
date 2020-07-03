Return-Path: <SRS0=QVA0=AO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F98FC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 17:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEB4320870
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jul 2020 17:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwXmSjzk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgGCRFy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jul 2020 13:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgGCRFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jul 2020 13:05:54 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E45C08C5DE
        for <devicetree@vger.kernel.org>; Fri,  3 Jul 2020 10:05:53 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id di5so9597043qvb.11
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2020 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uOxIRzqV33cwYiOayyd2WFVo6gUD/TXwDz0UDM2FxKs=;
        b=KwXmSjzk/in70DsvZW/OqlJVbh7RjTtMHjUSsmmNvyH5aE7ZNj6NcWsyaamq+b+79b
         VgSghhNlE0KbRfmk9RYQYiMvyqWl1/fsjdD9sIrMxJIJ007fdJxPuKPyqvtAYdQ5lMjA
         NYCDxzvIrgOcaa0SRN+rU+dDlfqeeWRrAGsLe6tS2ojOxffdNA0NFJb9Dkd4gpfYNGpF
         S1Dmd5e//uzU3TSzYsXNe+EnbbVjC9Zy2i322fansr6nSoSKGwqOYRum47dWPnJci6lN
         +SNCJvdrTxsGybqIIbnSrud4z1YtiSwB6SlWOqx4pg5j/eFpO+uVgGDNJnA4nRCPA5xp
         sruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uOxIRzqV33cwYiOayyd2WFVo6gUD/TXwDz0UDM2FxKs=;
        b=MMG8u8NyJRbP5A8UwtIxzgFkq1dwtZ+bTLwZwscmDY4HHh0O6ZAkNaBvE22vNRK2oV
         x3Hfm2SNgFO2NUUzx2ncObCnmQ1VPbpRKvk0nqJw+lJe1rlQdqUvU7XUxU12NT3dAOtG
         40xdDo+tq10LvWpou7jo7SslW39jEfEy3od/rC3tUXevQb8rkjijsUaYI9BeGinU7+oa
         8Npb3NmVDdAKlkoq2boF696biEO4jhkuflz5UOtNkPP5cr8MXSSTG2fESle5kQqCkMzl
         /u9zYeGBDd2S26lBznZsk+d1ZBED9wlpOyLq0ApxR2JZoadrTVkm6dmknkWFcobRcEDz
         1CtQ==
X-Gm-Message-State: AOAM531kKmaz259AarlxQVyveJQdzUPEGANDy+ccgebtyJtcT2hgadsA
        wnbvd0dC3WLz7gnlsdOBOinRf5Qv0TC8ZUx5Esxjdw==
X-Google-Smtp-Source: ABdhPJwmiuz2Y+CJRbdyQtdd6dbeRQNgpQTJtM4808f8jP39qAVc6vY+XdPGcwSFBZ91+L4uKjouCHEW2eXs8kWDPCA=
X-Received: by 2002:a0c:b315:: with SMTP id s21mr35952885qve.53.1593795952915;
 Fri, 03 Jul 2020 10:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <1593699479-1445-1-git-send-email-grzegorz.jaszczyk@linaro.org>
 <1593699479-1445-6-git-send-email-grzegorz.jaszczyk@linaro.org> <d1b232c6f33a629117a2ecbd440622d0@kernel.org>
In-Reply-To: <d1b232c6f33a629117a2ecbd440622d0@kernel.org>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Fri, 3 Jul 2020 19:05:41 +0200
Message-ID: <CAMxfBF5p3kh-E-vUxo60a+QTuqQXbsSVYSTc_qYvN8ZckLPKzA@mail.gmail.com>
Subject: Re: [PATCHv3 5/6] irqchip/irq-pruss-intc: Add support for ICSSG INTC
 on K3 SoCs
To:     Marc Zyngier <maz@kernel.org>
Cc:     tglx@linutronix.de, jason@lakedaemon.net,
        "Anna, Suman" <s-anna@ti.com>, robh+dt@kernel.org,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, david@lechnology.com,
        "Mills, William" <wmills@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 2 Jul 2020 at 19:59, Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-02 15:17, Grzegorz Jaszczyk wrote:
> > From: Suman Anna <s-anna@ti.com>
> >
> > The K3 AM65x and J721E SoCs have the next generation of the PRU-ICSS
> > IP,
> > commonly called ICSSG. The PRUSS INTC present within the ICSSG supports
> > more System Events (160 vs 64), more Interrupt Channels and Host
> > Interrupts
> > (20 vs 10) compared to the previous generation PRUSS INTC instances.
> > The
> > first 2 and the last 10 of these host interrupt lines are used by the
> > PRU and other auxiliary cores and sub-modules within the ICSSG, with 8
> > host interrupts connected to MPU. The host interrupts 5, 6, 7 are also
> > connected to the other ICSSG instances within the SoC and can be
> > partitioned as per system integration through the board dts files.
> >
> > Enhance the PRUSS INTC driver to add support for this ICSSG INTC
> > instance. This support is added using specific compatible and match
> > data and updating the code to use this data instead of the current
> > hard-coded macros. The INTC config structure is updated to use the
> > higher events and channels on all SoCs, while limiting the actual
> > processing to only the relevant number of events/channels/interrupts.
> >
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > ---
> > v2->v3:
> > - Change patch order: use it directly after "irqchip/irq-pruss-intc:
> >   Implement irq_{get,set}_irqchip_state ops" and before new
> >   "irqchip/irq-pruss-intc: Add event mapping support" in order to
> > reduce
> >   diff.
>
> The diff would be even smaller if you introduced a variable number of
> inputs the first place, i.e. in patch #2. Most if this patch just
> retrofits it. Please squash these changes into that initial patch,
> and only add the platform stuff here.

Sure I will do that.

Thank you,
Grzegorz
