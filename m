Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC02C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:57:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F063217BC
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 13:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M10aN8hn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfK2N5g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 08:57:36 -0500
Received: from mail-qt1-f175.google.com ([209.85.160.175]:34892 "EHLO
        mail-qt1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfK2N5g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 29 Nov 2019 08:57:36 -0500
Received: by mail-qt1-f175.google.com with SMTP id n4so32575339qte.2
        for <devicetree@vger.kernel.org>; Fri, 29 Nov 2019 05:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i9Rx5UIZPviggRw+tCG09o7kCS9LkqftWjgabntzh9c=;
        b=M10aN8hnERiF/IAcg0msqW6+8PZpXHkwSRBKiVWTm9UWiyh1wXK2BDWUeN9w9NfDR/
         kaYr3mwhz/K/GJro6HYSohy3Ifo9xd2s7VwA3NQebD0TshPJhzL6IGHpHSZ36jAJfyHQ
         JiAoYdQI56sTC17iyuVE90swUSyWsB7A0h0/E7u/99R48SXeXBRLUy70tpn3bQ0q71ey
         EYkC5J4KyC5oTSLevvkCrr5Tjy90Gy22gO+ang3YLe9RL3wmMe8qHHUHzvaBbvBPUTMS
         ck00h+E4BSRaHsiDFnlbwpPbbW0CODN/n/tz4wu/IK/9szbgINeXoEWk4WZwUMjYFlfH
         SQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9Rx5UIZPviggRw+tCG09o7kCS9LkqftWjgabntzh9c=;
        b=uJXMKNdYNYVIPER4+lWp9Hq/Ym34fTOoJ/CNYOycgMb9qLbOWQ0jJPULTKXZxLiaJW
         2bIO2KLijr0Gks+DMmOYfpEJ3WwkJW5qwi+r/Qmc4ClDb7YovWYLQQwxgcMQy16YuFRJ
         kHvtMhSJnWcodm6JdtiCUqGtE7/tu+w+SGiw+Ysizaq7e5oGDYlCDW3lkgNI83ltMY5e
         cBcZODwFnHOvUpKH3ocmQHlpzmDUZvMGwIMWuLLAQTd8ZhXyFJUXUhwA5NpzQ5ru6nWv
         8D3uLNOC+hUfmikW2rnYCkTKf1bkm6oEc1GEFzZjiyT/WY5yz0eUVmBC90fnvygzUjQ6
         v+LA==
X-Gm-Message-State: APjAAAVCz4aFsDyLKUhtZTDNd5JXqxtPxsrEb24Fkcs4OrDxceWTL8Dx
        BKPf9Z6NFAoOXWDMkv6hXhGWPzdc7PnEzN+0Q5bInH+f
X-Google-Smtp-Source: APXvYqw+zqxMSmeCGjOpPvksq3ceGG31paKQm6BhqX+Ckr5Cgew4I0iKm6VWQUqe/suZ2zyAf7Hpdk4pLORXZR7wfuA=
X-Received: by 2002:ac8:1098:: with SMTP id a24mr18670934qtj.62.1575035855198;
 Fri, 29 Nov 2019 05:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20191119231912.12768-1-mike.leach@linaro.org> <20191119231912.12768-6-mike.leach@linaro.org>
 <f2150b39-c662-4eea-a556-27d8ebb51735@arm.com>
In-Reply-To: <f2150b39-c662-4eea-a556-27d8ebb51735@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 29 Nov 2019 13:57:24 +0000
Message-ID: <CAJ9a7Vj2gGBhZrkGqx+3caDiRuZ4VosRMgVB8B7mKydJtW_=Qw@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] dt-bindings: arm: Adds CoreSight CTI hardware definitions.
To:     Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Suzuki,

