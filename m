Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E525AC432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:50:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0D6A217BA
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OOE9G76r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfK2Nu5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 08:50:57 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:45744 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfK2Nu5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 08:50:57 -0500
Received: by mail-qv1-f65.google.com with SMTP id c2so4426003qvp.12
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+48mKtM249W0d1rotn10hWllhDwLN9J2dVtCthcPqL4=;
        b=OOE9G76rausBfdbYb8bxjNq2Rt6iaFRyP9qNM8wv/LckC7NkN4FergteaCxEtr2fvQ
         /aW/fah1SWUEss2EhP48D4YvZ/k/pONVMhd3IoCdu+UZ0QAAjXJAg9zw5MWYqZYNQyvo
         jKONelM4wav1dRDlaxnVlPSSVzexTJ0dJ2zFKbqzERqa0IkwTky1r3ibXz5XZnJDUyf5
         Q6bwsPf4HWJDAvzJ0zgAa1irL5cjJSu+1aNoEprx1sjquE0WD/9fTrcfKlNhfqO4TCf4
         0OeFCRtJdVS3iuTy+/7tbD8uBmQc7n//EMFY3+ewAcw7xi0aVxAGD3sa25JV8wRm4rfj
         HMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+48mKtM249W0d1rotn10hWllhDwLN9J2dVtCthcPqL4=;
        b=GCcD2etJZ8BY2dMKwb/Pi3NlwooY2zzQ2p5B4jv9l8kz6IL2+fwW8VQ1mw55h1x61X
         tn7b+t/WjDV+KG0qxByLzldWHnDKfSFFjNbNYVJixw2MtZDJbIYUxhxmiBl6mMdoD4A1
         g3s+VA1CXzgFbfgdBu3vyfDp8+c5VBk8yDefYEUJ47SMQcvF2tzliKi8S0qlcri3Kvhz
         my06zlSLLw17hyNqUlGA4upf6yMNbKWNZoHm1WFbkPYcn7qN0UbsnYy9bRGI8GAKsmXc
         FQdGAwwACiXsxUnmtePcv39sleynVbiO+oC8vy1q7gk+l4GwTx9TcODx2fkGJ4f+7hng
         pgDQ==
X-Gm-Message-State: APjAAAWj2K1vbC3UoVGHkXybs9JcGDNPbX4+SiPXBhq1VY9xAIW04idz
        1F95sQnELdVlhQUmApLbFmbRBbCt5823FKs3KNG9rA==
X-Google-Smtp-Source: APXvYqykckBcci6gFbpOSRPso7Ikj0//b9XMmOTEShpPW27U8O6h795vgb3G60ElYxpquoytoJHoE4Fu1FWtoW2YDIE=
X-Received: by 2002:ad4:4908:: with SMTP id bh8mr14025932qvb.251.1575035454874;
 Fri, 29 Nov 2019 05:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-6-mike.leach@linaro.org>
 <20191122233317.GA13904@bogus>
In-Reply-To: <20191122233317.GA13904@bogus>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 13:50:43 +0000
Message-ID: <CAJ9a7VhDnXQ4WL45F-naNqmwM5GTkKnqCnC512D9+wOFnMrdOg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] dt-bindings: arm: Adds CoreSight CTI hardware definitions.
To:     Rob Herring <robh@kernel.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

