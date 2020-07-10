Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474EAC433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 17:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C6C32076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 17:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgGJRjm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 13:39:42 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:57788 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727866AbgGJRjm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 10 Jul 2020 13:39:42 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1jtwzo-004VL4-Ci; Fri, 10 Jul 2020 19:39:36 +0200
Date:   Fri, 10 Jul 2020 19:39:36 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Rob Herring <robh@kernel.org>
Cc:     Kurt Kanzenbach <kurt@linutronix.de>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: net: dsa: Add DSA yaml binding
Message-ID: <20200710173936.GF1037260@lunn.ch>
References: <20200710090618.28945-1-kurt@linutronix.de>
 <20200710090618.28945-2-kurt@linutronix.de>
 <20200710164500.GA2775934@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200710164500.GA2775934@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 10, 2020 at 10:45:00AM -0600, Rob Herring wrote:
> On Fri, Jul 10, 2020 at 11:06:18AM +0200, Kurt Kanzenbach wrote:
> > For future DSA drivers it makes sense to add a generic DSA yaml binding which
> > can be used then. This was created using the properties from dsa.txt. It
> > includes the ports and the dsa,member property.
> > 
> > Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> > ---
> >  .../devicetree/bindings/net/dsa/dsa.yaml      | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > new file mode 100644
> > index 000000000000..bec257231bf8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > @@ -0,0 +1,80 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/dsa/dsa.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Distributed Switch Architecture Device Tree Bindings
> 
> DSA is a Linuxism, right?

Hi Rob

Marvell'ism actually. They came up the idea for how you can
interconnect multiple switches to form a distributed switch fabric. So
far, the Marvell driver is the only driver that makes use of D in
DSA. But it seems like some other vendors have similar concepts. And
those which don't allow D in DSA can use a simplified version of the
architecture for a single switch.

> Describe what type of h/w should use this binding.
> 
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^switch(@.*)?$"
> > +
> > +  dsa,member:
> > +    minItems: 2
> > +    maxItems: 2
> > +    description:
> > +      A two element list indicates which DSA cluster, and position within the
> > +      cluster a switch takes. <0 0> is cluster 0, switch 0. <0 1> is cluster 0,
> > +      switch 1. <1 0> is cluster 1, switch 0. A switch not part of any cluster
> > +      (single device hanging off a CPU port) must not specify this property
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +  ports:
> > +    type: object
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port@[0-9]+$":
> 
> As ports and port are OF graph nodes, it would be better if we 
> standardized on a different name for these. I think we've used 
> 'ethernet-port' some.

I suspect DSA was using port before OF graph came along. Yep:

commit 5e95329b701c4edf6c4d72487ec0369fa148c0bd
Author: Florian Fainelli <florian@openwrt.org>
Date:   Fri Mar 22 10:50:50 2013 +0000

    dsa: add device tree bindings to register DSA switches

commit 4d56ed5a009b7d31ecae1dd26c047b8bb0dd9287
Author: Philipp Zabel <p.zabel@pengutronix.de>
Date:   Tue Feb 25 15:44:49 2014 +0100

    Documentation: of: Document graph bindings

So this usage is will established and it is probably a bit late to
change it now.

   Andrew
