Return-Path: <SRS0=22nm=2E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EB1C43603
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 20:26:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C357020866
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 20:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="f9OaxV0I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g6Cy0vsu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLNU0i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Dec 2019 15:26:38 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:58241 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726484AbfLNU0i (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 14 Dec 2019 15:26:38 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D5B0F745A;
        Sat, 14 Dec 2019 15:26:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 14 Dec 2019 15:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=uYrjfCFJ67br7yYo29FhuPKtRd+
        gIA/bx7G6B+Ofjp4=; b=f9OaxV0Icy30Ifz2/JxrtxjwtveQoxY+bcX9ie/SuVF
        E58q+V+BhdyRx6p6c6ip+SOADFzmAKwQgwVdmPYBkVEB3Lv0Klifa3DBkF6oZJQk
        K0mcOwb4nDclrMy5NN4TFsCK6JODHnfjnt1S4Wfrk1IVEaJtYJ9CelCe6zy1vqaM
        xnxhDCawexok3+RP8mW6R0tBS0n16CGfc0elBiAiuejdrVnVNfGvgTSnHnx/uIXD
        5K2ObHDTExezzfJQdQt2YalL8tNle/6CseOOqkUW5LtcmOVGh3d4Mx0fiPq+gNVS
        IrF87NlTFSd2JQiHNWh/EGjlkEBRRF02+SmGqyx4SFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uYrjfC
        FJ67br7yYo29FhuPKtRd+gIA/bx7G6B+Ofjp4=; b=g6Cy0vsuV4H90r8xTgutLp
        sWLNrdvuI0lI5YZGiAR8GWj3oYPWY6NxsMcp1H/YipsrYGEMY+/Uk9Rj5TYzYHGt
        N6oZ402oak3ACVXX/DNAZpn+8wK7ywMWt1nMSoP080BJna+DhRVRcEfdLw8rjqC8
        aWxclFkneHC5ii3H7gL8Po1SJRTVpyC/3a5IoN4hX92LHfDQqkBK1bDBp3/S1rvT
        SQbx8EqfZcRv68+Sas7XgpZj65yqclFeP9+2Lwax8QN45+xWqU+iIfa2ql+Lls2X
        iKKdrJI09BHkeHLgcwgVrysYwuv7qB+chOWxA1RCEpeTKQtsz15ScVCFO+6gOgbg
        ==
X-ME-Sender: <xms:eUX1XdGiBiwhqwUU2LvyBTu8nk9CW_NIDt_pvLI7LudtqAiuDjU5Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtuddgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
    hinhepuggvvhhitggvthhrvggvrdhorhhgpdhkvghrnhgvlhdrohhrghenucfkphepledt
    rdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvg
    hrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:eUX1Xdd7MZMcWgaFOqhkDZuRwOq4p4byEFQe5Kvm_6VWLpBo-gfvvQ>
    <xmx:eUX1XegoYhKghAxY0gN4fkbX9aX4RAML5XWWb-iWx8hR6B6Xzy-qJw>
    <xmx:eUX1XSXJ_eByEM7aQVcVWgKUoqVNgXwwdatH5ibq8W9Tsy7O4aR5Ow>
    <xmx:e0X1XSMm_TpdPbDjNJITz9madkBE9em3EsI84XkGwDggOhYb1cdLng>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 82B7280060;
        Sat, 14 Dec 2019 15:26:33 -0500 (EST)
