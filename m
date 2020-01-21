Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADF7C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 13:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E73021569
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 13:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwdomRqh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgAUNLI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 08:11:08 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36216 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUNLI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 08:11:08 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so3149074wru.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jan 2020 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mhGneesRMqca+G49CZkv9yFBdFGx22i2fZyrgZ2cdGw=;
        b=RwdomRqhuMOj43ismwGzp1Fn9myxOX4PmSiivmXLjE759KnCPFdq6kSqbtUq4Gb1AV
         LRL36IqyVwak5YFseCmqvX1cXovudgDifBWbdGBXO2YLke3b0GYT4zp8gEsBw6QpUfJ/
         DlMozGPqDqQ+MaMKCcTQEbZNYQzlN5/CgjtFvuxYmE8bC09gaNISw6vxB+5tVBqE8mjl
         SQtzYLvvE4H3yCHZaX6SrOVQJMN38MN56JqjVT68LiNpghq6pn0ld7PIIK9pnNyTVRgY
         gfsMi+JTRAwXAPvAwE30zKb5MpaT8pzvRO+ZglfQ1Xua3J4xULANYKk11lL2b9TOzFqb
         vqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mhGneesRMqca+G49CZkv9yFBdFGx22i2fZyrgZ2cdGw=;
        b=RK2ZeuU1sTk2sryAc5BDwpFGg4fJWCBbI4g1u9/30Wl31LOplOs52KlTK6x2mCzC+s
         3Xv14o98ckDeHKPmr4i1NVq2dGAhsw1nJaDgiwqPsbdMRTTN7JuvUTAm2apIGYMxdhuq
         rZmCZoQajyWpFhUwReTIa6xQ9PPxXZdLqJsE2yjcuaL5cdZrOiYIcpDoEmZHKIijnfmh
         YHCmMvwjFDDwhjMh519T+qHWHhNaQejVS+n70wBKaTZh1nToMKweUihu26aBk0nKzsGi
         zZ27qSal3NpMw2wIvGFy8aekhfAs6uLFmndX6cm7O6/6J1CgTPU8Xf841M21WoE93m3H
         kH6A==
X-Gm-Message-State: APjAAAVE6v8xG/zyQ7AZMexX50KPaOKh42yNySotSOgojrLfczANQCTh
        exw/7LHu1cNZLCecOPwBrNE=
X-Google-Smtp-Source: APXvYqy7hlBDQUa9WHN965x6FyXWEPReEs8xegXUSVTD5onpjUdQNV4o3/tnfrFGE4I4NWSoKssCgw==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr5353879wrr.252.1579612265353;
        Tue, 21 Jan 2020 05:11:05 -0800 (PST)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id c17sm52327271wrr.87.2020.01.21.05.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2020 05:11:04 -0800 (PST)
To:     dafna.hirschfeld@collabora.com
Cc:     airlied@linux.ie, dafna3@gmail.com, daniel@ffwll.ch,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ezequiel@collabora.com, heiko@sntech.de, helen.koike@collabora.com,
        hjc@rock-chips.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, mark.rutland@arm.com,
        robh+dt@kernel.org
References: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v2] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <dccee12a-71cd-efac-02ca-3668d10434c7@gmail.com>
Date:   Tue, 21 Jan 2020 14:11:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200121123445.29774-1-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Dafna,

You are checking at the wrong platforms.
Maintainers incomplete. ">" is missing.
Recheck please.

Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml:
ignoring, error in schema: maintainers: 0

make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi- menuconfig
# change in menuconfig to Rockchip system

make ARCH=arm dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

make ARCH=arm64 defconfig

make ARCH=arm64 menuconfig
# change in menuconfig to Rockchip platform

make ARCH=arm64 dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml

> From: Dafna Hirschfeld <dafna.hirschfeld at gmail.com>
> 
> convert the binding file rockchip-drm.txt to yaml format.
> This was tested and verified with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld at gmail.com>
> ---
>  .../display/rockchip/rockchip-drm.txt         | 19 ----------
>  .../display/rockchip/rockchip-drm.yaml        | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
> deleted file mode 100644
> index 5707af89319d..000000000000
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Rockchip DRM master device
> -================================
> -
> -The Rockchip DRM master device is a virtual device needed to list all
> -vop devices or other display interface nodes that comprise the
> -graphics subsystem.
> -
> -Required properties:
> -- compatible: Should be "rockchip,display-subsystem"
> -- ports: Should contain a list of phandles pointing to display interface port
> -  of vop devices. vop definitions as defined in
> -  Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> -
> -example:
> -
> -display-subsystem {
> -	compatible = "rockchip,display-subsystem";
> -	ports = <&vopl_out>, <&vopb_out>;
> -};
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> new file mode 100644
> index 000000000000..e4ef1a02196d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rockchip-drm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip DRM master device
> +
> +maintainers:

> +  - Sandy Huang <hjc at rock-chips.com

Add extra ">"

> +  - Heiko Stuebner <heiko at sntech.de>
> +
> +description: |
> +  The Rockchip DRM master device is a virtual device needed to list all
> +  vop devices or other display interface nodes that comprise the
> +  graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: rockchip,display-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Should contain a list of phandles pointing to display interface port
> +      of vop devices. vop definitions as defined in
> +      Documentation/devicetree/bindings/display/rockchip/rockchip-vop.txt
> +
> +required:
> +  - compatible
> +  - ports
> +
> +examples:
> +  - |
> +    display-subsystem {
> +        compatible = "rockchip,display-subsystem";
> +        ports = <&vopl_out>, <&vopb_out>;
> +    };
> -- 
> 2.17.1

