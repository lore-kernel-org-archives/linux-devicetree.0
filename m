Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15CAC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 22:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93E7620738
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 22:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="GIBAWUdg";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="lwlCQ74v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgHYWCK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 18:02:10 -0400
Received: from pb-smtp1.pobox.com ([64.147.108.70]:50749 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYWCI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 18:02:08 -0400
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 6E64B76635;
        Tue, 25 Aug 2020 18:02:04 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=TVO1dOIqV3CDy+jVJp1dbE9btQU=; b=GIBAWU
        dgW0NzqpvzSp6Fa8tvu1gbceO1PYW827J5S2TCafLOO8V/ua9rhYPeiubN9uCfSu
        5kZVMM89m/VOS0XGFvFjKj4spv7QwVLLrD3EV4gtsSkP4BwUhgFKWUi6zXyBhohv
        4E3VlD2+xRWYTjBpuvQ6Iu1kposqMeEKlmrUw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id 3448D76634;
        Tue, 25 Aug 2020 18:02:04 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=o2Z47pyr/CjE9m2IwY1kw2uotjadTZKlb0RW2Z2wrl4=; b=lwlCQ74vDNe8EKAr2dQGxLuH0pOa5Jh+JtjWI+6MLwhaRdPDH6iheWfuEdpewPxHfW8OPEkliuR771IEnWx6fYLck0jsFH2xGeqyt7WVMQNaOp+Jj7UuRO83UAdtwT6vSwI92euB2MX1ZRxW6YuKUwUnC5E5Bv/n/g+sefDrgCg=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 04FF076633;
        Tue, 25 Aug 2020 18:02:03 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id A5AC42DA0521;
        Tue, 25 Aug 2020 18:02:01 -0400 (EDT)
Date:   Tue, 25 Aug 2020 18:02:01 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Rob Herring <robh@kernel.org>
cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
In-Reply-To: <20200825212932.GA1360264@bogus>
Message-ID: <nycvar.YSQ.7.78.906.2008251732430.1479@knanqh.ubzr>
References: <20200819031723.1398378-1-nico@fluxnic.net> <20200819031723.1398378-2-nico@fluxnic.net> <20200825212932.GA1360264@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 9B667186-E71E-11EA-9B46-01D9BED8090B-78420484!pb-smtp1.pobox.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Aug 2020, Rob Herring wrote:

> On Tue, Aug 18, 2020 at 11:17:22PM -0400, Nicolas Pitre wrote:
> > From: Nicolas Pitre <npitre@baylibre.com>
> > 
> > The MIPI I3C HCI (Host Controller Interface) specification defines
> > a common software driver interface to support compliant MIPI I3C
> > host controller hardware implementations from multiple vendors.
> > 
> > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > ---
> >  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > new file mode 100644
> > index 0000000000..8fc18ea922
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> > @@ -0,0 +1,41 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: MIPI I3C HCI Device Tree Bindings
> > +
> > +maintainers:
> > +  - Nicolas Pitre <npitre@baylibre.com>
> > +
> > +description: |
> > +  MIPI I3C Host Controller Interface
> > +
> > +  The MIPI I3C HCI (Host Controller Interface) specification defines
> > +  a common software driver interface to support compliant MIPI I3C
> > +  host controller hardware implementations from multiple vendors.
> > +
> > +  For details, please see:
> > +  https://www.mipi.org/specifications/i3c-hci
> > +
> > +properties:
> > +  compatible:
> > +    const: mipi-i3c-hci
> 
> What about my comments on v1? Pasted again:

Oops, sorry, I missed them.

> A register interface (or protocol) spec is never complete enough to
> capture all the details about a specific h/w implementation. One just
> has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
> Let's not start with pretending that here. Fine for this to be a
> fallback, but it must have a compatible for a specific implementation.

You might have to indulge me a bit as I don't 
understand what you're asking.

Currently there are very few implementations. One of them lives in an 
FPGA and the example below is actually the DT entry I use for it. I'm 
guessing specific vendor implementations will have their own tweaks 
eventually, such as clock sources and whatnot. But that is outside of 
the spec (actually the spec defines a register area for eventual vendor 
specific usage). But I have no visibility into that and of course the 
code has no provision for that yet either.

So I imagine there will be something like this in dts files eventually:

	compatibvle = "intel,foobar_soc_i3c_hci", "mipi-i3c-hci";

Is that what you mean?

> Also, which version of the spec does this compatible correspond to?

All of them.

> Or are there not HCI differences in the spec versions you mention in 
> the cover letter?

The hardware is self advertising per the spec. So there is no need to 
carry such distinction in the DT compatible. Even vendor extensions are 
tagged with MIPI vendor IDs in the hardware directly.

> > +  reg:
> > +    maxItems: 1
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +examples:
> > +  - |
> > +    mipi_i3c_hci@a0000000 {
> 
> i3c@a0000000

OK.


Nicolas
