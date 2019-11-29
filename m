Return-Path: <SRS0=12Nb=ZV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F39C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:12:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7E75215A5
	for <linux-devicetree@archiver.kernel.org>; Fri, 29 Nov 2019 14:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfK2OMM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 29 Nov 2019 09:12:12 -0500
Received: from foss.arm.com ([217.140.110.172]:48230 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726824AbfK2OMM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 29 Nov 2019 09:12:12 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4A01FB;
        Fri, 29 Nov 2019 06:12:11 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39FA23F52E;
        Fri, 29 Nov 2019 06:12:10 -0800 (PST)
Subject: Re: [PATCH v5 05/14] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
To:     Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>
Cc:     Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20191119231912.12768-1-mike.leach@linaro.org>
 <20191119231912.12768-6-mike.leach@linaro.org> <20191122233317.GA13904@bogus>
 <CAJ9a7VhDnXQ4WL45F-naNqmwM5GTkKnqCnC512D9+wOFnMrdOg@mail.gmail.com>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <11e608cc-61c4-b650-3a43-52d68b55cfcb@arm.com>
Date:   Fri, 29 Nov 2019 14:12:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJ9a7VhDnXQ4WL45F-naNqmwM5GTkKnqCnC512D9+wOFnMrdOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 29/11/2019 13:50, Mike Leach wrote:
> Hi Rob,
> 
> On Fri, 22 Nov 2019 at 23:33, Rob Herring <robh@kernel.org> wrote:
>>
>> On Tue, Nov 19, 2019 at 11:19:03PM +0000, Mike Leach wrote:
>>> Adds new coresight-cti.yaml file describing the bindings required to define
>>> CTI in the device trees.
>>>
>>> Adds an include file to dt-bindings/arm to define constants describing
>>> common signal functionality used in CoreSight and generic usage.
>>>
>>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
>>> ---
>>>   .../bindings/arm/coresight-cti.yaml           | 303 ++++++++++++++++++
>>>   .../devicetree/bindings/arm/coresight.txt     |   7 +
>>>   MAINTAINERS                                   |   2 +
>>>   include/dt-bindings/arm/coresight-cti-dt.h    |  37 +++
>>>   4 files changed, 349 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>>>   create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
>>> new file mode 100644
>>> index 000000000000..882c72f1c798
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
>>> @@ -0,0 +1,303 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>
>> Dual license new bindings please:
>>
>> (GPL-2.0-only OR BSD-2-Clause)
>>
> OK.
> 
>>> +# Copyright 2019 Linaro Ltd.
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/coresight-cti.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ARM Coresight Cross Trigger Interface (CTI) device.
>>> +
>>> +description: |
>>> +  The CoreSight Embedded Cross Trigger (ECT) consists of CTI devices connected
>>> +  to one or more CoreSight components and/or a CPU, with CTIs interconnected in
>>> +  a star topology via the CTM (which is not programmable). The ECT components
>>> +  are not part of the trace generation data path and are thus not part of the
>>> +  CoreSight graph described in the general CoreSight bindings file
>>> +  coresight.txt.
>>> +
>>> +  The CTI component properties define the connections between the individual
>>> +  CTI and the components it is directly connected to, consisting of input and
>>> +  output hardware trigger signals. CTIs can have a maximum number of input and
>>> +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
>>> +  number is defined at design time, the maximum of each defined in the DEVID
>>> +  register.
>>> +
>>> +  CTIs are interconnected in a star topology via the CTM, using a number of
>>> +  programmable channels usually 4, but again implementation defined and
>>> +  described in the DEVID register. The star topology is not required to be
>>> +  described in the bindings as the actual connections are software
>>> +  programmable.
>>> +
>>> +  In general the connections between CTI and components via the trigger signals
>>> +  are implementation defined, other than when v8 core and ETM is present.
>>> +  The v8 architecture defines the required signal connections between CPU core
>>> +  and CTI, and ETM and CTI, if the ETM if present.
>>> +
>>> +  When only minimal information is available for the CTI trigger connections,
>>> +  then a minimal driver binding can be declare with no explicit trigger
>>> +  signals. This will result in the using the DEVID register to set the
>>> +  input and output triggers and channels in use. Any user / client
>>> +  application will require additional information on the connections
>>> +  between the CTI and other components for correct operation. This minimal
>>> +  binding may be used when using the Integration Control registers to
>>> +  discover connections between CTI and other CoreSight components,
>>> +
>>> +  Certain triggers between CoreSight devices and the CTI have specific types
>>> +  and usages. These can be defined along with the signal indexes with the
>>> +  constants defined in <dt-bindings/arm/coresight-cti-dt.h>
>>> +
>>> +  For example a CTI connected to a core will usually have a DBGREQ signal. This
>>> +  is defined in the binding as type PE_EDBGREQ. These types will appear in an
>>> +  optional array alongside the signal indexes. Omitting types will default all
>>> +  signals to GEN_IO.
>>> +
>>> +  Note that some hardware trigger signals can be connected to non-CoreSight
>>> +  components (e.g. UART etc) depending on hardware implementation.
>>> +
>>> +maintainers:
>>> +  - Mike Leach <mike.leach@linaro.org>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/arm/primecell.yaml#
>>> +
>>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        enum:
>>> +          - arm,coresight-cti
>>> +  required:
>>> +    - compatible
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^cti(@[0-9a-f,]+)*$"
>>
>> Unit address should not be optional nor have a comma.
>>
> 
> Will fix.
> 
>>> +  compatible:
>>> +    items:
>>> +      - const: arm,coresight-cti
>>> +      - const: arm,primecell
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: device programming registers
>>
>> Just "maxItems: 1" is sufficient.
>>
> 
> OK
> 
>>> +
>>> +  arm,cti-v8-arch:
>>> +    type: boolean
>>> +    description:
>>> +      This CTI follows the v8 architecturally mandated layout for a CTI.
>>
>> Seems like the compatible or primecell ID registers should be used for
>> something like this.
>>
> 
> Unfortunately it is possible and has happened that the same primecell
> regs for a CTI connected to a v8 core and one that is used as a
> general system CTI appear in the same system.
> There is no architectural requirement on the CTI to indicate that its
> external connections are as per v8 architecture spec when connected to
>   a PE/ETM combo.
> 
> Therefore a compatible "arm,coresight-cti-v8" would seem the best
> route. I'll update the compatible portion of the schema and handling
> code accordingly.

Looks sensible to me. However, please be aware that the coresight
devices are triggered via the AMBA bus probe. So, you may have to scan
the list of compatibles for this device to figure out, if this is really
v8-compatble.

Cheers
Suzuki
