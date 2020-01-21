Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C85C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:26:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5610F217F4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbgAUP0F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 10:26:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49728 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbgAUP0F (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 10:26:05 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id C679F28C03C
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     airlied@linux.ie, dafna3@gmail.com, daniel@ffwll.ch,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ezequiel@collabora.com, heiko@sntech.de, helen.koike@collabora.com,
        hjc@rock-chips.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
 <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
Date:   Tue, 21 Jan 2020 16:26:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 21.01.20 16:11, Johan Jonker wrote:
> Hi Dafna,
> 
> 
>>
>>
>> On 21.01.20 15:03, Rob Herring wrote:
>>> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
>>> <dafna.hirschfeld@collabora.com> wrote:
>>>>
>>>> convert the binding file rockchip-drm.txt to yaml format.
>>>> This was tested and verified with:
>>>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>
>>> Also, make sure just 'make dt_binding_check' passes as that checks the
>>> example against all schemas.
>>
>> But this also checks the other schemas in general, and when running it,
>> it fails because of bugs in other schemas.
> 
> 
>> For example with arm=ARM I get:
> 
> Use:
> 
> # enable Rockchip arm in menuconfig
> make ARCH=arm menuconfig
> 
> make ARCH=arm dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> and not:
> arm=ARM
> 
yes, sorry, this is what I did. When running with the DT_SCHEMA_FILES 
set then it passes both on ARM and ARM64
but when this variable is not set I get the above error.

Dafna

> 
>>
>>     DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
>> Error:
>> Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29
>> syntax error
>> FATAL ERROR: Unable to parse input tree
>>
>> Dafna
>>
>>>
>>>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>>
> 
