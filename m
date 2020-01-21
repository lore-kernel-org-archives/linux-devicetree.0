Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738ABC2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 16:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 45211217F4
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 16:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3g8phga"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgAUQAi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 11:00:38 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33640 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgAUQAi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 11:00:38 -0500
Received: by mail-wm1-f68.google.com with SMTP id d139so2406100wmd.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 08:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ytwKdiKDkBrq5dWN34mZGZBl7UpibNepadICMkoJFGA=;
        b=A3g8phgaxu7x2jJLxOOrTVVNprEJJJPK5vGTb65L/lIrSnqdZod0XDVtme4mjiZWmB
         tbew2hAP3T/tHd19LKPUnuHOwrZhT0zt/NvwCaVQrx9VhHjbFJOK9+CKbCksBbq4sy/7
         1eOvdE6fyAYUUJfR6BjXc3TKC6jRXwx4dawndZh3kksTjoT+G7KX7yyuwfjEMc3z+6xn
         uUPo3msBSjzJ6zx4QL3Kg0YBK7HGBW67OG7ymS7ZOZ+CBl0D9gOmIxJ/im5KvK6tEDN0
         5xgt0RFB6O5JTrS1WJOljBYb3636Iy35GI1N22oQwN0sydZmNcXUeL03g/Uogpxhj9c8
         zbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ytwKdiKDkBrq5dWN34mZGZBl7UpibNepadICMkoJFGA=;
        b=s1Yq2oXSt9+UKLF/xhV5DkGbdvmA7Hs1Qyw1BKnEhdWRYNGVSKNplsnVSFVbHUBxVR
         dAHPnaUDV+QXLhrffKBW7/CRCNpMYov52KI0/l/nBfac2j9PBVaqA8l4AyutfUHEdX6N
         QgeMwknr7ay6V1NLsbag2G6u1gz7glzdmUyFzCFm9LZbAlrkH8pKXuNjC6Hae1Rec6CQ
         N9itCdikFs+dSIhDJRdbHbAueVl+20o9/lZYs+M0xc/JDpsethTWsS4DBr8K3Abili5A
         YSG8lJar+NdLJvS1loTA0wsqVUfWgeHL5+8AUZDz6nT2uwgC6RpRVtoJdd8W/3kiGFgw
         6Sug==
X-Gm-Message-State: APjAAAVLSbTOqzIcR9pnFfTNTVkKN+rAyRCuGnzsHWECnTf7Jt/O9l6m
        keQiJ3WqEby+sV/ydOOX5Og=
X-Google-Smtp-Source: APXvYqw/5uPfelRwAOPcMQ/7ch5/ttpQTTV4/ZW3Orj4e+6tsxvKNnOwkfDYFwEyTwz4cepmMWDCIg==
X-Received: by 2002:a1c:3c89:: with SMTP id j131mr5150540wma.34.1579622436737;
        Tue, 21 Jan 2020 08:00:36 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u1sm4335276wmc.5.2020.01.21.08.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 08:00:36 -0800 (PST)
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     airlied@linux.ie, dafna3@gmail.com, daniel@ffwll.ch,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ezequiel@collabora.com, heiko@sntech.de, helen.koike@collabora.com,
        hjc@rock-chips.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
 <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
 <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <633202b7-31cb-a2ff-9461-631652cd94c0@gmail.com>
Date:   Tue, 21 Jan 2020 17:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <7c79efd2-f5b0-6736-19b0-4d116714f887@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 1/21/20 4:26 PM, Dafna Hirschfeld wrote:
> 
> 
> On 21.01.20 16:11, Johan Jonker wrote:
>> Hi Dafna,
>>
>>
>>>
>>>
>>> On 21.01.20 15:03, Rob Herring wrote:
>>>> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
>>>> <dafna.hirschfeld@collabora.com> wrote:
>>>>>
>>>>> convert the binding file rockchip-drm.txt to yaml format.
>>>>> This was tested and verified with:
>>>>> make dt_binding_check
>>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>>>
>>>>
>>>> Also, make sure just 'make dt_binding_check' passes as that checks the
>>>> example against all schemas.
>>>
>>> But this also checks the other schemas in general, and when running it,
>>> it fails because of bugs in other schemas.
>>
>>
>>> For example with arm=ARM I get:
>>
>> Use:
>>
>> # enable Rockchip arm in menuconfig
>> make ARCH=arm menuconfig
>>
>> make ARCH=arm dt_binding_check
>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>
>>
>> and not:
>> arm=ARM
>>
> yes, sorry, this is what I did. When running with the DT_SCHEMA_FILES
> set then it passes both on ARM and ARM64
> but when this variable is not set I get the above error.

# for Intel use:
make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml


# for Rockchip use:
make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

Also change:

example:
  Reduce some spaces here.

Also remove "|" from description.

See:
description: |
  A more detailed multi-line description of the binding.

  Details about the hardware device and any links to datasheets can go here.

  Literal blocks are marked with the '|' at the beginning. The end is
marked by
  indentation less than the first line of the literal block. Lines also
cannot
  begin with a tab character.

> 
> Dafna
> 
>>
>>>
>>>     DTC    
>>> Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
>>> Error:
>>> Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29
>>> syntax error
>>> FATAL ERROR: Unable to parse input tree
>>>
>>> Dafna
>>>
>>>>
>>>>> make dtbs_check
>>>>> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>>>
>>>>>
>>

