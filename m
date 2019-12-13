Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB9FC34017
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3D70246B8
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4W351VY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfLMPEs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 10:04:48 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37293 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfLMPEs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 10:04:48 -0500
Received: by mail-qt1-f196.google.com with SMTP id w47so2500274qtk.4
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocHwrsXqUbpVSk0Am3Q1r+7my1ATA/uKlFLAY435IJA=;
        b=a4W351VYeIo6j6P/oR2B2dbG1tgztS1KqdQ1K7rYAQFPBrL3Kr2RTtq7EJhQ+ClKQR
         YnbCNcX642AA7ANm4pLot//6gsE6JCrZV6jwdB1HuF4HiW685DDdsvRLz7du4C49o+TJ
         tuVd93rMhE8FFNhUyR3SZW7lxFGHHxhBR2semIGrIPwgvu8MLPd/JH2xqQ+/eiVuHeTk
         a71Gp2mWUcqnT9XgegpKV0vWbNb+Kd1cyN4X+Mxvbq8uT49iXo6LUcDrtX8UFrHXPJnS
         jgkcFax2/TqxdyFJuNmS/3YMtQpNSzeSApjo05VkK8lReIhqGblMXiSG6xnXtoxCeCus
         45wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocHwrsXqUbpVSk0Am3Q1r+7my1ATA/uKlFLAY435IJA=;
        b=sS5IBWRh4JjXew7ryudlNz0lVajzw3SOImxm7SOiwPBsnVRzviXJTVrO/F3BevHIcy
         p/IgdidoCQB8zXB+UxaPu4juXj/glLprzz0ZTj5zxM41gPcBJml41nsMvqqHL4YTQkhp
         kX/SmicUzer3UHmolpd/b3qyrRxTGuKV/QeXvvST4/+whi7cPKh6//xJi6OFyGuPHDlD
         555ThlPnAnYc3pCZtebDwzFGgEfCvyUUdeJfHwOzmOawlNh6oxePttl3k8xE7wbhiIWK
         8D0M4+sm+Bey2V+JYJINFGJoN3iK1EzWJezg0gydY9vkOSTw+t5F6KO7h6yiTDG4fyvc
         L/cw==
X-Gm-Message-State: APjAAAX0EPmELO3rUeuGyn9fkE8j7D0+Pil+juntOcp6ZEVe2sAgTcIU
        CXOZQzl4zXhXtT68xbDq0nNZCaINj//AJshdMEWuow==
X-Google-Smtp-Source: APXvYqx9D1QMtHNTPTckoipP0oEzSqRJtSD/71ckJSygsxc0nRjN+t4t4r+9prtUSotz1wOBqSabpdz+UnxpjOL2k4A=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr575046qtn.88.1576249486391;
 Fri, 13 Dec 2019 07:04:46 -0800 (PST)
MIME-Version: 1.0
References: <20191211230813.5144-1-mike.leach@linaro.org> <20191213114008.uyghh3rdbnaumcft@gilmour.lan>
In-Reply-To: <20191213114008.uyghh3rdbnaumcft@gilmour.lan>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 13 Dec 2019 15:04:35 +0000
Message-ID: <CAJ9a7VjhbAxmJPc1TT2EfzEC6EPinf7Kq8qbv1ZQ-_S0qmfXow@mail.gmail.com>
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

Hi Maxime,

Thanks for the feedback.

