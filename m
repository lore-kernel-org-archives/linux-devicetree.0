Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552A3C33CA1
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1FEAA2070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578501727;
	bh=RnoomfQqdyWrpRTnoPHfF+D9AQEynoANXYRrSNq5Bkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CMeADFuXGdcfcLR783Jl30E31HAIEvO0kyLUozs7BUWxHhZ7zrY2kDv5m5yCNTjq4
	 LgU/NzDEHsTjGJwNzN11FoZE8ozhTxEG+MoVGvggumJ+dzIaXXa46uqHVUg36xdnic
	 k4uDziJQ/x6or+DJK1pKfJ3BOw/zf6z+SKGSRS6M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgAHQmG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:42:06 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37493 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbgAHQmF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:42:05 -0500
Received: by mail-ot1-f67.google.com with SMTP id k14so4193806otn.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Icg47JqvHN2zEf9dLVseBc9ilOfxDem/7KAl7G0secI=;
        b=ghbCVho4QiuCo17BavMSRmMMqjrEg6I8l35ifwQUao6RjIvv+xCZZV1znYqwSXz/pQ
         +Pzf52TnXmDEtTKSoPaF36qAC+CoJpUQXA4ee7W2kyYuDKqAhorPF1rKVBEqALw6nGxC
         wIvmsxaIhQXoR65LBV9SO6eHrYRgrHnx50iJgw4vExfWd4FMpCEO2ZyUEYaw4SBSaWR7
         KVXCG2GTp6wbvUALh877Gm4XJ+v+4et3WvTtc7JZFZvx7vWGy1t4hQJ/SHdHUyL7dnZY
         AIJeqqnvMP51PWIhorRrhGsjkF3MB7F9+NwzCb/8SAptHT/ah6BK7rkiX6DH/AWJS83f
         taDw==
X-Gm-Message-State: APjAAAWUHyKrKYU7YVMrIAJm8Rq+w5kQCi0OTZLIiCZyR7efc5eQJOpM
        +u0f5T3yasJsBjIHNqVkgbor2rg=
X-Google-Smtp-Source: APXvYqzjgCmv/AAylvSHOMgkZIHhyltlV9BCzz+esA07egZfDtuDRTxmNp3DsB7u5pZFXpJeGRZa5w==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr5034460otm.58.1578501724176;
        Wed, 08 Jan 2020 08:42:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o101sm1271382ota.69.2020.01.08.08.42.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:42:03 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:42:02 -0600
Date:   Wed, 8 Jan 2020 10:42:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mohana Datta Yelugoti <ymdatta.work@gmail.com>
Cc:     jacek.anaszewski@gmail.com, trivial@kernel.org,
        Mohana Datta Yelugoti <ymdatta.work@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: spi-ir-led: fix spelling mistake
 "balue"->"value"
Message-ID: <20200108164202.GA15850@bogus>
References: <20191225205941.28429-1-ymdatta.work@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191225205941.28429-1-ymdatta.work@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 26 Dec 2019 02:29:39 +0530, Mohana Datta Yelugoti wrote:
> There is a spelling mistake in:
>       Documentation/bindings/leds/irled/spi-ir-led.txt.
> Fix it.
> 
> Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
