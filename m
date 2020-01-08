Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B94C00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 07:56:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC38F206F0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 07:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pSo54nAU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgAHH4d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 02:56:33 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:50534 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgAHH4c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 02:56:32 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0087uIfs049960;
        Wed, 8 Jan 2020 01:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578470179;
        bh=KhpU0u2bEtnbSBp/blmXJmSlFWzazsyzwOWjBb3p9KM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pSo54nAUYeoghyNG2Vp0JJ4+ERQGPp7VcdfLFMh/PGgBvfSTc/km0YN787idyLnrU
         +BElqlIjyPCsML+/9157zyIDMEptsY4k5CRUOKZSjjGT5YrRTHpcxm5PoVRlncAG6R
         kR2N8SO9eFWv50Y3nayWz1aT1g5eyAjiWZXFxMa4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0087uIvj092817
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 01:56:18 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 01:56:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 01:56:18 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0087uG3g067723;
        Wed, 8 Jan 2020 01:56:16 -0600
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
To:     Rob Herring <robh@kernel.org>, Maxime Ripard <maxime@cerno.tech>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200103152824.47383-1-maxime@cerno.tech>
 <20200104221321.GA11672@bogus> <20200106092724.pi2kbui7zayrhhzi@gilmour.lan>
 <20200106215129.GB11672@bogus>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <b0777c04-c21c-3737-7957-4dda37b85838@ti.com>
Date:   Wed, 8 Jan 2020 13:28:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200106215129.GB11672@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 07/01/20 3:21 AM, Rob Herring wrote:
> On Mon, Jan 06, 2020 at 10:27:24AM +0100, Maxime Ripard wrote:
>> Hi Rob,
>>
>> On Sat, Jan 04, 2020 at 03:13:21PM -0700, Rob Herring wrote:
>>> On Fri, Jan 03, 2020 at 04:28:24PM +0100, Maxime Ripard wrote:
>>>> The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
>>>> with a matching Device Tree binding.
>>>>
>>>> Now that we have the DT validation in place, let's convert the device tree
>>>> bindings for that controller over to a YAML schemas.
>>>>
>>>> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>
>>>> ---
>>>>
>>>> Changes from v1:
>>>>   - Added r-b tag from chen-yu
>>>> ---
>>>>  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
>>>>  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
>>>>  2 files changed, 135 insertions(+), 37 deletions(-)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
>>>>  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
>>>> new file mode 100644
>>>> index 000000000000..ded7d6f0a119
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
>>>> @@ -0,0 +1,135 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Allwinner A80 USB PHY Device Tree Bindings
>>>> +
>>>> +maintainers:
>>>> +  - Chen-Yu Tsai <wens@csie.org>
>>>> +  - Maxime Ripard <mripard@kernel.org>
>>>> +
>>>> +properties:
>>>> +  "#phy-cells":
>>>> +    const: 0
>>>> +
>>>> +  compatible:
>>>> +    const: allwinner,sun9i-a80-usb-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    anyOf:
>>>> +      - description: Main PHY Clock
>>>> +
>>>> +      - items:
>>>> +          - description: Main PHY clock
>>>> +          - description: HSIC 12MHz clock
>>>> +          - description: HSIC 480MHz clock
>>>
>>> Rather than anyOf, just 'minItems: 1' would work here. Though I guess
>>> this disallows 2 items.
>>
>> Yeah, 2 items is not allowed so I wanted to prevent that.
>>
>>>> +
>>>> +  clock-names:
>>>> +    oneOf:
>>>> +      - const: phy
>>>> +
>>>> +      - items:
>>>> +          - const: phy
>>>> +          - const: hsic_12M
>>>> +          - const: hsic_480M
>>>> +
>>>> +  resets:
>>>> +    anyOf:
>>>> +      - description: Normal USB PHY reset
>>>> +
>>>> +      - items:
>>>> +          - description: Normal USB PHY reset
>>>> +          - description: HSIC Reset
>>>> +
>>>> +  reset-names:
>>>> +    oneOf:
>>>> +      - const: phy
>>>> +
>>>> +      - items:
>>>> +          - const: phy
>>>> +          - const: hsic
>>>> +
>>>> +  phy_type:
>>>> +    const: hsic
>>>> +    description:
>>>> +      When absent, the PHY type will be assumed to be normal USB.
>>>> +
>>>> +  phy-supply:
>>>> +    description:
>>>> +      Regulator that powers VBUS
>>>> +
>>>> +required:
>>>> +  - "#phy-cells"
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - resets
>>>> +  - reset-names
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +if:
>>>> +  properties:
>>>> +    phy_type:
>>>> +      const: hsic
>>>> +
>>>> +  required:
>>>> +    - phy_type
>>>> +
>>>> +then:
>>>> +  properties:
>>>> +    clocks:
>>>> +      maxItems: 3
>>>> +
>>>> +    clock-names:
>>>> +      maxItems: 3
>>>> +
>>>> +    resets:
>>>> +      maxItems: 2
>>>> +
>>>> +    reset-names:
>>>> +      maxItems: 2
>>>
>>> Do you intend that only a single item is allowed when not HSIC? If so,
>>> that's not what is happening.
>>
>> That's intentional indeed, the former binding was making the hsic
>> clocks and resets mandatory when the phy was in HSIC mode, but only
>> recommending listing them otherwise. Maybe we can change that in the
>> future, but that seems out of scope for a conversion.
> 
> Okay. In that case,
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

merged, thanks!

-Kishon