On Fri, 13 Dec 2019 at 11:40, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Wed, Dec 11, 2019 at 11:08:13PM +0000, Mike Leach wrote:
> > Adds new coresight-cti.yaml file describing the bindings required to define
> > CTI in the device trees.
> >
> > Adds an include file to dt-bindings/arm to define constants describing
> > common signal functionality used in CoreSight and generic usage.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >  .../bindings/arm/coresight-cti.yaml           | 303 ++++++++++++++++++
> >  .../devicetree/bindings/arm/coresight.txt     |   7 +
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/arm/coresight-cti-dt.h    |  37 +++
> >  4 files changed, 349 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> >
> > diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > new file mode 100644
> > index 000000000000..cbbe88fa7148
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +# Copyright 2019 Linaro Ltd.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/coresight-cti.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Coresight Cross Trigger Interface (CTI) device.
> > +
> > +description: |
> > +  The CoreSight Embedded Cross Trigger (ECT) consists of CTI devices connected
> > +  to one or more CoreSight components and/or a CPU, with CTIs interconnected in
> > +  a star topology via the Cross Trigger Matrix (CTM), which is not programmable.
> > +  The ECT components are not part of the trace generation data path and are thus
> > +  not part of the CoreSight graph described in the general CoreSight bindings
> > +  file coresight.txt.
> > +
> > +  The CTI component properties define the connections between the individual
> > +  CTI and the components it is directly connected to, consisting of input and
> > +  output hardware trigger signals. CTIs can have a maximum number of input and
> > +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
> > +  number is defined at design time, the maximum of each defined in the DEVID
> > +  register.
> > +
> > +  CTIs are interconnected in a star topology via the CTM, using a number of
> > +  programmable channels, usually 4, but again implementation defined and
> > +  described in the DEVID register. The star topology is not required to be
> > +  described in the bindings as the actual connections are software
> > +  programmable.
> > +
> > +  In general the connections between CTI and components via the trigger signals
> > +  are implementation defined, except when the CTI is connected to an ARM v8
> > +  architecture core and optional ETM.
> > +
> > +  In this case the ARM v8 architecture defines the required signal connections
> > +  between CTI and the CPU core and ETM if present. In the case of a v8
> > +  architecturally connected CTI an additional compatible string is used to
> > +  indicate this feature (arm,coresight-cti-v8-arch).
> > +
> > +  When CTI trigger connection information is unavailable then a minimal driver
> > +  binding can be declared with no explicit trigger signals. This will result
> > +  the driver detecting the maximum available triggers and channels from the
> > +  DEVID register and make them all available for use as a single default
> > +  connection. Any user / client application will require additional information
> > +  on the connections between the CTI and other components for correct operation.
> > +  This information might be found by enabling the Integration Test registers in
> > +  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_TEST in Kernel
> > +  configuration). These registers may be used to explore the trigger connections
> > +  between CTI and other CoreSight components.
> > +
> > +  Certain triggers between CoreSight devices and the CTI have specific types
> > +  and usages. These can be defined along with the signal indexes with the
> > +  constants defined in <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +  For example a CTI connected to a core will usually have a DBGREQ signal. This
> > +  is defined in the binding as type PE_EDBGREQ. These types will appear in an
> > +  optional array alongside the signal indexes. Omitting types will default all
> > +  signals to GEN_IO.
> > +
> > +  Note that some hardware trigger signals can be connected to non-CoreSight
> > +  components (e.g. UART etc) depending on hardware implementation.
> > +
> > +maintainers:
> > +  - Mike Leach <mike.leach@linaro.org>
> > +
> > +allOf:
> > +  - $ref: /schemas/arm/primecell.yaml#
> > +
> > +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - arm,coresight-cti
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^cti(@[0-9a-f]+)$"
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - const: arm,coresight-cti
> > +        - const: arm,primecell
> > +      - items:
> > +        - const: arm,coresight-cti-v8-arch
> > +        - const: arm,coresight-cti
> > +        - const: arm,primecell
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  cpu:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
>
> You can drop the allOf here, and move the $ref directly under cpu:
>

OK - I'll fixup whenever this occurs.

> > +    description: Handle to cpu this device is associated with.
> > +
> > +  arm,cti-ctm-id:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
>
> Ditto
>
> > +    description:
> > +      Defines the CTM this CTI is connected to, in large systems with multiple
> > +      separate CTI/CTM nets. Typically multi-socket systems where the CTM is
> > +      propagated between sockets.
> > +
> > +  arm,cs-dev-assoc:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
>
> Ditto,
>
> > +    description:
> > +      defines a phandle reference to an associated CoreSight trace device.
> > +      When the associated trace device is enabled, then the respective CTI
> > +      will be enabled. Use in a trig-conns node, or in CTI base node when
> > +      arm,cti-v8-arch present. If the associated device has not been registered
> > +      then the node name will be stored as the connection name for later
> > +      resolution. If the associated device is not a CoreSight device or not
> > +      registered then the node name will remain the connection name and
> > +      automatic enabling will not occur.
> > +
> > +patternProperties:
> > +  '^trig_conns@([0-9]+)$':
>
> underscores in nodename are frowned upon (and generate a warning in
> dtc), you should avoid them.
>