On Fri, 22 Nov 2019 at 23:33, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 19, 2019 at 11:19:03PM +0000, Mike Leach wrote:
> > Adds new coresight-cti.yaml file describing the bindings required to define
> > CTI in the device trees.
> >
> > Adds an include file to dt-bindings/arm to define constants describing
> > common signal functionality used in CoreSight and generic usage.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
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
> > index 000000000000..882c72f1c798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> Dual license new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)
>
OK.

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
> > +  a star topology via the CTM (which is not programmable). The ECT components
> > +  are not part of the trace generation data path and are thus not part of the
> > +  CoreSight graph described in the general CoreSight bindings file
> > +  coresight.txt.
> > +
> > +  The CTI component properties define the connections between the individual
> > +  CTI and the components it is directly connected to, consisting of input and
> > +  output hardware trigger signals. CTIs can have a maximum number of input and
> > +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
> > +  number is defined at design time, the maximum of each defined in the DEVID
> > +  register.
> > +
> > +  CTIs are interconnected in a star topology via the CTM, using a number of
> > +  programmable channels usually 4, but again implementation defined and
> > +  described in the DEVID register. The star topology is not required to be
> > +  described in the bindings as the actual connections are software
> > +  programmable.
> > +
> > +  In general the connections between CTI and components via the trigger signals
> > +  are implementation defined, other than when v8 core and ETM is present.
> > +  The v8 architecture defines the required signal connections between CPU core
> > +  and CTI, and ETM and CTI, if the ETM if present.
> > +
> > +  When only minimal information is available for the CTI trigger connections,
> > +  then a minimal driver binding can be declare with no explicit trigger
> > +  signals. This will result in the using the DEVID register to set the
> > +  input and output triggers and channels in use. Any user / client
> > +  application will require additional information on the connections
> > +  between the CTI and other components for correct operation. This minimal
> > +  binding may be used when using the Integration Control registers to
> > +  discover connections between CTI and other CoreSight components,
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
> > +    pattern: "^cti(@[0-9a-f,]+)*$"
>
> Unit address should not be optional nor have a comma.
>

Will fix.

> > +  compatible:
> > +    items:
> > +      - const: arm,coresight-cti
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    items:
> > +      - description: device programming registers
>
> Just "maxItems: 1" is sufficient.
>

OK

> > +
> > +  arm,cti-v8-arch:
> > +    type: boolean
> > +    description:
> > +      This CTI follows the v8 architecturally mandated layout for a CTI.
>
> Seems like the compatible or primecell ID registers should be used for
> something like this.
>

Unfortunately it is possible and has happened that the same primecell
regs for a CTI connected to a v8 core and one that is used as a
general system CTI appear in the same system.
There is no architectural requirement on the CTI to indicate that its
external connections are as per v8 architecture spec when connected to
 a PE/ETM combo.

Therefore a compatible "arm,coresight-cti-v8" would seem the best
route. I'll update the compatible portion of the schema and handling
code accordingly.

> > +      Bindings declaring this must declare a cpu, and optionally a single
> > +      arm,cs-dev-assoc may be present to define an attached ETM. No additional
> > +      trig-conns nodes are permitted. The driver will build a connection model
> > +      according to architectural requirements. This will include a filter on
> > +      the CPU dbgreq signal as described above.
> > +
> > +  cpu:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Handle to cpu this device is associated with.
> > +
> > +  arm,cti-ctm-id:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Defines the CTM this CTI is connected to, in large systems with multiple
> > +      separate CTI/CTM nets. Typically multi-socket systems where the CTM is
> > +      propagated between sockets.
> > +
> > +  arm,cs-dev-assoc:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      defines a phandle reference to an associated CoreSight trace device.
>
> s/defines/Defines/
>
OK

> > +      When the associated trace device is enabled, then the respective CTI
> > +      will be enabled. Use in a trig-conns node, or in CTI base node when
> > +      arm,cti-v8-arch present. If the associated device has not been registered
> > +      then the node name will be stored as the connection name for later
> > +      resolution. If the associated device is not a CoreSight device or not
> > +      registered then the node name will remain the connection name and
> > +      automatic enabling will not occur.
> > +
> > +patternProperties:
> > +  '^trig_conns@[0-9]+$':
>
> trig-conns@...
>
will fix.

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
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x859000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      arm,cti-v8-arch;
> > +      cpu = <&CPU1>;
> > +      arm,cs-dev-assoc = <&etm1>;
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
> > +
> > +      trig-conns@1 {
> > +            cpu = <&CPU0>;
> > +            arm,trig-in-sigs = <0 1>;
> > +            arm,trig-in-types = <PE_DBGTRIGGER
> > +                                 PE_PMUIRQ>;
> > +            arm,trig-out-sigs=<0 1 2 >;
> > +            arm,trig-out-types = <PE_EDBGREQ
> > +                                  PE_DBGRESTART
> > +                                  PE_CTIIRQ>;
> > +
> > +            arm,trig-filters = <0>;
> > +      };
> > +    };
> > +  # Implementation defined CTI - none CoreSight component connections.
> > +  - |
> > +    cti@20110000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0 0x20110000 0 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      trig-conns@0 {
> > +        arm,trig-in-sigs=<0>;
> > +        arm,trig-in-types=<GEN_INTREQ>;
> > +        arm,trig-out-sigs=<0>;
> > +        arm,trig-out-types=<GEN_HALTREQ>;
> > +        arm,trig-conn-name = "sys_profiler";
> > +      };
> > +
> > +      trig-conns@1 {
> > +        arm,trig-out-sigs=<2 3>;
> > +        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "watchdog";
> > +      };
> > +
> > +      trig-conns@2 {
> > +        arm,trig-in-sigs=<1 6>;
> > +        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "g_counter";
> > +      };
> > +    };
> > +
> > +...
> > \ No newline at end of file
>
> '...' is preferred, but the fix the lack of newline.
>
Will do.

