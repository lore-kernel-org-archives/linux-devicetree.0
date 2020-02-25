Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636BCC35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33CB020732
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582655487;
	bh=cvlleMILxfrIDkXIEvUhnuZbpZe6+/NnM/r6wEj3sVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YQ9UJdiJcggXGPGsyl4sRTAeQAHo+MSdygCAAftov4XeS+JAiYJQCTMUAAClvKVaN
	 9frLyhNqMlCjZR2DZQyv2wySjg8RUQYYOTWbCFAdGbN1uMH6ekSQMZpx5n+HoGeA4v
	 CkuYNHePy9+MtkoD7t3FotBxBY/Qv4mVMwR3jghc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731449AbgBYSb0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:31:26 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38101 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbgBYSb0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:31:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id r137so293492oie.5
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mF071uqYq+IBnnj/TupDNeQmYwHD8Ux7HxDE1nqu4I4=;
        b=J9cD6gkWwuR1kzLHByK8UvZnWtAIf7ebRVv41DxWY1diJ4N30dADFD9NnEWCHEBm50
         dR0Un+DDZfNj4vRIcNHfAUtr6Vl8Dn5S+iVIQ+zzf3ggUPXqWkxxGPLl0MdUHZoE8w3l
         MYGnYVk5lN3jeuVk91KiZisgYkRC3iMLzVVPYMScpa9PvWBDKEnIerF1JQmjhQsHVXcw
         0sSLmKMRHnZURAvv/Kq87/ShL0RwbQMcNZZwHb3NTYayCX7ChAwGL9vVUxk/Ravf7Fwj
         tGiuytvJKK6CU6pJeW0Lz4h1e6GKV+Xci5ys/1wkQIEtM5l1CuYmlWD7r9I3QMDYpeti
         NsUA==
X-Gm-Message-State: APjAAAV9mvYVXRF7OcPsm0p2TTjcfSkcUezrayt47izqu3EzWuRZbclC
        1En8vHzNE3pI9s6KX0bHoA==
X-Google-Smtp-Source: APXvYqwaauke2KbAeQ5bi9ntwobNE58vnjz82V2XZ78WRUDQpBblByrsUUcH1YTciMvenIIClEAyIw==
X-Received: by 2002:aca:ab52:: with SMTP id u79mr182330oie.145.1582655484692;
        Tue, 25 Feb 2020 10:31:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n2sm5450894oia.58.2020.02.25.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:31:24 -0800 (PST)
Received: (nullmailer pid 24745 invoked by uid 1000);
        Tue, 25 Feb 2020 18:31:23 -0000
Date:   Tue, 25 Feb 2020 12:31:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 3/5 v2] dt-bindings: arm: Add RealView YAML schema
Message-ID: <20200225183123.GA24686@bogus>
References: <20200225084627.24825-1-linus.walleij@linaro.org>
 <20200225084627.24825-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225084627.24825-3-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Feb 2020 09:46:25 +0100, Linus Walleij wrote:
> This implements the top-level schema for the ARM RealView
> platforms.
> 
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - No changes
> ---
>  .../devicetree/bindings/arm/arm,realview.yaml | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/arm,realview.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
