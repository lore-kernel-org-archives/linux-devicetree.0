Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A71CC433E3
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07EEE2064B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 15:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="vZRZASGU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgGPPzM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 11:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgGPPzM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 11:55:12 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EEFFC08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:55:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l2so12121437wmf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Wm5nrLpCBdqeYkmR+57rLRuzRzpNbn845e+5GZLhdQ=;
        b=vZRZASGUjzHUDNUcoWRJVEw/jprfGBhvzfE347Y80rA4PUsDvEPgDpQmwf0g9FfhVG
         9ikl4jTDrkinwreLaaXqxVE9fsGf/w9fU4498vUUFEQPHBZgRe7V2u3k3lvStIkGSTym
         XvIHE5c2u3SW7L2A7GKBpYNQHvdpyBtruaMdffJa3GalO0Ij4GTdmvbItV4mkVwuXQqO
         GlP19rGLfU0OCyQNdW1aonSGxS8+DSgLACEeO3w1G9lFmWrdkqwLBrINsrFBKCgj/t4y
         xnwsAPPbvpiFYmerLBDbqm5MY2knzZq+YZaIC3hS4jdOxPWgasXzLjuYUx7YjmzEnDAi
         l4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Wm5nrLpCBdqeYkmR+57rLRuzRzpNbn845e+5GZLhdQ=;
        b=HuGL1SFn0me1YqewzL30k1j/I2D3QKvfqe8D6aHk0TPp+1m/FyPdeEDCcVjrxe3yV9
         xj6N0hTTBiG7VUzN/6QqYle67H1ULwTVunSF36k3plGspV9bcMYh5JrGbDGb7ZesTgxB
         AmLODWi9MUh+201h+jpClN+DSaGNGjvkMKKF1aXjoyG5eQDu9/y3rxd3G0ciNPPUbYZs
         Dpb7NUV3h34VqnhxYLHxkaYdZtp6kIRdQHC27y5Bw6W16ObHCvudt15lK8tUZdKnES45
         WarA57kFQx5ACYw5c+9t5GRDcQe+bgJSCNRkQtILRApKWJje+lJ+U7oBYiXWbLoLlnTL
         w87w==
X-Gm-Message-State: AOAM531r5Jt4YdRNuTK/6H7jUyFY8BV/jshQ5ll2xl2KA7agNKi1wP98
        ZjEDcBhYUjds0IILZBWAcvgvmPrWW3ListuAuYLRjg==
X-Google-Smtp-Source: ABdhPJzBrhvBt5WZDYVM9BB+5Ge01yxUo/KxdkO1suwsN8v/UCTxvNd1QhAwCk2imFJLL0ZsShqhItpxBSVnMqiMg+0=
X-Received: by 2002:a05:600c:2154:: with SMTP id v20mr5279691wml.185.1594914910499;
 Thu, 16 Jul 2020 08:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200715071506.10994-1-anup.patel@wdc.com> <20200715071506.10994-5-anup.patel@wdc.com>
 <20200715175052.GA497000@bogus> <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
 <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
In-Reply-To: <9c12dd2c-7285-5664-973e-3ec066eec0a2@linaro.org>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 16 Jul 2020 21:24:58 +0530
Message-ID: <CAAhSdy1kOvXXecGM=qyWS5cpx9nq9RpahLrVaQAUg0VKFu7pYg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Daniel,

On Thu, Jul 16, 2020 at 7:31 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
>
> Hi Anup,
>
>
> On 16/07/2020 14:32, Anup Patel wrote:
> > On Wed, Jul 15, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
>
> [ ... ]
>
> > Thanks for these steps. I will fix and send v4.
>
> Please take the opportunity to clarify how you want the series to be merged.

This is yet another series which largely impacts arch/riscv because we are
factoring CLINT code from arch/riscv into it's own timer driver.

I think this can go via the RISC-V tree.

Regards,
Anup
