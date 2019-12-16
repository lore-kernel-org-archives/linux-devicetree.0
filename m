Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003CCC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 19:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B489620717
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 19:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFr/Mv4D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfLPTKK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 14:10:10 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43126 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfLPTKJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 14:10:09 -0500
Received: by mail-qt1-f196.google.com with SMTP id b3so6625514qti.10
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uw9U7rblKVGuRst+OVJeS+hnJio304MdqULIkTyPuXA=;
        b=sFr/Mv4DBTCYaRnfl12PIOZSe3JPJLY87L9IdBCtKXouRLYpCoc67xxz5/6xwu4uI5
         XHx+efnEQIs5JBtfY4CNDP1bkQSOaC/oQPNm7RP7pGlOaPu/BxnWHB0tl2PEDF2mqgPM
         7ZWFWB9/DxusPCQm7QzPNDR13dOCEmDnUWTS1ZsZflHVfa6cBw3jF/1jQvvj0VFJJ848
         EdnF4DOhPkDSP4NVk8qmM1ldPBDhChTFcIsEg/JckUHWM3a7KlDlzisdid7V/9cfGE5J
         kUaKbKZvKpVF/IT0jyt4LN3g4UH+q/4qpw1cwKoI8MTiECYny6XojCFD/fH+oMYfTevf
         X2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uw9U7rblKVGuRst+OVJeS+hnJio304MdqULIkTyPuXA=;
        b=DROoamBECawVM2R2BOu+oEJmUoTZ4wdI1DSOWo0/2SjF0jr1BySDkt+zTJX2XjObma
         LlnsET2cUrEti6yyMaXF0wCF3vIlznW5PAIuRfBxKwRRv9NHZtoMpTO7mBZR84F6skdn
         kMyJyyhlIcm9Be+iKNKWZg4itDeHzM36Tv11c0VZQUVVm78k0/VyouTToCJ87NmvaHSS
         NHW59jVOkIS7bpWXGHHGz3J2MhiozE/Rab83+yA8m2loQ3HqdoVfXBqH6LOMl+X8g7AX
         unPTNhw8v9Lf3GEO+gMKseev9ViGUtFhjX4RfE6715snxxy5PcsrPP4g4aUAH3TYnkYZ
         rGMg==
X-Gm-Message-State: APjAAAV4HsED3s4Is8gAjqlWueRak4xyHizxQzS7O2cJD7kfBuAZbLxJ
        Jydq7VQNMKdXbAWbQ2AV0VyrjvKtTlxRucYYuw/QqQ==
X-Google-Smtp-Source: APXvYqyhwdhD8SVt5G6Rr61HxNIfhkRMf/+yf6TiwVRSl8xiJY/x5WTcD8VdvPpANl2cfQ+cjpouMbfBl+2FjNsQtHg=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr829308qtn.88.1576523408360;
 Mon, 16 Dec 2019 11:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20191211230813.5144-1-mike.leach@linaro.org> <20191213114008.uyghh3rdbnaumcft@gilmour.lan>
 <CAJ9a7VjhbAxmJPc1TT2EfzEC6EPinf7Kq8qbv1ZQ-_S0qmfXow@mail.gmail.com> <20191214202631.2h7jzfafkdqew2js@gilmour.lan>
In-Reply-To: <20191214202631.2h7jzfafkdqew2js@gilmour.lan>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Mon, 16 Dec 2019 19:09:57 +0000
Message-ID: <CAJ9a7Vh7cvHO-CO1D-xZgeRgNaFhqaJ+aYmMN94BQgeSxWbccA@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] dt-bindings: arm: Adds CoreSight CTI hardware definitions.
To:     Maxime Ripard <maxime@cerno.tech>
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
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime

