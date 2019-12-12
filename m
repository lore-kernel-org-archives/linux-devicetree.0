Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAC9C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B93F022527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 14:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576159524;
	bh=GZ1Eh2FIyC3Xv9zvn31qIhJwS2JbDKy/POB/KwKocM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=nyX2CPxLqKblIVb0Bs3GYN6wRR87Grf5GOz7BmhxBt1fUvZccb6P8Hwu1uQZcw5sw
	 lsYBq6m6/wF2NuZ40QB1GYlfAtOruUSGDJpBfxzcpUR7dGORGrZQO1jzEDlg/liI1p
	 eAv7k8E18XVVhwgjsevweqbJv1CS4z+fr+Gx2suE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbfLLOFY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 09:05:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:58356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729529AbfLLOFX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Dec 2019 09:05:23 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7845A21655;
        Thu, 12 Dec 2019 14:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576159522;
        bh=GZ1Eh2FIyC3Xv9zvn31qIhJwS2JbDKy/POB/KwKocM4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SbItizhdieTPRpetydB1DctbwUgBb4KgPJ97nfEER+BChJ315vT/MFYWomxvKgsnZ
         QEG2dCcpBy3+CqPYLNfFFLFzAfjltCLedOotNlpU7OOKsYL0VmdRDlOinzbEtjji1z
         PbaZpU3UxafY7hUhpA7wlcEdgD0rn7ncpoYk7k1A=
Received: by mail-qk1-f177.google.com with SMTP id m188so1674401qkc.4;
        Thu, 12 Dec 2019 06:05:22 -0800 (PST)
X-Gm-Message-State: APjAAAWHdm3Q8dlUCUlwUhXFxB0A8yHZbyiM1x0eeobgkyB9SuB7Wtpm
        7ynCSZcXNqp5fJpuSgMtMWupqEyMLjuR9zyG7w==
X-Google-Smtp-Source: APXvYqz7BvM4alxzJY1A3P2/Sx4gpIe5ZtBd4ZZVQ6gieaU0sUsxeu1YzaJJrLG7BCCkrsyABfhytgnFewN/DRtmKRE=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr8248868qkg.152.1576159521649;
 Thu, 12 Dec 2019 06:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20191211163210.9778-1-robh@kernel.org> <099dcb4e-265c-7789-1b10-d8aa6f1d6922@gmail.com>
In-Reply-To: <099dcb4e-265c-7789-1b10-d8aa6f1d6922@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 12 Dec 2019 08:05:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL9d1kSxtHf-DKutnfmNK3Bsy1sFAqov1ugcgX30JJ0Rw@mail.gmail.com>
Message-ID: <CAL_JsqL9d1kSxtHf-DKutnfmNK3Bsy1sFAqov1ugcgX30JJ0Rw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: memory-controllers: tegra: Fix type references
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Dec 12, 2019 at 7:36 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 11.12.2019 19:32, Rob Herring =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Json-schema requires a $ref to be under an 'allOf' if there are
> > additional constraints otherwise the additional constraints are
> > ignored. (Note that this behavior will be changed in draft8.)
> >
> > Fixes: 641262f5e1ed ("dt-bindings: memory: Add binding for NVIDIA Tegra=
30 External Memory Controller")
> > Fixes: 785685b7a106 ("dt-bindings: memory: Add binding for NVIDIA Tegra=
30 Memory Controller")
> > Fixes: 8da65c377b21 ("dt-bindings: memory: tegra30: Convert to Tegra124=
 YAML")
> > Cc: Dmitry Osipenko <digetx@gmail.com>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > I'll take this via the DT tree for rc2.
> >
> >  .../bindings/memory-controllers/nvidia,tegra124-mc.yaml  | 3 ++-
> >  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml  | 9 ++++++---
> >  .../bindings/memory-controllers/nvidia,tegra30-mc.yaml   | 3 ++-
> >  3 files changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/n=
vidia,tegra124-mc.yaml
> > index 30d9fb193d7f..22a94b6fdbde 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
124-mc.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
124-mc.yaml
> > @@ -60,7 +60,8 @@ patternProperties:
> >              maximum: 1066000000
> >
> >            nvidia,emem-configuration:
> > -            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32-array
> >              description: |
> >                Values to be written to the EMEM register block. See sec=
tion
> >                "15.6.1 MC Registers" in the TRM.
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/n=
vidia,tegra30-emc.yaml
> > index 7fe0ca14e324..e4135bac6957 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
30-emc.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
30-emc.yaml
> > @@ -56,7 +56,8 @@ patternProperties:
> >              maximum: 900000000
> >
> >            nvidia,emc-auto-cal-interval:
> > -            $ref: /schemas/types.yaml#/definitions/uint32
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> >              description:
> >                Pad calibration interval in microseconds.
> >              minimum: 0
> > @@ -78,7 +79,8 @@ patternProperties:
> >                Mode Register 0.
> >
> >            nvidia,emc-zcal-cnt-long:
> > -            $ref: /schemas/types.yaml#/definitions/uint32
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32
> >              description:
> >                Number of EMC clocks to wait before issuing any commands=
 after
> >                sending ZCAL_MRW_CMD.
> > @@ -96,7 +98,8 @@ patternProperties:
> >                FBIO "read" FIFO periodic resetting enabled.
> >
> >            nvidia,emc-configuration:
> > -            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32-array
> >              description:
> >                EMC timing characterization data. These are the register=
s
> >                (see section "18.13.2 EMC Registers" in the TRM) whose v=
alues
> > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidi=
a,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nv=
idia,tegra30-mc.yaml
> > index 84fd57bcf0dc..4b9196c83291 100644
> > --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
30-mc.yaml
> > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra=
30-mc.yaml
> > @@ -77,7 +77,8 @@ patternProperties:
> >              maximum: 900000000
> >
> >            nvidia,emem-configuration:
> > -            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            allOf:
> > +              - $ref: /schemas/types.yaml#/definitions/uint32-array
> >              description: |
> >                Values to be written to the EMEM register block. See sec=
tion
> >                "18.13.1 MC Registers" in the TRM.
> >
>
> But the "nvidia,emem-configuration" doesn't have any extra constraints.
> Or you just added the "allOf" for consistency to avoid possible future
> copy-paste bugs?

It does have constraints. It has the 'items' list.

Note that fixing it introduces an error which I'm in the process of
fixing in the schema tool.

> Otherwise LGTM, thanks!
>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Thanks.

Rob
