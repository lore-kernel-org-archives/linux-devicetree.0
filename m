Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BDFC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 05:54:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 653D720776
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 05:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JT1BLyDz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEVFyU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 01:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgEVFyU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 01:54:20 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9C9C05BD43
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 22:54:20 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id f5so414071wmh.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 22:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIk25yXFBXzVd2JD01BBzYOv1Gg6yn56UGtgn996fw0=;
        b=JT1BLyDzBfEuLHxkQaZ3XLCFkoZmRsT1N912PHah3lVhoqoq8JLyx4QkKZsoPUywUl
         E8PjWS0l/TEp1xK0mrl7UoiGv0RIkC4oZIhGYEYhQwMuD2/uXOdMLL2IkSjV5JEGLgEu
         hj4YoPe4YprgbTbrKfT1Nu4aNFpoW8dgf0B3kbjxNFXc4BsbKku9MqU5Q1RXnbJtzvI5
         xk7NFC/3TEqxST4kdWTIpy40xEPajjPX9ncrzUYWfeR0bEFQS+jRN5+P16lXMnvzUr41
         awxZth5SCE6kzfOWGlFHf1t/Wjx8G4cPS2di/vbxuQSFpkN9iBmP1ZYvg94K/83Lijpl
         Y6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIk25yXFBXzVd2JD01BBzYOv1Gg6yn56UGtgn996fw0=;
        b=VA0sPBchMVfMSt4MEB0Csq/Neh0BGEZeUcziM5YoAtdmZcOwazH9KailoFKpPWf9BQ
         4I1kCZVgoafIYR9AS+ZzZ0Oh73pmhWIL8ZyXtLuOpUyxPSH+FKhOOOHeU0hk4K/F6CzQ
         11yCT/k1fz6RCme/yhikonEsE2Vwq7OXd30YblEYMbq+i42s7B+4I6uaiCo0HN/LQ7/G
         iCXPUlJ6rkOWoJE30y1ixcHzT4hKpMt/IbyKBSCYJaXk777ojfgK2bPamIXXxzdpAQE/
         LzFY2lBsmoaVHCcHiVGTLOuqRfKHeQuQHv/oqZUD3NmZxshuJe3t0X4pqRLDb46HgRlc
         jFHQ==
X-Gm-Message-State: AOAM533VfyjQbTDzLIDopuO35VBW1e1jNFvd74Gd5VzY+p/V56wi+QCI
        82SrZQ1R10OUAffleooqLJhUxqLhVX1xkknHS+XKFQ==
X-Google-Smtp-Source: ABdhPJynY0OTAvvIBrM+2Ad3FdHSwp7eR2/+LIesoKwApFshfRqfP2uvsUvf/GyYJKsRhjNqdIuaVpXMiLoV/07JSRc=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr11532873wmk.3.1590126858584;
 Thu, 21 May 2020 22:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200521134544.816918-1-anup.patel@wdc.com> <20200521134544.816918-6-anup.patel@wdc.com>
 <2aec08b7-7197-4b60-89d9-c3b0d5a8a258@gmail.com>
In-Reply-To: <2aec08b7-7197-4b60-89d9-c3b0d5a8a258@gmail.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Fri, 22 May 2020 11:24:07 +0530
Message-ID: <CAAhSdy0OuxCwMVPBrvPpYMfVrhUuY3pONysk75yognOM5-0U+g@mail.gmail.com>
Subject: Re: [PATCH 5/5] dt-bindings: timer: Add CLINT bindings
To:     Sean Anderson <seanga2@gmail.com>
Cc:     Anup Patel <anup.patel@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, May 22, 2020 at 1:35 AM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 5/21/20 9:45 AM, Anup Patel wrote:
> > We add DT bindings documentation for CLINT device.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  .../bindings/timer/sifive,clint.txt           | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
> >
> > diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > new file mode 100644
> > index 000000000000..cae2dad1223a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> > @@ -0,0 +1,33 @@
> > +SiFive Core Local Interruptor (CLINT)
> > +-------------------------------------
> > +
> > +SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
> > +Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
> > +
> > +It directly connects to the timer and inter-processor interrupt lines of
> > +various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
> > +controller is the parent interrupt controller for CLINT device.
> > +
> > +The clock frequency of CLINT is specified via "timebase-frequency" DT
> > +property of "/cpus" DT node. The "timebase-frequency" DT property is
> > +described in: Documentation/devicetree/bindings/riscv/cpus.yaml
> > +
> > +Required properties:
> > +- compatible : "sifive,clint-1.0.0" and a string identifying the actual
> > +  detailed implementation in case that specific bugs need to be worked around.
>
> Should the "riscv,clint0" compatible string be documented here? This

Yes, I forgot to add this compatible string. I will add in v2.

> peripheral is not really specific to sifive, as it is present in most
> rocket-chip cores.

I agree that CLINT is present in a lot of non-SiFive RISC-V SOCs and
FPGAs but this IP is only documented as part of SiFive FU540 SOC.
(Refer, https://static.dev.sifive.com/FU540-C000-v1.0.pdf)

The RISC-V foundation should host the CLINT spec independently
under https://github.com/riscv and make CLINT spec totally open.

For now, I have documented it just like PLIC DT bindings found at:
Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.txt

If RISC-V maintainers agree then I will document it as "RISC-V CLINT".

@Palmer ?? @Paul ??

>
> > +- reg : Should contain 1 register range (address and length).
> > +- interrupts-extended : Specifies which HARTs (or CPUs) are connected to
> > +  the CLINT.  Each node pointed to should be a riscv,cpu-intc node, which
> > +  has a riscv node as parent.
> > +
> > +Example:
> > +
> > +     clint@2000000 {
> > +             compatible = "sifive,clint-1.0.0", "sifive,fu540-c000-clint";
> > +             interrupts-extended = <
> > +                     &cpu1-intc 3 &cpu1-intc 7
> > +                     &cpu2-intc 3 &cpu2-intc 7
> > +                     &cpu3-intc 3 &cpu3-intc 7
> > +                     &cpu4-intc 3 &cpu4-intc 7>;
> > +             reg = <0x2000000 0x4000000>;
> > +     };
> >
>
> --Sean

Regards,
Anup
