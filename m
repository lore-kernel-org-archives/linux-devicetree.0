Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BED0C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:51:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 688862072A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 21:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578347495;
	bh=Mh7LcnCXw4vVCv42wMM3EP0PnAh3Q0ZFbhTxd/ljaeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=D1TFNXyYrc7VsUlpJ5R7085sHwmn+LOrFBUFuPa8yR0Hvp1qgEiv48L9J8A5LRHrJ
	 D+pEn0HNX2h57RZqfiOBvypA+qpyyIBRcwL+ErNkp/66pQPPJL6LO+USy+ReNNLrZ3
	 Uifga8FvzJYuEJ/3cSOj6CY/AubVor2C9aKhAc60=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgAFVve (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 16:51:34 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36236 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgAFVve (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 16:51:34 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so16965596oic.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 13:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q6uD0y39fhm44pZWO41miHHEfqh/x5T19yL2RZ/nwqg=;
        b=FfqwYGVO9TwZAuKH6bwaWJMEqRVGKL1Fc1InieBvQIrkk1GGopjT8Nl1Pty64iKVZB
         CCdvyDJ3R5nEzAB3VCctwg4lUT2JONFbMAB8olMuSzuULt2G/945TH2k0KVA9c4js2P+
         +b8XzLq6k/b+0jQINIguvVzOVsINSbT+FyD142QQQeDFFUFrkPTG6EPQPqaoT7IZOCMR
         7cxk7nvDDLQVy5QgkgtJAIWiyKG31gggL0AfPjjgT79iMTsVoOSXtdUCbWTbawzbw/3U
         syguxwgH0ougMjPUXJHJe2FhD0EQcarlTD3Ipng7PQnu5czutpv2bDp2bZQS1XBu/Bhs
         iWLA==
X-Gm-Message-State: APjAAAX/jDBnzZIOsPpyzthQ/B2/YjN8dtO3httWauTa46099x4QK8xu
        n0JmoFGXYrxjhZjBKNjngziFe2w=
X-Google-Smtp-Source: APXvYqyCeIzfVrkLM/9cJwo0ujccoL9MDLaDUrNALOZ7Lkbi28y3zF6LlhcDiuzlFQLPbzmeWB38QA==
X-Received: by 2002:a05:6808:b18:: with SMTP id s24mr6028764oij.31.1578347493110;
        Mon, 06 Jan 2020 13:51:33 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net. [70.5.121.225])
        by smtp.gmail.com with ESMTPSA id i3sm1031634otr.31.2020.01.06.13.51.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 13:51:32 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22043f
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 06 Jan 2020 15:51:29 -0600
Date:   Mon, 6 Jan 2020 15:51:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     kishon@ti.com, Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
Message-ID: <20200106215129.GB11672@bogus>
References: <20200103152824.47383-1-maxime@cerno.tech>
 <20200104221321.GA11672@bogus>
 <20200106092724.pi2kbui7zayrhhzi@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106092724.pi2kbui7zayrhhzi@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 06, 2020 at 10:27:24AM +0100, Maxime Ripard wrote:
> Hi Rob,
> 
> On Sat, Jan 04, 2020 at 03:13:21PM -0700, Rob Herring wrote:
> > On Fri, Jan 03, 2020 at 04:28:24PM +0100, Maxime Ripard wrote:
> > > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > > with a matching Device Tree binding.
> > >
> > > Now that we have the DT validation in place, let's convert the device tree
> > > bindings for that controller over to a YAML schemas.
> > >
> > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > ---
> > >
> > > Changes from v1:
> > >   - Added r-b tag from chen-yu
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
> >
> > Rather than anyOf, just 'minItems: 1' would work here. Though I guess
> > this disallows 2 items.
> 
> Yeah, 2 items is not allowed so I wanted to prevent that.
> 
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
> > Do you intend that only a single item is allowed when not HSIC? If so,
> > that's not what is happening.
> 
> That's intentional indeed, the former binding was making the hsic
> clocks and resets mandatory when the phy was in HSIC mode, but only
> recommending listing them otherwise. Maybe we can change that in the
> future, but that seems out of scope for a conversion.

Okay. In that case,

Reviewed-by: Rob Herring <robh@kernel.org>
