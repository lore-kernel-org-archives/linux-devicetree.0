Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C56DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 10:04:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D62C20772
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 10:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq5umJlQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgGHKEJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 06:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgGHKEJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 06:04:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DAEC08C5DC;
        Wed,  8 Jul 2020 03:04:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so53414857ljv.5;
        Wed, 08 Jul 2020 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p3PCjrGEb1SE194xmBZMMpyZF/VWXlP8HwS7wSkYeao=;
        b=iq5umJlQKHxHV8mj42vsFJN601icTnUbn8VZKWxj+YDKQvvRjjc7MUWrZdazVUaibX
         uttIPbfWha4Or0td23k8ubJvqmCKbe5Ne+uElkx03tfgnS6tfiPnwqYfQg1D2zcI1rcm
         VlzTPSnmOR3vXg7S/Xp5saWOfIKEA5VykReOr17kFxubEtJ9g9qHeX/wHh2lWz2+pWtc
         s40KiZQxdV49k65Qb+Uvr16bAUdUHywnVQHzEq5RDXlZW3LnrmThwrsx3DB4wbyPlrYf
         yWEfLRRqe3yx7idiWOOhE8Hh4jANKnReiCela+nDk3D8aUraVAFaQGtOoPXx0Yvzfi9c
         GEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=p3PCjrGEb1SE194xmBZMMpyZF/VWXlP8HwS7wSkYeao=;
        b=jwQnhmTKqHujAwmX0nsaYiqCCjU3UCLHODwoAUAa/oRZeGrmf1uu+ZJfCS+O7z/SQ2
         ogKk33QLkhNpJf0YSf5cgs1VyyXjLvUTO/n/aB9n98UI1jP6CIhvSU5VU4NcsMktHMBA
         FlA36hd1WGIvSdxMNkkAypJOcMpPcVU8bXNUOls5AZ9whDN9OId2+Pm3F8ZhLsFkZnWP
         f6Uk2c3uXHcOTejg976QKkjPnUnZprXz/4a/VpcZi7gIEGYdlXhg93SWnyZALeEfMDyD
         Y06Eeo71XR8tAIkaoB7NzRNCWlAJ25VyLzFLnOL5zbYJxLYz7MNqM2OnbJaQuVwfGbpv
         u9dQ==
X-Gm-Message-State: AOAM532K+z7bjpC6ZaXxAJ/otQueiOrBvyftGclHBuufP2qnQTYL5Uui
        qz6pBeGh6Q6FkMccIKaVaAPhErvv7gc=
X-Google-Smtp-Source: ABdhPJywUWrfVESenofUIgF5HgLJ7shdt3nonV/r6qE8P2qbwijrzP46EPqHorRfqikaoUieU3DVxw==
X-Received: by 2002:a2e:a484:: with SMTP id h4mr33520517lji.468.1594202646990;
        Wed, 08 Jul 2020 03:04:06 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4297:b781:8ad:e985:513e:5609? ([2a00:1fa0:4297:b781:8ad:e985:513e:5609])
        by smtp.gmail.com with ESMTPSA id n4sm10209645lfl.40.2020.07.08.03.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 03:04:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] dt-bindings: net: renesas,ravb: Document internal
 clock delay properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200706143529.18306-1-geert+renesas@glider.be>
 <20200706143529.18306-3-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <df4affe7-922c-968d-6aa9-b92072aade4f@gmail.com>
Date:   Wed, 8 Jul 2020 13:03:58 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706143529.18306-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

On 06.07.2020 17:35, Geert Uytterhoeven wrote:

> Some EtherAVB variants support internal clock delay configuration, which
> can add larger delays than the delays that are typically supported by
> the PHY (using an "rgmii-*id" PHY mode, and/or "[rt]xc-skew-ps"
> properties).
> 
> Add properties for configuring the internal MAC delays.
> These properties are mandatory, even when specified as zero, to
> distinguish between old and new DTBs.
> 
> Update the (bogus) example accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
