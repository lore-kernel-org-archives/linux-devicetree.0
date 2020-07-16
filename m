Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F916C433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 12:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB5CC2074B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 12:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="tfdHs4lV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbgGPMdD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 08:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbgGPMdC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 08:33:02 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B764C061755
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 05:33:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r12so6794559wrj.13
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zGcH9bVraCGk1IyMWJVQQmzfwhx9ePyMUGS1rXIGzc=;
        b=tfdHs4lV3K1enQd/i8s/Y6ZQJcIQR2GjSzPEft7fLp2riOkywEsf/h2zgU+UhXyK6G
         AxAt6X3dUnVl9vizC0D6H8AfMhrF8y5naSh6oNGfDOmbMows6v3dIja6f2KqCs/i2k8K
         dasNhnny1vRKtRS32czBtK4UeDHp6VwUlRMj4OUrHXlHhcZHRVfmpuAJhHufyHuVftrQ
         5rnIUkocevRCeyi6vVw/RUWul/oDf3sZqBrr6jYtAJ52EIWeZCLfd9xHS3hUz6TCmYpy
         +UXs28JOLgCXCzGUtKXuDtxyV2xr0jQ8P4hlqUAOTlKb3xbTNvFZ4JumeLGPD0T3lS+a
         P2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zGcH9bVraCGk1IyMWJVQQmzfwhx9ePyMUGS1rXIGzc=;
        b=QMGk/cVmjfsUo/6WWa4Qqh49855zk9xKt6iJ+F4/Ev1US+PfzlIOBq4FQLF2ROhx6M
         BWH4kx4od999c6RF3UUKh0voRpKXtstE7ZxOu19jFPS/cbdlYZm4gmSVO9fDlZ8hxHq5
         sLKOo0Q/uWqtCHLT0emCBSVQ0X19boEKxBX/mPovxKEl0/hayehsUsQHWTOt+bneHJ/l
         GGp2LmYJqbH6fN2WfDqs9srEjv/DyTzQDZvS7Pz8dCeW1skilPfQAAnVH7FJhzl/6IwZ
         1NI04olBDvbGlXIdWiAiYw2PB1/O2lL/lok7G1dxaN3QbIMcjpq+LwOoxJuLtq3GAiuy
         csKA==
X-Gm-Message-State: AOAM533ROulA3x88X/HhDpiKT1vZP+sX4PDbMXh55WRz4IRxmQF8LOBu
        R4xLRqtA3Yfe+o5X/HJ8Curmd2KZzrq5Lr4DZyxMJQ==
X-Google-Smtp-Source: ABdhPJy6xsdDfH9Ylj/v2yPo1O5OESyNaGSH3ZonHoy9hE4hybzrFM03O2b9Vk7PY574UGsXfxlhXxaQ5iMa+uG7cHE=
X-Received: by 2002:adf:fcca:: with SMTP id f10mr4795342wrs.325.1594902780957;
 Thu, 16 Jul 2020 05:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200715071506.10994-1-anup.patel@wdc.com> <20200715071506.10994-5-anup.patel@wdc.com>
 <20200715175052.GA497000@bogus>
In-Reply-To: <20200715175052.GA497000@bogus>
From:   Anup Patel <anup@brainfault.org>
Date:   Thu, 16 Jul 2020 18:02:49 +0530
Message-ID: <CAAhSdy04h-PD-=VhjB=5MOf=-RZMrMOcvEtbtUaDc3-kbV47BA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: timer: Add CLINT bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Anup Patel <anup.patel@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Atish Patra <atish.patra@wdc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 15, 2020 at 11:20 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 15 Jul 2020 12:45:05 +0530, Anup Patel wrote:
> > We add DT bindings documentation for CLINT device.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > ---
> >  .../bindings/timer/sifive,clint.yaml          | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> >
>
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/timer/sifive,clint.example.dts:21.39-40 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/timer/sifive,clint.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> Makefile:1347: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
>
> See https://patchwork.ozlabs.org/patch/1329276
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
>
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
>
> Please check and re-submit.
>

Thanks for these steps. I will fix and send v4.

Regards,
Anup
