Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A260C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 23:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5C4220738
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598396789;
	bh=BHBom7uvQSruolWt1yr7oEcBpf4ZoT7u4+Gfmz9pZC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xeqA2QKtJpJZ6h3F/Ojnr8QM8fRULmPBCHzkpwmSU6emBPOxl1GgyPFuLFyYYqUjq
	 7yV2GNWsYrLctIVEfL9dX1R9nZGCabfDTwg+xjZOwuJrM+aqdSqsz/Je5PhoWvw7Wa
	 ZuXNmjLhTu/pDQDpQEsGcd+H6pM+uwdoCcXJ9Cuk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgHYXG2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 19:06:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:56560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbgHYXG1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 25 Aug 2020 19:06:27 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D08AF2076C
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598396786;
        bh=BHBom7uvQSruolWt1yr7oEcBpf4ZoT7u4+Gfmz9pZC0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rl31BktPtqc3PWxHB+IIBGgJqmnrWxrjOoHNAgNuUeiVLRDXQqRTBXoaJbZX7cPUb
         1p49hnza/6bXCuxRHh9IfepucG9u6UKqs42WcsiCwGYC47fhyGAGUUl3D99UqYr07j
         9f6Qyw6DRpQLqqvxL5Xl7KAUv3b9Rcns+jUWYlZA=
Received: by mail-oi1-f181.google.com with SMTP id n128so309599oif.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 16:06:26 -0700 (PDT)
X-Gm-Message-State: AOAM533vpEaXlq+/Lzdj0lr2AsRZjLnCMMTE2xGvr7mMrlXm1eZG8j+r
        uYO/51r4cfNuvkzTJN6+DJiwsAs0c20IAVi7Yg==
X-Google-Smtp-Source: ABdhPJx6ZzfXVbElsfjZylrjU/5tyZhCP29bjYFSeWpzKqBiEa5vShND8XRZ6vtTEADkiWj3LiEbQDEFJBqnwj2QCUw=
X-Received: by 2002:aca:e1d6:: with SMTP id y205mr2436807oig.152.1598396786162;
 Tue, 25 Aug 2020 16:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200819031723.1398378-1-nico@fluxnic.net> <20200819031723.1398378-2-nico@fluxnic.net>
 <20200825212932.GA1360264@bogus> <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 25 Aug 2020 17:06:15 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
Message-ID: <CAL_JsqKJByNNwgP34_=G3bdVaZiM1OCUY94N1pTRzgNvqHjcWw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 25, 2020 at 4:02 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Tue, 25 Aug 2020, Rob Herring wrote:
>
> > On Tue, Aug 18, 2020 at 11:17:22PM -0400, Nicolas Pitre wrote:
> > > From: Nicolas Pitre <npitre@baylibre.com>
> > >
> > > The MIPI I3C HCI (Host Controller Interface) specification defines
> > > a common software driver interface to support compliant MIPI I3C
> > > host controller hardware implementations from multiple vendors.
> > >
> > > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > > ---
> > >  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 41 +++++++++++++++++++
> > >  1 file changed, 41 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > > new file mode 100644
> > > index 0000000000..8fc18ea922
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > > @@ -0,0 +1,41 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: MIPI I3C HCI Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Nicolas Pitre <npitre@baylibre.com>
> > > +
> > > +description: |
> > > +  MIPI I3C Host Controller Interface
> > > +
> > > +  The MIPI I3C HCI (Host Controller Interface) specification defines
> > > +  a common software driver interface to support compliant MIPI I3C
> > > +  host controller hardware implementations from multiple vendors.
> > > +
> > > +  For details, please see:
> > > +  https://www.mipi.org/specifications/i3c-hci
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mipi-i3c-hci
> >
> > What about my comments on v1? Pasted again:
>
> Oops, sorry, I missed them.
>
> > A register interface (or protocol) spec is never complete enough to
> > capture all the details about a specific h/w implementation. One just
> > has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
> > Let's not start with pretending that here. Fine for this to be a
> > fallback, but it must have a compatible for a specific implementation.
>
> You might have to indulge me a bit as I don't
> understand what you're asking.
>
> Currently there are very few implementations. One of them lives in an
> FPGA and the example below is actually the DT entry I use for it. I'm
> guessing specific vendor implementations will have their own tweaks
> eventually, such as clock sources and whatnot.

Yes, exactly. And bugs too.

> But that is outside of
> the spec (actually the spec defines a register area for eventual vendor
> specific usage). But I have no visibility into that and of course the
> code has no provision for that yet either.
>
> So I imagine there will be something like this in dts files eventually:
>
>         compatibvle = "intel,foobar_soc_i3c_hci", "mipi-i3c-hci";
>
> Is that what you mean?

Yes. Even your FPGA is tied to some implementation...

> > Also, which version of the spec does this compatible correspond to?
>
> All of them.
>
> > Or are there not HCI differences in the spec versions you mention in
> > the cover letter?
>
> The hardware is self advertising per the spec. So there is no need to
> carry such distinction in the DT compatible. Even vendor extensions are
> tagged with MIPI vendor IDs in the hardware directly.

Oh good, folks are learning. :)

Is the vendor ID (and revision) discoverable even if no vendor
extensions? If so, then I'm more comfortable with "mipi-i3c-hci" on
it's own. The exception will be if there's setup needed to discover
the h/w which seems likely. In that case, we should probably do
compatible strings based on VID/PID like PCI, USB, etc. No need to
define that now I guess, but please add some sort of summary of the
above about the discoverability of the HCI implementer and features.

Rob
