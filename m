Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555DAC2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3474A20575
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889296;
	bh=r5bxep+70BkfneNsoe72vhiyw0yImgYwUCOUG+u5LBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=oHc5jbWn72VYBnzvl79ajNm1gTfPkqukJ25YMR4h1TbW0PvlZIoVHJxLnKv+PV/n4
	 h1OhXg3M3pLKyFMFmqA0gP+hKf5oGlXIjdYlzThVIMj5CvGg8twSX8OGSjD7r0g1AZ
	 81W7FdCO/s+DVNeyk3QFosnLGjYi6aZwM0bOfqCM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503532AbgDNSez (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:34:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34124 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730984AbgDNSex (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:34:53 -0400
Received: by mail-ot1-f68.google.com with SMTP id m2so742792otr.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YaA1doZo6XeG3a/kjw3o15hxftnD9UG0Sj5L9mPEsis=;
        b=Yi9CmqSw38u0mXX8RofG4nrnBcKRV1vQCkooJrPWQv8ZHl10i+cf1Z4lxLLvbpoIQP
         Ubr6Th2SsDYYKVCLPKp2JdmA79G5B35ZLLQPVwE4f/zVXZrBztTODEu0TSO3TA+J6wst
         2YGy8ILpmJMSW1UDpEx4EN+s8nfz1FaOFFN2B1lz239lDwDYadz2XKrVP1tRAySLzJUM
         tre1AYkyO8vGWCvvEkZziDV3PaRqXJ39ruY/HXSz1zSXkgUvE3qo99D8PWezr+dDa+K6
         hOoNo6KQl5fvb03hU7+1nT3P6d4tlbGP6O4tFXfWHRqCV2d4rF0KQoj2foReoCnbqC9D
         uF8w==
X-Gm-Message-State: AGi0PuYSgovdfe1LYg+Xor71euxZ9yXvnq9Tz0irhNnYiH5CVemz8k3s
        RAkuK0eI/tJLeco10fYp5A==
X-Google-Smtp-Source: APiQypL6Fe1HDUNpz669SwTSzUB6G9QhuQv7sSJxBX3BK1gqEAGSUwypmrn/VxXVGSXj6DK5rQU7Hw==
X-Received: by 2002:a4a:a126:: with SMTP id i38mr19808895ool.11.1586889292391;
        Tue, 14 Apr 2020 11:34:52 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c15sm6341423oot.23.2020.04.14.11.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:34:51 -0700 (PDT)
Received: (nullmailer pid 10111 invoked by uid 1000);
        Tue, 14 Apr 2020 18:34:51 -0000
Date:   Tue, 14 Apr 2020 13:34:51 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Heiko Schocher <hs@denx.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2 16/36] dt-bindings: display: convert lg,lg4573 to DT
 Schema
Message-ID: <20200414183450.GA10047@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-17-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:49 +0200, Sam Ravnborg wrote:
> v2:
>   - Dropped spi-slave (Maxime)
>   - Added unevaluatedProperties (Maxime)
>   - Deleted needless compatible from example (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Heiko Schocher <hs@denx.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Schocher <hs@denx.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/lg,lg4573.txt      | 19 --------
>  .../bindings/display/panel/lg,lg4573.yaml     | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lg4573.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
