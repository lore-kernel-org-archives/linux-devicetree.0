Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3203C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 08:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD4F924679
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576829419;
	bh=+Ue4YMhrP/TWYQlndBEEgxM06Vnt+rRsoVr9iQWxelE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=gLOKd54WclFEXMMOA3VVuce2AIRIvhkliv2IVn5MR2jcEY9aWmmevc6gUcL9+IH0Q
	 E2088nQn9d5dLfoYhGsCF6vP6Fc/5Zju4e6Su0fNLa7i6a0uKkKFMlNFJeglrpnQ3s
	 Hc8QjX0hGnd8R3uL+kzSZ1DifNSo0bGKUT8Pvnl0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfLTIKT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 03:10:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:47326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLTIKT (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 03:10:19 -0500
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7516424679
        for <devicetree@vger.kernel.org>; Fri, 20 Dec 2019 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576829417;
        bh=+Ue4YMhrP/TWYQlndBEEgxM06Vnt+rRsoVr9iQWxelE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S0oIFPQObmtIOa9rw99ptEgYXT/oj/IwIuSfBD4Nbq1CVfvNpxC7EUG0f7kL0HRkn
         SFeq/dBmmBu1c3aNPkxIAPGdUq+EyNjwanTM5M1J9nMPL24B2JZqX4hlWVnrYuCZmb
         woEBI8/f6KPjS0AS8mWBtfG6TJ7zpInKTMXfgAGg=
Received: by mail-wm1-f51.google.com with SMTP id 20so8096902wmj.4
        for <devicetree@vger.kernel.org>; Fri, 20 Dec 2019 00:10:17 -0800 (PST)
X-Gm-Message-State: APjAAAU3PdPL1WtzlFcu7/lYp0OrWCmYQ1XUk8r9H3MC7xcpwPxZxSpQ
        EREnNfmUTEt5zOkGSK2zFKW/nFPBtK9ObViVRZs=
X-Google-Smtp-Source: APXvYqxhnNTk+tBts6iL8RTAJJTNANczfG9ySH/QeJ429H9ZAEV4BLijfH7J3nM108Y2UmJVOEn06rVPMnKstFJR8BY=
X-Received: by 2002:a1c:3c45:: with SMTP id j66mr14308187wma.2.1576829415971;
 Fri, 20 Dec 2019 00:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20191219084332.944123-1-maxime@cerno.tech> <CAGb2v643z-GwEgOV_OS96ESihDgGNOwp2s7eyJr68QFyPNqd_Q@mail.gmail.com>
 <20191220080310.w2xtgzxend5bmv2q@gilmour.lan>
In-Reply-To: <20191220080310.w2xtgzxend5bmv2q@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Fri, 20 Dec 2019 16:10:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65+zpc1_0K2Co4uOUrfshzmVCf1Rc6Ob2YtmdmdsNTAvQ@mail.gmail.com>
Message-ID: <CAGb2v65+zpc1_0K2Co4uOUrfshzmVCf1Rc6Ob2YtmdmdsNTAvQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 20, 2019 at 4:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Thu, Dec 19, 2019 at 11:24:52PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Dec 19, 2019 at 4:43 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > > with a matching Device Tree binding.
> > >
> > > Now that we have the DT validation in place, let's convert the device tree
> > > bindings for that controller over to a YAML schemas.
> > >
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
> > >  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
> > >  2 files changed, 135 insertions(+), 37 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > new file mode 100644
> > > index 000000000000..ded7d6f0a119
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > @@ -0,0 +1,135 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner A80 USB PHY Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Chen-Yu Tsai <wens@csie.org>
> > > +  - Maxime Ripard <mripard@kernel.org>
> > > +
> > > +properties:
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +  compatible:
> > > +    const: allwinner,sun9i-a80-usb-phy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    anyOf:
> > > +      - description: Main PHY Clock
> > > +
> > > +      - items:
> > > +          - description: Main PHY clock
> > > +          - description: HSIC 12MHz clock
> > > +          - description: HSIC 480MHz clock
> > > +
> > > +  clock-names:
> > > +    oneOf:
> > > +      - const: phy
> > > +
> > > +      - items:
> > > +          - const: phy
> > > +          - const: hsic_12M
> > > +          - const: hsic_480M
> > > +
> > > +  resets:
> > > +    anyOf:
> > > +      - description: Normal USB PHY reset
> > > +
> > > +      - items:
> > > +          - description: Normal USB PHY reset
> > > +          - description: HSIC Reset
> > > +
> > > +  reset-names:
> > > +    oneOf:
> > > +      - const: phy
> > > +
> > > +      - items:
> > > +          - const: phy
> > > +          - const: hsic
> > > +
> > > +  phy_type:
> > > +    const: hsic
> > > +    description:
> > > +      When absent, the PHY type will be assumed to be normal USB.
> > > +
> > > +  phy-supply:
> > > +    description:
> > > +      Regulator that powers VBUS
> > > +
> > > +required:
> > > +  - "#phy-cells"
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - resets
> > > +  - reset-names
> > > +
> > > +additionalProperties: false
> > > +
> > > +if:
> > > +  properties:
> > > +    phy_type:
> > > +      const: hsic
> > > +
> > > +  required:
> > > +    - phy_type
> > > +
> > > +then:
> > > +  properties:
> > > +    clocks:
> > > +      maxItems: 3
> > > +
> > > +    clock-names:
> > > +      maxItems: 3
> > > +
> > > +    resets:
> > > +      maxItems: 2
> > > +
> > > +    reset-names:
> > > +      maxItems: 2
> >
> > So this is slightly incorrect. If phy_type == "hsic", then the
> > "phy" clock and reset should not be needed. I say should because
> > no boards actually came with HSIC implemented. The A80 Optimus
> > board had the HSIC lines on one of the GPIO headers, but I never
> > had any HSIC chips lol.
>
> This isn't what the previous binding was saying though :/

From the original binding:

- clock-names : depending on the "phy_type" property,
  * "phy" for normal USB
  * "hsic_480M", "hsic_12M" for HSIC
- resets : a list of phandle + reset specifier pairs
- reset-names : depending on the "phy_type" property,
  * "phy" for normal USB
  * "hsic" for HSIC

It is recommended to list all clocks and resets available.
The driver will only use those matching the phy_type.

> > > -- phy_type : "hsic" for HSIC usage;
> > > -            other values or absence of this property indicates normal USB
> > > -- clocks : phandle + clock specifier for the phy clocks
> > > -- clock-names : depending on the "phy_type" property,
> > > -  * "phy" for normal USB
> > > -  * "hsic_480M", "hsic_12M" for HSIC
> > > -- resets : a list of phandle + reset specifier pairs
> > > -- reset-names : depending on the "phy_type" property,
> > > -  * "phy" for normal USB
> > > -  * "hsic" for HSIC
>
> It's speficied that the reset and clock is needed. If we want to
> revise that, we can do it, but I guess it should be in a separate
> patch than the one doing the conversion. Here we just want to express
> the exact same thing.

So the original binding only recommends having all clocks.
But given that these are internal to the SoC, having them
all is easier I suppose.

ChenYu
