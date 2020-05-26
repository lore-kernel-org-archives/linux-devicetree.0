Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9288C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 15:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDBF820721
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590508216;
	bh=n9OM2fFSf16C1I2b0d7pMlEO5gt8rUveka5ZBWsVLKg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=F7Q6uVVIVY63HAsc5j8N+31QTf3mAqEms9amUkiVaAw/C1FIOYfyqMxBSq5LIO9W5
	 SikI9YIdGDlt/3xZctAf7jwuIkrZpHGk2fHKrk8klbj4Pm7I2O9ZYosxqzrK9q1Bh8
	 cSHPqT9PjveK5mHiae8mgCZXCoMUMXz0DC/+/uRk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbgEZPuQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 11:50:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:41456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgEZPuQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 May 2020 11:50:16 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A6F220707
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590508215;
        bh=n9OM2fFSf16C1I2b0d7pMlEO5gt8rUveka5ZBWsVLKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2FhOafBucGNwl+pSFTBvtxIsVpQx+bpBff0YXT6n7Rma5X8IYNpOt4W+CU4mSBkxu
         d5GbrmX6AxLQmawQNKLMXk5i/0SDlcuRQdetZ6LkCFfQMjL6HwWViVAyv9N1X/hoiV
         aw9eXn+xu0fwItal3fevZR9MAfvkNh12Lz2LfpGk=
Received: by mail-ot1-f41.google.com with SMTP id 63so16676418oto.8
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 08:50:15 -0700 (PDT)
X-Gm-Message-State: AOAM531EI8SLcyPh8Vr2n77yMaE/SKau2Yd2wxVTT6JeL5euqodc4a2D
        4n1VTdm2iXalRFpK+XfbnUYsso0KxWYtarBnbw==
X-Google-Smtp-Source: ABdhPJwAp7On1Gynih3RH+9t/TRqpx2YKtctrng2hJWHE/pPchcJNoyQ8L1Q44zI4Uqfdk/rQ3mZnFPxBrfD02PzMms=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr1361062ots.192.1590508214285;
 Tue, 26 May 2020 08:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-2-andre.przywara@arm.com> <CAMuHMdXkHF3ioOVzDZQARiO2i1z8rVjdN_Q0VggaVD4Ln7J+Dw@mail.gmail.com>
 <6e2cc3e9-b14f-2b50-0390-addcc82389e0@arm.com>
In-Reply-To: <6e2cc3e9-b14f-2b50-0390-addcc82389e0@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 26 May 2020 09:49:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJpe_EMC4cqXVtxY9XVrVfqDNU3=-1_47wmirFLtA1Lcg@mail.gmail.com>
Message-ID: <CAL_JsqJpe_EMC4cqXVtxY9XVrVfqDNU3=-1_47wmirFLtA1Lcg@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] dt-bindings: arm: gic: Allow combining
 arm,gic-400 compatible strings
To:     =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 19, 2020 at 3:20 AM Andr=C3=A9 Przywara <andre.przywara@arm.com=
> wrote:
>
> On 19/05/2020 08:39, Geert Uytterhoeven wrote:
>
> Hi Geert,
>
>
> > On Wed, May 13, 2020 at 12:31 PM Andre Przywara <andre.przywara@arm.com=
> wrote:
> >> The arm,gic-400 compatible is probably the best matching string for th=
e
> >> GIC in most modern SoCs, but was only introduced later into the kernel=
.
> >> For historic reasons and to keep compatibility, some SoC DTs were thus
> >> using a combination of this name and one of the older strings, which
> >> currently the binding denies.
> >>
> >> Add a stanza to the DT binding to allow "arm,gic-400", followed by
> >> either "arm,cortex-a15-gic" or "arm,cortex-a7-gic". This fixes binding
> >> compliance for quite some SoC .dtsi files in the kernel tree.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >
> > Thanks for your patch, I was just looking into this issue ;-)
> >
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.y=
aml
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.y=
aml
> >> @@ -39,6 +39,12 @@ properties:
> >>                - qcom,msm-8660-qgic
> >>                - qcom,msm-qgic2
> >>
> >> +      - items:
> >> +          - const: arm,gic-400
> >> +          - enum:
> >> +             - arm,cortex-a15-gic
> >> +             - arm,cortex-a7-gic
> >> +
> >>        - items:
> >>            - const: arm,arm1176jzf-devchip-gic
> >>            - const: arm,arm11mp-gic
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm/boot/dts/r9a06g032.dtsi#n177
> > has them in the other order.
> >
> > What do you think is the preferred solution: reverting the order, or dr=
opping
> > one or the other?
>
> Reverting the order would be the right thing. Theoretically this might
> change what the drivers match against, but there should be no difference
> between those strings anyway. And certainly Linux does not care which of
> the many strings it sees.
>
> The proper order is not really obvious here, but the cortex-a{15,7}-gic
> names serve as the missing "arm,gic-v2" generic fallback string here, I
> think just for historical reasons.

Really, they probably should have been mutually exclusive given an
implementation has one or the other. Since we have both, the order in
the schema is correct given gic-400 is a superset (multi-cluster) and
the compatible came later in time.

Rob