This is an error on my part - trig-conns is in fact what is used in
the bindings and handling code.

> > +    type: object
> > +    description:
> > +      A trigger connections child node which describes the trigger signals
> > +      between this CTI and another hardware device. This device may be a CPU,
> > +      CoreSight device, any other hardware device or simple external IO lines.
> > +      The connection may have both input and output triggers, or only one or the
> > +      other.
> > +
> > +    properties:
> > +
> > +      arm,trig-in-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger in signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-in-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger in
> > +          signals. Types in this array match to the corresponding signal in the
> > +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> > +          completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-out-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-out-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger out
> > +          signals. Types in this array match to the corresponding signal
> > +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> > +          or omitted completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-filters:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signals that will be blocked from becoming
> > +          active, unless filtering is disabled on the driver.
> > +
> > +      arm,trig-conn-name:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/string
> > +        description:
> > +          Defines a connection name that will be displayed, if the cpu or
> > +          arm,cs-dev-assoc properties are not being used in this connection.
> > +          Principle use for CTI that are connected to non-CoreSight devices, or
> > +          external IO.
> > +
> > +    anyOf:
> > +      - required:
> > +        - arm,trig-in-sigs
> > +      - required:
> > +        - arm,trig-out-sigs
> > +    oneOf:
> > +      - required:
> > +        - arm,trig-conn-name
> > +      - required:
> > +        - cpu
> > +      - required:
> > +        - arm,cs-dev-assoc
>
> This would mean that either arm,trig-conn-name, cpu xor
> arm,cs-dev-assoc is required in the trig_conn child nodes, but they
> don't seem to be defined at this level but in the parent node?
>

cpu and rm,cs-dev-assoc can appear in the parent node if the
arm,coresight-cti-v8-arch compatible string is used - hence declared
at that level. See the examples for the v8 compatible layout.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +examples:
> > +  # minimum CTI definition. DEVID register used to set number of triggers.
> > +  - |
> > +    cti@20020000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x20020000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +    };
> > +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> > +  #  driver according to the v8 architecture specification.
> > +  - |
> > +    cti@859000 {
> > +      compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> > +                   "arm,primecell";
> > +      reg = <0x859000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      cpu = <&CPU1>;
> > +      arm,cs-dev-assoc = <&etm1>;
>
> and it looks like arm,cs-dev-assoc and cpu can be combined?
>
Absolutely - a CTI can and is connected to both the CPU and an
optional ETM attached to the CPU in a v8 architecture system.

> > +    };
> > +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> > +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> > +  - |
> > +    #include <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +    cti@858000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x858000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      arm,cti-ctm-id = <1>;
> > +
> > +      trig-conns@0 {
>
> So, what I think happened here is that your patternProperties doesn't
> match anything (underscore vs dash), and since you don't have
> additionalProperties set to false, it doesn't warn that there's
> properties that aren't defined in the binding. Meaning that none of
> the child nodes in the bindings are effectively validated.
>

OK - fixing the name should fix this.
I can't use additionalProperties as this is prohibited for bindings
that use ref: (according to the example-schema.yaml)

> > +            arm,trig-in-sigs = <4 5 6 7>;
> > +            arm,trig-in-types = <ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT>;
> > +            arm,trig-out-sigs = <4 5 6 7>;
> > +            arm,trig-out-types = <ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN>;
> > +            arm,cs-dev-assoc = <&etm0>;
> > +      };
>
> Nodes with unit-address must have a matching reg property. This will
> generate a dtc warning too.
>

That's interesting - I don't get any dtc warnings when compiling or
when running make dt_binding_checl
Is this rule documented anywhere? I cannot see it in the 0.2 spec
version from devicetree.org or any of the examples / docs in the
kernel tree.

Thanks

Mike

> Maxime



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