Thanks for the feedback.

Mike

> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index d02c42d21f2f..846f6daae71b 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -45,6 +45,10 @@ its hardware characteristcs.
> >               - Coresight Address Translation Unit (CATU)
> >                       "arm,coresight-catu", "arm,primecell";
> >
> > +             - Coresight Cross Trigger Interface (CTI):
> > +                     "arm,coresight-cti", "arm,primecell";
> > +                     See coresight-cti.yaml for full CTI definitions.
> > +
> >       * reg: physical base address and length of the register
> >         set(s) of the component.
> >
> > @@ -72,6 +76,9 @@ its hardware characteristcs.
> >       * reg-names: the only acceptable values are "stm-base" and
> >         "stm-stimulus-base", each corresponding to the areas defined in "reg".
> >
> > +* Required properties for Coresight Cross Trigger Interface (CTI)
> > +     See coresight-cti.yaml for full CTI definitions.
> > +
> >  * Required properties for devices that don't show up on the AMBA bus, such as
> >    non-configurable replicators and non-configurable funnels:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9de89d75dbcc..8d01a74068f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1608,9 +1608,11 @@ R:     Suzuki K Poulose <suzuki.poulose@arm.com>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> >  F:   drivers/hwtracing/coresight/*
> > +F:   include/dt-bindings/arm/coresight-cti-dt.h
> >  F:   Documentation/trace/coresight/*
> >  F:   Documentation/devicetree/bindings/arm/coresight.txt
> >  F:   Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> > +F:   Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  F:   Documentation/ABI/testing/sysfs-bus-coresight-devices-*
> >  F:   tools/perf/arch/arm/util/pmu.c
> >  F:   tools/perf/arch/arm/util/auxtrace.c
> > diff --git a/include/dt-bindings/arm/coresight-cti-dt.h b/include/dt-bindings/arm/coresight-cti-dt.h
> > new file mode 100644
> > index 000000000000..61e7bdf8ea6e
> > --- /dev/null
> > +++ b/include/dt-bindings/arm/coresight-cti-dt.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * This header provides constants for the defined trigger signal
> > + * types on CoreSight CTI.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +#define _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +
> > +#define GEN_IO               0
> > +#define GEN_INTREQ   1
> > +#define GEN_INTACK   2
> > +#define GEN_HALTREQ  3
> > +#define GEN_RESTARTREQ       4
> > +#define PE_EDBGREQ   5
> > +#define PE_DBGRESTART        6
> > +#define PE_CTIIRQ    7
> > +#define PE_PMUIRQ    8
> > +#define PE_DBGTRIGGER        9
> > +#define ETM_EXTOUT   10
> > +#define ETM_EXTIN    11
> > +#define SNK_FULL     12
> > +#define SNK_ACQCOMP  13
> > +#define SNK_FLUSHCOMP        14
> > +#define SNK_FLUSHIN  15
> > +#define SNK_TRIGIN   16
> > +#define STM_ASYNCOUT 17
> > +#define STM_TOUT_SPTE        18
> > +#define STM_TOUT_SW  19
> > +#define STM_TOUT_HETE        20
> > +#define STM_HWEVENT  21
> > +#define ELA_TSTART   22
> > +#define ELA_TSTOP    23
> > +#define ELA_DBGREQ   24
> > +#define CTI_TRIG_MAX 25
> > +
> > +#endif /*_DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H */
> > --
> > 2.17.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