On Thu, 28 Nov 2019 at 18:38, Suzuki Kuruppassery Poulose
<suzuki.poulose@arm.com> wrote:
>
> Hi Mike,
>
> On 19/11/2019 23:19, Mike Leach wrote:
> > Adds new coresight-cti.yaml file describing the bindings required to define
> > CTI in the device trees.
> >
> > Adds an include file to dt-bindings/arm to define constants describing
> > common signal functionality used in CoreSight and generic usage.
>
> The documentation looks really nice and helpful. Some very minor nits
> below.
>
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
>
> > ---
> >   .../bindings/arm/coresight-cti.yaml           | 303 ++++++++++++++++++
> >   .../devicetree/bindings/arm/coresight.txt     |   7 +
> >   MAINTAINERS                                   |   2 +
> >   include/dt-bindings/arm/coresight-cti-dt.h    |  37 +++
> >   4 files changed, 349 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >   create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> >
> > diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > new file mode 100644
> > index 000000000000..882c72f1c798
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: GPL-2.0
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
>
> nit: CTM is not expanded anywhere here. For the sake of completeness,
> you may do that here.
>
> i.e, s/"a start topology via the CTM"/"a start topology via the Cross
> Trigger Matrix (CTM)"/
>

Agreed - I think the expansion got lost in the many re-arrangement of this doc.

>
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
>
> nit: "programmable channels, usually 4, but..." ?
>
OK

> > +  described in the DEVID register. The star topology is not required to be
> > +  described in the bindings as the actual connections are software
> > +  programmable.
> > +
> > +  In general the connections between CTI and components via the trigger signals
> > +  are implementation defined, other than when v8 core and ETM is present.
>
> nite: are implementation defined, *except when they are connected to an
> Arm v8 compatible CPU or an ETM* ?
>
>
Agreed - clearer.

> > +  The v8 architecture defines the required signal connections between CPU core
>
> nit: "The Arm v8"
>
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
>
> How about "When the CTI trigger connection information is unavailable,
> the driver detects the number of triggers and channels from the DEVID
> register and makes them available. The Integration Control registers
> can be then used to discover the connections for this CTI device
> to other CoreSight components".
>
> Since we recommend the use of the "Integration Control registers", which
> is not normally available unless you play around the code, it will be a
> good idea to metion, what the user needs to do to make the registers
> available. (One more reason to use the CONFIG symbol, makes that
> easier.)
>

Agreed - need to explain the use case for this and implications of
using a minimal binding.

>
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
> > +  compatible:
> > +    items:
> > +      - const: arm,coresight-cti
> > +      - const: arm,primecell
> > +
> > +  reg:
> > +    items:
> > +      - description: device programming registers
> > +
> > +  arm,cti-v8-arch:
>
> If possible, please could we make this :
>
> "arm,cti-arm-v8-architected"
>
> to be more meaning ful ?
>

Per my comments to Rob, the v8-cti case will be a compatible option,
so this will disappear as an attribute.

> > +    type: boolean
> > +    description:
> > +      This CTI follows the v8 architecturally mandated layout for a CTI.
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
> I understand these bindings have been around for quite long and is too
> late to make any changes. So, feel free to ignore this suggestion below
> and I am perfectly fine with it.
>
> --- Begin silly comments Or Skip to DONE ----
>
> Could we make the property names a bit more obvious ? Since they are
> supposed to be written by other people (unlike our variable names), it
> always makes sense to have expanded, meaningful names:
>
> s/trig_conns@/triggers@ ?
>
> s/arm,trig-{in,out}-sigs/arm,cti-{in,out}-triggers
> s/arm,trig-{in,out}-types/arm,cti-{in,out}-trigger-types
>
> "arm,trig-xxx" property name doesn't really imply that it is for cti.
> So, the above changes makes it explicit and more reader friendly.
>
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
>
> arm,cti-trigger-filters ?
>
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signals that will be blocked from becoming
> > +          active, unless filtering is disabled on the driver.
> > +
> > +      arm,trig-conn-name:
>
> arm,cti-trigger-name ?
>
>
> --- DONE or End of silly comments ---
>

I appreciate the comments on naming, but my feeling is to
differentiate between the trigger signals and the trigger connections
group. hence the sub-node has group trig_cons.
I was hoping that users would get that these are CTI related by the
fact that the root node is cti@...

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
>
> nit: s/none/non ?
>

OK.

> Rest looks fine to me.
>
> Suzuki

Thanks

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
