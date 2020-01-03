Return-Path: <SRS0=7PY0=2Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE715C2D0C2
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 10:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80174206DB
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Jan 2020 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578048714;
	bh=xgCqWC9gMvYtoY+vNfhgrpAK9WwuqpgEvs1GflowvdE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=klSrlGiWFzcW1NnHuZYhxLfzHCqCUd0S+oXAlEM2FsFTbkkRkUejUKy9MtKvykgRS
	 cIuF77mNzY4HYBHHRNS63HX+yxA11Wa3pBo0Lko8DHfO1B6LTHc1I0IzpzTq/3ripn
	 e8r37g57NKCDavAXg0eu4LXQkqk92m1+bskw43x0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgACKvy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 05:51:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:36406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727220AbgACKvx (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 3 Jan 2020 05:51:53 -0500
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16A1E222C3
        for <devicetree@vger.kernel.org>; Fri,  3 Jan 2020 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578048712;
        bh=xgCqWC9gMvYtoY+vNfhgrpAK9WwuqpgEvs1GflowvdE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zrDCCB+ukMN6zESqhRipK1VWve6wiprPFMaZMROg7bxZgibByIKzw/fROISff30WB
         Es9WRWSB5LHfectabqcjtDJ46vsIzVEEt/cmRYrplXtZHb+sJRZQuCJ9qzWfms8Fcu
         jlKtrGeUDFouS0JMkCUVzMmCkRqWyyrlnKx4GizI=
Received: by mail-wr1-f50.google.com with SMTP id g17so42004317wro.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 02:51:52 -0800 (PST)
X-Gm-Message-State: APjAAAVDxHoyEj/a3FAcGWugJcM1iUfPEaeDrFu/3gGJKvLIdeuK2JX9
        oQkKOsjV5QI05D0DurWcsEtoZ+LyHI7smR40cvM=
X-Google-Smtp-Source: APXvYqxr9XPHqQfkTDnCjdV5SYfOp0JHGElgFTkLIVUUHmsexTwkpsAxHVcuWUJ2D7X9tCsBgct67+zsdoterXKR1nY=
X-Received: by 2002:adf:cf12:: with SMTP id o18mr88985838wrj.361.1578048710506;
 Fri, 03 Jan 2020 02:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20191219084332.944123-1-maxime@cerno.tech> <CAGb2v643z-GwEgOV_OS96ESihDgGNOwp2s7eyJr68QFyPNqd_Q@mail.gmail.com>
 <20191220080310.w2xtgzxend5bmv2q@gilmour.lan> <CAGb2v65+zpc1_0K2Co4uOUrfshzmVCf1Rc6Ob2YtmdmdsNTAvQ@mail.gmail.com>
 <20200102120222.yl7vlposk4b7hbu7@gilmour.lan> <CAGb2v66pixivryxffXWceLknFLErRJH3BQgtQUQSeyQq-FO=ng@mail.gmail.com>
 <20200102152641.kgckxlcq7u7xjjrl@gilmour.lan>
In-Reply-To: <20200102152641.kgckxlcq7u7xjjrl@gilmour.lan>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Fri, 3 Jan 2020 18:51:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65NBnua8V1r8OD6V67NtyHmnq0TUTTutJ+7MthrWDYjLQ@mail.gmail.com>
Message-ID: <CAGb2v65NBnua8V1r8OD6V67NtyHmnq0TUTTutJ+7MthrWDYjLQ@mail.gmail.com>
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

On Thu, Jan 2, 2020 at 11:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jan 02, 2020 at 08:31:40PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Jan 2, 2020 at 8:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Dec 20, 2019 at 04:10:03PM +0800, Chen-Yu Tsai wrote:
> > > > On Fri, Dec 20, 2019 at 4:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Thu, Dec 19, 2019 at 11:24:52PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, Dec 19, 2019 at 4:43 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > > >
> > > > > > > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > > > > > > with a matching Device Tree binding.
> > > > > > >
> > > > > > > Now that we have the DT validation in place, let's convert the device tree
> > > > > > > bindings for that controller over to a YAML schemas.
> > > > > > >
> > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > ---
> > > > > > >  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
> > > > > > >  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
> > > > > > >  2 files changed, 135 insertions(+), 37 deletions(-)
> > > > > > >  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > > >  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..ded7d6f0a119
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > > > @@ -0,0 +1,135 @@
> > > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Allwinner A80 USB PHY Device Tree Bindings
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Chen-Yu Tsai <wens@csie.org>
> > > > > > > +  - Maxime Ripard <mripard@kernel.org>
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  "#phy-cells":
> > > > > > > +    const: 0
> > > > > > > +
> > > > > > > +  compatible:
> > > > > > > +    const: allwinner,sun9i-a80-usb-phy
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  clocks:
> > > > > > > +    anyOf:
> > > > > > > +      - description: Main PHY Clock
> > > > > > > +
> > > > > > > +      - items:
> > > > > > > +          - description: Main PHY clock
> > > > > > > +          - description: HSIC 12MHz clock
> > > > > > > +          - description: HSIC 480MHz clock
> > > > > > > +
> > > > > > > +  clock-names:
> > > > > > > +    oneOf:
> > > > > > > +      - const: phy
> > > > > > > +
> > > > > > > +      - items:
> > > > > > > +          - const: phy
> > > > > > > +          - const: hsic_12M
> > > > > > > +          - const: hsic_480M
> > > > > > > +
> > > > > > > +  resets:
> > > > > > > +    anyOf:
> > > > > > > +      - description: Normal USB PHY reset
> > > > > > > +
> > > > > > > +      - items:
> > > > > > > +          - description: Normal USB PHY reset
> > > > > > > +          - description: HSIC Reset
> > > > > > > +
> > > > > > > +  reset-names:
> > > > > > > +    oneOf:
> > > > > > > +      - const: phy
> > > > > > > +
> > > > > > > +      - items:
> > > > > > > +          - const: phy
> > > > > > > +          - const: hsic
> > > > > > > +
> > > > > > > +  phy_type:
> > > > > > > +    const: hsic
> > > > > > > +    description:
> > > > > > > +      When absent, the PHY type will be assumed to be normal USB.
> > > > > > > +
> > > > > > > +  phy-supply:
> > > > > > > +    description:
> > > > > > > +      Regulator that powers VBUS
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - "#phy-cells"
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +  - clocks
> > > > > > > +  - clock-names
> > > > > > > +  - resets
> > > > > > > +  - reset-names
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +if:
> > > > > > > +  properties:
> > > > > > > +    phy_type:
> > > > > > > +      const: hsic
> > > > > > > +
> > > > > > > +  required:
> > > > > > > +    - phy_type
> > > > > > > +
> > > > > > > +then:
> > > > > > > +  properties:
> > > > > > > +    clocks:
> > > > > > > +      maxItems: 3
> > > > > > > +
> > > > > > > +    clock-names:
> > > > > > > +      maxItems: 3
> > > > > > > +
> > > > > > > +    resets:
> > > > > > > +      maxItems: 2
> > > > > > > +
> > > > > > > +    reset-names:
> > > > > > > +      maxItems: 2
> > > > > >
> > > > > > So this is slightly incorrect. If phy_type == "hsic", then the
> > > > > > "phy" clock and reset should not be needed. I say should because
> > > > > > no boards actually came with HSIC implemented. The A80 Optimus
> > > > > > board had the HSIC lines on one of the GPIO headers, but I never
> > > > > > had any HSIC chips lol.
> > > > >
> > > > > This isn't what the previous binding was saying though :/
> > > >
> > > > From the original binding:
> > > >
> > > > - clock-names : depending on the "phy_type" property,
> > > >   * "phy" for normal USB
> > > >   * "hsic_480M", "hsic_12M" for HSIC
> > > > - resets : a list of phandle + reset specifier pairs
> > > > - reset-names : depending on the "phy_type" property,
> > > >   * "phy" for normal USB
> > > >   * "hsic" for HSIC
> > > >
> > > > It is recommended to list all clocks and resets available.
> > > > The driver will only use those matching the phy_type.
> > >
> > > I'm not quite sure how we want to fix this then, or even what there's
> > > to fix.
> > >
> > > The previous binding is saying that we need either phy or hsic, and
> > > that we should ideally set both. The DT are following that
> > > recommendation, and we have either one item for the clocks (phy), or
> > > three (phy + 2 HSIC clocks). resets is in a similar situation.
> > >
> > > The binding allows to have either one or three, and enforce that in
> > > HSIC we have three (but leaves the option open to have either 1 or 3
> > > in the normal phy type).
> > >
> > > As far as I can see, we cover what the binding was saying. Am I
> > > missing something?
> >
> > I guess you're right. Lets just keep why you've done already.
> > Sorry for the noise.
>
> Is that a Reviewed-by ? :)

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

:)
