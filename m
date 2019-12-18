Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07F6C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 07:18:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F92B206B7
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 07:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPeL3sQb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfLRHSW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 02:18:22 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:33404 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfLRHSV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 02:18:21 -0500
Received: by mail-il1-f196.google.com with SMTP id v15so853133iln.0
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 23:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCwa00IyQIOLZ6z5iyawbZaNF4jJ6Iczm0eXb9CjqUU=;
        b=PPeL3sQbNZHoirsJWfwatpisDOVGToI3CoGqFNY4/oya1AjdAGO+LOBjokNQcUMBI6
         S4XoTesMvsOSgqYl6Tsq/qcsAwmvwhHMkhekPtamed+iNGRY32cvFqChMHshvoE5Zgsf
         Q0qRp3RkmC1XoD1frrkmA6XzjCn6+gSGy8yYsZ+dHjpvGfJ9d1fp1D1BDqlFvvpijKI+
         akUP5gyNU3VRzuB2I/fHGacriS+MgeJCye0F3gsIxvdvbi7hNDdvjIok4Wzbfusehlmg
         tG6+jDPipxM5cBIfVuJ84lBDyx8G1wx3HVRf2RnWC6fpdMf+mywdxlecOnHFjM5YySx8
         43Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCwa00IyQIOLZ6z5iyawbZaNF4jJ6Iczm0eXb9CjqUU=;
        b=Ks8UCvzDkEeLYJB2j0NysFN5hiEXZKwBWmNcSy+DTPLaJ9XgnXXhyj0NoOVg2soCtN
         WAp68kzOhNdq+JUSAy/NvazbUyk8des4IqnDI2Dp6tjBKJYHqC7cysXLEWO1Jk8cZxRs
         ESFv37spSqJb3Mbbs9r1oE0jqrmRldlj56e7m7loD589y8aK3cRIVTv6kwaFNhcKKK/5
         VhIO3Y+A4zDIWbJVoY8ew5M6f5sCTL6KDv/0Ar8+pLlyfFqyh07inkXzmRIUCHRAkIpd
         un1RFFNTpkBE1+iwhIOh/Lgn6i8MXTIxSb1T12p5bvj0C0IPwmx10/oly17qb6bqqdIK
         +IGA==
X-Gm-Message-State: APjAAAXNpbQlLKeQdcCGRvdlZIPxptHK36Kj7Bk0gdvMMnoXdUj84Qnh
        Xrzgvwk4j9rwsGQEniLqenMGn6fBtCvEtssCCkI=
X-Google-Smtp-Source: APXvYqz/6Gyoo0ZOsaHyTvMhPiJSUUCi7Es/5C4io0hOtE9kuWjmgJL7u5Gd4+rPxvw7QmHa2YK50fQKJsU8rRKXQeg=
X-Received: by 2002:a92:4e:: with SMTP id 75mr555618ila.276.1576653500781;
 Tue, 17 Dec 2019 23:18:20 -0800 (PST)
MIME-Version: 1.0
References: <1574816731.13250.9.camel@hbabu-laptop>
In-Reply-To: <1574816731.13250.9.camel@hbabu-laptop>
From:   "Oliver O'Halloran" <oohall@gmail.com>
Date:   Wed, 18 Dec 2019 18:18:09 +1100
Message-ID: <CAOSf1CEvZ32xC71siuyfUQEcQ4yLoDtj2jGoc3jrmsHc0jD+Vw@mail.gmail.com>
Subject: Re: [PATCH 04/14] powerpc/vas: Setup IRQ mapping and register port
 for each window
To:     Haren Myneni <haren@linux.vnet.ibm.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Device Tree <devicetree@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Neuling <mikey@neuling.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
        hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 12:07 PM Haren Myneni <haren@linux.vnet.ibm.com> wrote:
>
> *snip*
>
> @@ -36,7 +62,18 @@ static int init_vas_instance(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> -       if (pdev->num_resources != 4) {
> +       rc = of_property_read_u64(dn, "ibm,vas-port", &port);
> +       if (rc) {
> +               pr_err("No ibm,vas-port property for %s?\n", pdev->name);
> +               /* No interrupts property */
> +               nresources = 4;
> +       }
> +
> +       /*
> +        * interrupts property is available with 'ibm,vas-port' property.
> +        * 4 Resources and 1 IRQ if interrupts property is available.
> +        */
> +       if (pdev->num_resources != nresources) {
>                 pr_err("Unexpected DT configuration for [%s, %d]\n",
>                                 pdev->name, vasid);
>                 return -ENODEV;

Right, so adding the IRQ in firmware will break the VAS driver in
existing kernels since it changes the resource count. This is IMO a
bug in the VAS driver that you should fix, but it does mean we need to
think twice about having firmware assign an interrupt at boot.

I had a closer look at this series and I'm not convinced that any
firmware changes are actually required either. We already have OPAL
calls for allocating an hwirq for the kernel to use and for getting
the IRQ's XIVE trigger port (see pnv_ocxl_alloc_xive_irq() for an
example). Why not use those here too? Doing so would allow us to
assign interrupts to individual windows too which might be useful for
the windows used by the kernel.
