Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7832C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F9E422314
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 14:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgAUOzq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 09:55:46 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49506 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgAUOzq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 09:55:46 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 534C1283D45
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?6buE5a626ZKX?= <hjc@rock-chips.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>, dafna3@gmail.com
References: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
 <CAL_JsqJv-gXOK=80nqnO0TB1P-+1+E_vDaN3XSymKQfSLVTBsQ@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
Date:   Tue, 21 Jan 2020 15:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJv-gXOK=80nqnO0TB1P-+1+E_vDaN3XSymKQfSLVTBsQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 21.01.20 15:03, Rob Herring wrote:
> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
> <dafna.hirschfeld@collabora.com> wrote:
>>
>> convert the binding file rockchip-drm.txt to yaml format.
>> This was tested and verified with:
>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> Also, make sure just 'make dt_binding_check' passes as that checks the
> example against all schemas.

But this also checks the other schemas in general, and when running it, 
it fails because of bugs in other schemas.
For example with arm=ARM I get:

   DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
Error: 
Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29 
syntax error
FATAL ERROR: Unable to parse input tree

Dafna

> 
>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>> Changes since v1:
>> - fixed worng sign-off
>> - fixed the path of the $id property to be the path of the yaml file
>>
>>   .../display/rockchip/rockchip-drm.txt         | 19 ----------
>>   .../display/rockchip/rockchip-drm.yaml        | 38 +++++++++++++++++++
>>   2 files changed, 38 insertions(+), 19 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>>   create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>> deleted file mode 100644
>> index 5707af89319d..000000000000
>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -Rockchip DRM master device
>> -================================
>> -
>> -The Rockchip DRM master device is a virtual device needed to list all
>> -vop devices or other display interface nodes that comprise the
>> -graphics subsystem.
>> -
>> -Required properties:
>> -- compatible: Should be "rockchip,display-subsystem"
>> -- ports: Should contain a list of phandles pointing to display interface port
>> -  of vop devices. vop definitions as defined in
>> -  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
>> -
>> -example:
>> -
>> -display-subsystem {
>> -       compatible = "rockchip,display-subsystem";
>> -       ports = <&vopl_out>, <&vopb_out>;
>> -};
>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>> new file mode 100644
>> index 000000000000..538898ada9d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>> @@ -0,0 +1,38 @@
>> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> 
> Do you have rights to change the license? The default is GPL-2.0-only.
> Looks like Rockchip owns the copyright.
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/rockchip/rockchip-drm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip DRM master device
>> +
>> +maintainers:
>> +  - Sandy Huang <hjc@rock-chips.com
>> +  - Heiko Stuebner <heiko@sntech.de>
>> +
>> +description: |
>> +  The Rockchip DRM master device is a virtual device needed to list all
>> +  vop devices or other display interface nodes that comprise the
>> +  graphics subsystem.
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,display-subsystem
>> +
>> +  ports:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      Should contain a list of phandles pointing to display interface port
>> +      of vop devices. vop definitions as defined in
>> +      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
>> +
>> +required:
>> +  - compatible
>> +  - ports
> 
> Add:
> 
> additionalProperties: false
> 
>> +
>> +examples:
>> +  - |
>> +    display-subsystem {
>> +        compatible = "rockchip,display-subsystem";
>> +        ports = <&vopl_out>, <&vopb_out>;
>> +    };
>> --
>> 2.17.1
>>
