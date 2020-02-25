Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2F8C35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:41:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D5DE2084E
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582656082;
	bh=gVL7lXGmPDvsK/I/L9xuCf2g+XWyjfZiCeZCZE73N9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GUMhwKCAgq6YEjdQMqZ0RpodNGZvg2whzpmJww90AJqRZW4/ZjwrHaqRDb3ipEsh2
	 YDTwq6KQANfHGXnCnjhdAh+QdbQ0Nfm6GGT8TGkoAbzHdM+zwXOdFCgK8woQjSs6gt
	 MQCd/y+cd62yHzztSk+LV+ki2bZgqlAVS9hSvhCQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731540AbgBYSlW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:41:22 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34572 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731502AbgBYSlW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:41:22 -0500
Received: by mail-oi1-f193.google.com with SMTP id l136so350545oig.1
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:41:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q7gSziq39O15gbU+LLHbmRRsWTpvZxLiUtiNU4HiD4A=;
        b=PCSxGCG9zztSHBUdpBQRUTWYBW34cNhUoEMTkK1e4ge8A4dvg8Y3aZqtBa2qZs3Qfp
         ehqEpEKzmAmq57M/IDbCitvLWqp7ZGYpbucXW6bM0zhByxolUvJrcLhRFVrJESvoKJ6M
         pgmZfqdiT4sqjs+wdHN6yZS63zFpHqIdIdyQQR/R9IWdtOgZ+AWe6wiQoZ/JViNXOgDv
         Ni78iOCVAc4mk4OpFtzTg1kJ5m/NglckpWZ62fLooIa0rPa8GMERETRdYVZ4OPefvH3m
         C7XLfVxyxiHXYj8r0GYV9r49O/IPY0EaH7cusHr5YblvXH3NWgdYS1X3OdhQ/WmI/0wL
         GtIw==
X-Gm-Message-State: APjAAAWbesxbtmH06UZk3qbqm/5GQBmwj5TaXM4UgSyxpLiEqW5OTa/4
        /3oHVKRtWX7z6HQEn81hWg==
X-Google-Smtp-Source: APXvYqx6QBx46N6X56oueBwWqp4ljt2FDXmqE5r66idljF8kbDTs0PMVMLfSpKx83WU/+RwGR4tmXw==
X-Received: by 2002:a05:6808:7c7:: with SMTP id f7mr267932oij.58.1582656081112;
        Tue, 25 Feb 2020 10:41:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm5594713oib.42.2020.02.25.10.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:41:20 -0800 (PST)
Received: (nullmailer pid 6362 invoked by uid 1000);
        Tue, 25 Feb 2020 18:41:20 -0000
Date:   Tue, 25 Feb 2020 12:41:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 5/5 v2] dt-bindings: arm: Drop the non-YAML bindings
Message-ID: <20200225184120.GA6306@bogus>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
 <20200225084627.24825-5-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225084627.24825-5-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Feb 2020 09:46:27 +0100, Linus Walleij wrote:
> We created new bindings for the ARM Board using YAML
> so delete the old human-parseable-only bindings.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - No changes
> ---
>  .../devicetree/bindings/arm/arm-boards        | 237 ------------------
>  .../devicetree/bindings/arm/vexpress.txt      | 229 -----------------
>  2 files changed, 466 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/arm-boards
>  delete mode 100644 Documentation/devicetree/bindings/arm/vexpress.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
