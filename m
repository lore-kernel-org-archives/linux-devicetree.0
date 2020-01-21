Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32BCC2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:11:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 968C221569
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 15:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUX/r9Xc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgAUPLW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 10:11:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40947 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbgAUPLW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 10:11:22 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so3443083wmi.5
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kV29KCb1tTjsoAawp5eJRY4AocgYk483wI8KhDn3Mn0=;
        b=RUX/r9XczXOUQ8uWuvKZBE0mKNBA3OSB7liIzJ9cde+h/JBPVxnlsyHI+9HaqUxGzn
         6yeNjvGkLD2sZLLRct9PvTBZTkHCpMeBPq0ABBHZK5jmDShaa8+7PMnME8xcH9Je/OnY
         GW4kOJYOuoGiYn3jMem/accrJTGgFIKAe4P2m8Je5AjyPOl+gsHDC5IjObvHxbx4Ao4e
         3K5b1jgZHS1jqW2kYjOd56PFBDBdarIM8I/VjrX1FpoLplXu4bIuFbnPaCt+rBmlVm/T
         EwB3t9OyeVSsyosVjzVZ8vCcl8UDJiALvyHjNfh0kzvPEm0l/T0oMwqys25Z9x7uxcBa
         mKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kV29KCb1tTjsoAawp5eJRY4AocgYk483wI8KhDn3Mn0=;
        b=h3rXSvnNGu/vriq0N40iqCgDfrC58o6EVuMiXDsbBzTfAcV0iLk+x1uHnJSX4o/9kM
         K8T8FuiaJ8EgkBJIYqHO+OYZHaq33XLc6YB0R7l9WIPrQmAEYG5quRIHPO4qV5RAeCh3
         krOrj7DMfRuvVszahwuuy7iCzCkXN11Bee4D5syj0rEsiC3DVk9VqkHHkguItC+POfOL
         Ejc6WlldKQJOcgf6EUTdcr/DIjcV254rRpzDRgGEWDXGyeOkRTaTk/Xkb+v5NZ7h9v1J
         kUGN/g7n9mGHDH24Z5Y3mXZQ0AVX1ER8wYJW5om2hWsdwHsGlHulEqRHR1rt31ubRluz
         TlFA==
X-Gm-Message-State: APjAAAWLOXyIVtRPHI1ditvYX5IN+qNMcwbwLK82OC+VHtwrbpNPcaWh
        X9A5qR8/YzaHFpT7BYqjtys=
X-Google-Smtp-Source: APXvYqzVxW20eNVZ9aiYI5P39LBGVZIhsGs+GUktDebjr7JOrRBt1iJHlF1C395ejIGm9PyahohwIg==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr4912501wmb.32.1579619480435;
        Tue, 21 Jan 2020 07:11:20 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v83sm4639782wmg.16.2020.01.21.07.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 07:11:19 -0800 (PST)
To:     dafna.hirschfeld@collabora.com
Cc:     airlied@linux.ie, dafna3@gmail.com, daniel@ffwll.ch,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ezequiel@collabora.com, heiko@sntech.de, helen.koike@collabora.com,
        hjc@rock-chips.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <573dc6d1-5857-f3ba-a392-67351db727b5@gmail.com>
Date:   Tue, 21 Jan 2020 16:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <6371f95f-8bf8-47c9-021e-b23006f25405@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dafna,


> 
> 
> On 21.01.20 15:03, Rob Herring wrote:
>> On Tue, Jan 21, 2020 at 6:35 AM Dafna Hirschfeld
>> <dafna.hirschfeld@collabora.com> wrote:
>>>
>>> convert the binding file rockchip-drm.txt to yaml format.
>>> This was tested and verified with:
>>> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>> 
>> Also, make sure just 'make dt_binding_check' passes as that checks the
>> example against all schemas.
> 
> But this also checks the other schemas in general, and when running it, 
> it fails because of bugs in other schemas.


> For example with arm=ARM I get:

Use:

# enable Rockchip arm in menuconfig
make ARCH=arm menuconfig

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

and not:
arm=ARM


> 
>    DTC     Documentation/devicetree/bindings/clock/qcom,gcc.example.dt.yaml
> Error: 
> Documentation/devicetree/bindings/clock/qcom,gcc.example.dts:111.28-29 
> syntax error
> FATAL ERROR: Unable to parse input tree
> 
> Dafna
> 
>> 
>>> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
>>>

