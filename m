Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7775C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 16:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9BDA82087F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580141615;
	bh=NFS9ZoHIlcxEBf2MRkZeAsVFNESspF+tgLB7tkxfA6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=X5p8S42Z2ffwMTpEXIPkyA0b1qKTJfwh5e+TVqm53Czs9YFQiLkIn49F0YVwP0IkP
	 vEZ4v0Anp4bdhoeGGS2tKIJs2UcGOuPCSqXEnSN0Q6bbzsWeXGkK6sMkKvIJu+WOU7
	 welViTwVx8AfUHJsN+8/O2I1gfpn4OVXhkZ5+szo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgA0QNf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 11:13:35 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41611 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729470AbgA0QNe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 11:13:34 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so8867161otc.8
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 08:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JNhU3ozUFErUx+4UTT5ltSBuP2mFt3zi7r84jg0CNoc=;
        b=m6+R85q2nlTWzqIVjeuiXaK/xkwOD5HZdvvL3zM5aBc5LK0SB1Czs9A1dF4XBeh5CA
         J9EhgZiNiMKx5IhkBXNJpzDqioRq9alBFKJxoXei3i6bCxMYR9amkA+YMcZ5TxFZf6wx
         2/ZqMjJSjpJjJG6mQ6ZAV0a4ecCoYijO6cFNti1FyysonE0/T4UJ6VJdeQaMmFNCZBN1
         VNO/kUEGPDjyD8zX3Ff1AnD9KOwGSRzJOemmRhxqzR3rQu58GRdhLzfFqqol6kGEVEiN
         6loblfPPkTgwzV5dK3m9veVIULPcOSMIjAFy0qO8aMdRkllmV3C8yc71M06c7kHk7bmX
         x84w==
X-Gm-Message-State: APjAAAU44WK7jRq9ugOzeMrtvDjXt1LmxvSAaaono1f2ZnhHW05YktDV
        5VGZYlAbNSYWRh9KNdDLgg==
X-Google-Smtp-Source: APXvYqx+crNryziVOs9TPZ584wS5oJiSpLsXp+K6NXnR1XqPGiQwSyxOkcd4SFNU/i5Tt2bP+RwJrw==
X-Received: by 2002:a9d:7305:: with SMTP id e5mr12473441otk.64.1580141613803;
        Mon, 27 Jan 2020 08:13:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e6sm5649617otl.12.2020.01.27.08.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 08:13:33 -0800 (PST)
Received: (nullmailer pid 20252 invoked by uid 1000);
        Mon, 27 Jan 2020 16:13:31 -0000
Date:   Mon, 27 Jan 2020 10:13:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, hjc@rock-chips.com,
        heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com
Subject: Re: [PATCH v3] dt-bindings: convert rockchip-drm.txt to
 rockchip-drm.yaml
Message-ID: <20200127161331.GA20191@bogus>
References: <20200121154314.3444-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121154314.3444-1-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Jan 2020 16:43:14 +0100, Dafna Hirschfeld wrote:
> convert the binding file rockchip-drm.txt to yaml format.
> This was tested and verified on ARM and ARM64 with:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> the detail of the ARM tests:
> export ARCH=arm KBUILD_OUTPUT=../kbuild/arm-test-dtc/ CROSS_COMPILE=arm-linux-gnueabi-
> make menuconfig # set rockchip system
> make clean
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> the detail of the ARM64 tests:
> export ARCH=arm64 KBUILD_OUTPUT=../kbuild/arm64-test-dtc/ CROSS_COMPILE=aarch64-linux-gnu-
> make menuconfig # set rockchip system
> make clean
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 
> 
> Changes since v1:
> - fixed worng sign-off
> - fixed the path of the $id property to be the path of the yaml file
> Changes since v2:
> - add a missing ">" sign in maintainers list
> - change the licens to GPL-2.0-only
> - add "additionalProperties: false"
> - change the commit message to conform that it was tested on both ARM and ARM64
> 
> 
>  .../display/rockchip/rockchip-drm.txt         | 19 ---------
>  .../display/rockchip/rockchip-drm.yaml        | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-drm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