On Sat, 14 Dec 2019 at 20:26, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Dec 13, 2019 at 03:04:35PM +0000, Mike Leach wrote:
> > > > +    type: object
> > > > +    description:
> > > > +      A trigger connections child node which describes the trigger signals
> > > > +      between this CTI and another hardware device. This device may be a CPU,
> > > > +      CoreSight device, any other hardware device or simple external IO lines.
> > > > +      The connection may have both input and output triggers, or only one or the
> > > > +      other.
> > > > +
> > > > +    properties:
> > > > +
> > > > +      arm,trig-in-sigs:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description:
> > > > +          List of CTI trigger in signal numbers in use by a trig-conns node.
> > > > +
> > > > +      arm,trig-in-types:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description:
> > > > +          List of constants representing the types for the CTI trigger in
> > > > +          signals. Types in this array match to the corresponding signal in the
> > > > +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> > > > +          completely, then the types will default to GEN_IO.
> > > > +
> > > > +      arm,trig-out-sigs:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description:
> > > > +          List of CTI trigger out signal numbers in use by a trig-conns node.
> > > > +
> > > > +      arm,trig-out-types:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description:
> > > > +          List of constants representing the types for the CTI trigger out
> > > > +          signals. Types in this array match to the corresponding signal
> > > > +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> > > > +          or omitted completely, then the types will default to GEN_IO.
> > > > +
> > > > +      arm,trig-filters:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > > > +        minItems: 1
> > > > +        maxItems: 32
> > > > +        description:
> > > > +          List of CTI trigger out signals that will be blocked from becoming
> > > > +          active, unless filtering is disabled on the driver.
> > > > +
> > > > +      arm,trig-conn-name:
> > > > +        allOf:
> > > > +          - $ref: /schemas/types.yaml#/definitions/string
> > > > +        description:
> > > > +          Defines a connection name that will be displayed, if the cpu or
> > > > +          arm,cs-dev-assoc properties are not being used in this connection.
> > > > +          Principle use for CTI that are connected to non-CoreSight devices, or
> > > > +          external IO.
> > > > +
> > > > +    anyOf:
> > > > +      - required:
> > > > +        - arm,trig-in-sigs
> > > > +      - required:
> > > > +        - arm,trig-out-sigs
> > > > +    oneOf:
> > > > +      - required:
> > > > +        - arm,trig-conn-name
> > > > +      - required:
> > > > +        - cpu
> > > > +      - required:
> > > > +        - arm,cs-dev-assoc
> > >
> > > This would mean that either arm,trig-conn-name, cpu xor
> > > arm,cs-dev-assoc is required in the trig_conn child nodes, but they
> > > don't seem to be defined at this level but in the parent node?
> > >
> >
> > cpu and rm,cs-dev-assoc can appear in the parent node if the
> > arm,coresight-cti-v8-arch compatible string is used - hence declared
> > at that level. See the examples for the v8 compatible layout.
> >
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +
> > > > +examples:
> > > > +  # minimum CTI definition. DEVID register used to set number of triggers.
> > > > +  - |
> > > > +    cti@20020000 {
> > > > +      compatible = "arm,coresight-cti", "arm,primecell";
> > > > +      reg = <0x20020000 0x1000>;
> > > > +
> > > > +      clocks = <&soc_smc50mhz>;
> > > > +      clock-names = "apb_pclk";
> > > > +    };
> > > > +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> > > > +  #  driver according to the v8 architecture specification.
> > > > +  - |
> > > > +    cti@859000 {
> > > > +      compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> > > > +                   "arm,primecell";
> > > > +      reg = <0x859000 0x1000>;
> > > > +
> > > > +      clocks = <&soc_smc50mhz>;
> > > > +      clock-names = "apb_pclk";
> > > > +
> > > > +      cpu = <&CPU1>;
> > > > +      arm,cs-dev-assoc = <&etm1>;
> > >
> > > and it looks like arm,cs-dev-assoc and cpu can be combined?
> > >
> > Absolutely - a CTI can and is connected to both the CPU and an
> > optional ETM attached to the CPU in a v8 architecture system.
>
> That's not what
>
> > > > +    oneOf:
> > > > +      - required:
> > > > +        - arm,trig-conn-name
> > > > +      - required:
> > > > +        - cpu
> > > > +      - required:
> > > > +        - arm,cs-dev-assoc
>
> Is saying though. oneOf is a xor, you can have one of the three
> schemas that are valid, but not more than that.
>

This required schema only applies to the trig-conns@ child nodes. So
each trig-conns can have one only of the three attributes - as each
trig-conns node represents a single connection between the CTI and a
component, and defines the trigger signals that exist in that
connections.

At the cti@ level, if the compatible is the arm,coresight-cti-v8-arch
type, then both cpu and arm,cs-dev-assoc can appear at this level as
we only need to know the devices it is connected to - the individual
trigger signals in the connections are defined by the architecture and
do not need repeating here.

> > > > +    };
> > > > +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> > > > +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> > > > +  - |
> > > > +    #include <dt-bindings/arm/coresight-cti-dt.h>
> > > > +
> > > > +    cti@858000 {
> > > > +      compatible = "arm,coresight-cti", "arm,primecell";
> > > > +      reg = <0x858000 0x1000>;
> > > > +
> > > > +      clocks = <&soc_smc50mhz>;
> > > > +      clock-names = "apb_pclk";
> > > > +
> > > > +      arm,cti-ctm-id = <1>;
> > > > +
> > > > +      trig-conns@0 {
> > >
> > > So, what I think happened here is that your patternProperties doesn't
> > > match anything (underscore vs dash), and since you don't have
> > > additionalProperties set to false, it doesn't warn that there's
> > > properties that aren't defined in the binding. Meaning that none of
> > > the child nodes in the bindings are effectively validated.
> > >
> >
> > OK - fixing the name should fix this.
> > I can't use additionalProperties as this is prohibited for bindings
> > that use ref: (according to the example-schema.yaml)
>
> Ah right, I missed that one, sorry. In this case, you can use the
> keyword unevaluatedProperties instead. As its name suggests, it will
> report an error if there's a property that hasn't been validated by
> any schemas.
>
> Note that this is a keyword introduced by the latest schemas spec
> (draft 2019-09) which isn't supported by the DT tools yet. But putting
> it into your schema will at least allow to have that check when the
> tools will support it.
>
> > > > +            arm,trig-in-sigs = <4 5 6 7>;
> > > > +            arm,trig-in-types = <ETM_EXTOUT
> > > > +                                 ETM_EXTOUT
> > > > +                                 ETM_EXTOUT
> > > > +                                 ETM_EXTOUT>;
> > > > +            arm,trig-out-sigs = <4 5 6 7>;
> > > > +            arm,trig-out-types = <ETM_EXTIN
> > > > +                                  ETM_EXTIN
> > > > +                                  ETM_EXTIN
> > > > +                                  ETM_EXTIN>;
> > > > +            arm,cs-dev-assoc = <&etm0>;
> > > > +      };
> > >
> > > Nodes with unit-address must have a matching reg property. This will
> > > generate a dtc warning too.
> >
> > That's interesting - I don't get any dtc warnings when compiling or
> > when running make dt_binding_checl
>
> Linux disables a lot of DTC warnings. You can see all (I think?) the
> warnings by passing W=1 in the environment when you compile the device
> trees.
>
Thanks -  the W=12 starts outputting warnings for lack of reg in child nodes.
I'll build the requirement into the next version so it is explicitly
called out in the check.

> > Is this rule documented anywhere? I cannot see it in the 0.2 spec
> > version from devicetree.org or any of the examples / docs in the
> > kernel tree.
>
> The commit adding it to DTC is this one
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?id=852e9ecbe1976927057402f8a8f71ee8e8a49098

I was referring to the requirement for reg = <N> in node@<N> child
nodes - though I have now spotted this in the early part of the
0.3-rc2 spec - which appears to be the latest I have access to.

So I can add in the reg<> parameters and fix this up.

>
> It just seems that while valid, it's against best practices.
>
> Maxime

Thanks

Mike
--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