Date:   Sat, 14 Dec 2019 21:26:31 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        devicetree@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        agross@kernel.org
Subject: Re: [PATCH v6 05/15] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
Message-ID: <20191214202631.2h7jzfafkdqew2js@gilmour.lan>
References: <20191211230813.5144-1-mike.leach@linaro.org>
 <20191213114008.uyghh3rdbnaumcft@gilmour.lan>
 <CAJ9a7VjhbAxmJPc1TT2EfzEC6EPinf7Kq8qbv1ZQ-_S0qmfXow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2xzkujznywlgfnbw"
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjhbAxmJPc1TT2EfzEC6EPinf7Kq8qbv1ZQ-_S0qmfXow@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--2xzkujznywlgfnbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2019 at 03:04:35PM +0000, Mike Leach wrote:
> > > +    type: object
> > > +    description:
> > > +      A trigger connections child node which describes the trigger signals
> > > +      between this CTI and another hardware device. This device may be a CPU,
> > > +      CoreSight device, any other hardware device or simple external IO lines.
> > > +      The connection may have both input and output triggers, or only one or the
> > > +      other.
> > > +
> > > +    properties:
> > > +
> > > +      arm,trig-in-sigs:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        minItems: 1
> > > +        maxItems: 32
> > > +        description:
> > > +          List of CTI trigger in signal numbers in use by a trig-conns node.
> > > +
> > > +      arm,trig-in-types:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        minItems: 1
> > > +        maxItems: 32
> > > +        description:
> > > +          List of constants representing the types for the CTI trigger in
> > > +          signals. Types in this array match to the corresponding signal in the
> > > +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> > > +          completely, then the types will default to GEN_IO.
> > > +
> > > +      arm,trig-out-sigs:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        minItems: 1
> > > +        maxItems: 32
> > > +        description:
> > > +          List of CTI trigger out signal numbers in use by a trig-conns node.
> > > +
> > > +      arm,trig-out-types:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        minItems: 1
> > > +        maxItems: 32
> > > +        description:
> > > +          List of constants representing the types for the CTI trigger out
> > > +          signals. Types in this array match to the corresponding signal
> > > +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> > > +          or omitted completely, then the types will default to GEN_IO.
> > > +
> > > +      arm,trig-filters:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +        minItems: 1
> > > +        maxItems: 32
> > > +        description:
> > > +          List of CTI trigger out signals that will be blocked from becoming
> > > +          active, unless filtering is disabled on the driver.
> > > +
> > > +      arm,trig-conn-name:
> > > +        allOf:
> > > +          - $ref: /schemas/types.yaml#/definitions/string
> > > +        description:
> > > +          Defines a connection name that will be displayed, if the cpu or
> > > +          arm,cs-dev-assoc properties are not being used in this connection.
> > > +          Principle use for CTI that are connected to non-CoreSight devices, or
> > > +          external IO.
> > > +
> > > +    anyOf:
> > > +      - required:
> > > +        - arm,trig-in-sigs
> > > +      - required:
> > > +        - arm,trig-out-sigs
> > > +    oneOf:
> > > +      - required:
> > > +        - arm,trig-conn-name
> > > +      - required:
> > > +        - cpu
> > > +      - required:
> > > +        - arm,cs-dev-assoc
> >
> > This would mean that either arm,trig-conn-name, cpu xor
> > arm,cs-dev-assoc is required in the trig_conn child nodes, but they
> > don't seem to be defined at this level but in the parent node?
> >
>
> cpu and rm,cs-dev-assoc can appear in the parent node if the
> arm,coresight-cti-v8-arch compatible string is used - hence declared
> at that level. See the examples for the v8 compatible layout.
>
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +examples:
> > > +  # minimum CTI definition. DEVID register used to set number of triggers.
> > > +  - |
> > > +    cti@20020000 {
> > > +      compatible = "arm,coresight-cti", "arm,primecell";
> > > +      reg = <0x20020000 0x1000>;
> > > +
> > > +      clocks = <&soc_smc50mhz>;
> > > +      clock-names = "apb_pclk";
> > > +    };
> > > +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> > > +  #  driver according to the v8 architecture specification.
> > > +  - |
> > > +    cti@859000 {
> > > +      compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> > > +                   "arm,primecell";
> > > +      reg = <0x859000 0x1000>;
> > > +
> > > +      clocks = <&soc_smc50mhz>;
> > > +      clock-names = "apb_pclk";
> > > +
> > > +      cpu = <&CPU1>;
> > > +      arm,cs-dev-assoc = <&etm1>;
> >
> > and it looks like arm,cs-dev-assoc and cpu can be combined?
> >
> Absolutely - a CTI can and is connected to both the CPU and an
> optional ETM attached to the CPU in a v8 architecture system.

That's not what

> > > +    oneOf:
> > > +      - required:
> > > +        - arm,trig-conn-name
> > > +      - required:
> > > +        - cpu
> > > +      - required:
> > > +        - arm,cs-dev-assoc

Is saying though. oneOf is a xor, you can have one of the three
schemas that are valid, but not more than that.

> > > +    };
> > > +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> > > +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> > > +  - |
> > > +    #include <dt-bindings/arm/coresight-cti-dt.h>
> > > +
> > > +    cti@858000 {
> > > +      compatible = "arm,coresight-cti", "arm,primecell";
> > > +      reg = <0x858000 0x1000>;
> > > +
> > > +      clocks = <&soc_smc50mhz>;
> > > +      clock-names = "apb_pclk";
> > > +
> > > +      arm,cti-ctm-id = <1>;
> > > +
> > > +      trig-conns@0 {
> >
> > So, what I think happened here is that your patternProperties doesn't
> > match anything (underscore vs dash), and since you don't have
> > additionalProperties set to false, it doesn't warn that there's
> > properties that aren't defined in the binding. Meaning that none of
> > the child nodes in the bindings are effectively validated.
> >
>
> OK - fixing the name should fix this.
> I can't use additionalProperties as this is prohibited for bindings
> that use ref: (according to the example-schema.yaml)

Ah right, I missed that one, sorry. In this case, you can use the
keyword unevaluatedProperties instead. As its name suggests, it will
report an error if there's a property that hasn't been validated by
any schemas.

Note that this is a keyword introduced by the latest schemas spec
(draft 2019-09) which isn't supported by the DT tools yet. But putting
it into your schema will at least allow to have that check when the
tools will support it.

> > > +            arm,trig-in-sigs = <4 5 6 7>;
> > > +            arm,trig-in-types = <ETM_EXTOUT
> > > +                                 ETM_EXTOUT
> > > +                                 ETM_EXTOUT
> > > +                                 ETM_EXTOUT>;
> > > +            arm,trig-out-sigs = <4 5 6 7>;
> > > +            arm,trig-out-types = <ETM_EXTIN
> > > +                                  ETM_EXTIN
> > > +                                  ETM_EXTIN
> > > +                                  ETM_EXTIN>;
> > > +            arm,cs-dev-assoc = <&etm0>;
> > > +      };
> >
> > Nodes with unit-address must have a matching reg property. This will
> > generate a dtc warning too.
>
> That's interesting - I don't get any dtc warnings when compiling or
> when running make dt_binding_checl

Linux disables a lot of DTC warnings. You can see all (I think?) the
warnings by passing W=1 in the environment when you compile the device
trees.

> Is this rule documented anywhere? I cannot see it in the 0.2 spec
> version from devicetree.org or any of the examples / docs in the
> kernel tree.

The commit adding it to DTC is this one
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=852e9ecbe1976927057402f8a8f71ee8e8a49098

It just seems that while valid, it's against best practices.

Maxime

--2xzkujznywlgfnbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfVFdwAKCRDj7w1vZxhR
xRB4AP9z5XyGYrkRbgecfkN5II98D7T66E/XOSp85WCgcm87kgD+NycQp43j6Oo5
q3A/ZVKwUcVqrWgFY0p+hrKBBITf+gY=
=OgdY
-----END PGP SIGNATURE-----

--2xzkujznywlgfnbw--
