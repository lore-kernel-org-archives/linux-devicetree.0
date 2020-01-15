Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCF1C33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D95C824679
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579101585;
	bh=PnzcP27LfYCVzByWbD2VDd/+SERrtyi5cqWlfzgqPa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FIasnGxFdqDIAKTYdIMbTjTNr95+zG0Y0czMI/RLyi3XZzZsHllhbRyub2pSbZQtK
	 6WFnSFiskpYaCDNz/yBOMSPk10apGTqeRkYh4fK9khpp9B3ZBL1+aKqTFfZaUtQCpQ
	 1y2RCYaM4dWlo2boKX5vQk+nJ/LnVft5NZVOhGYM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729091AbgAOPTo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 10:19:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37015 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgAOPTo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 10:19:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so16425534otn.4
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 07:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eb54G3sc1CCAx4sR/HWrdZKKEAIXwHpDF1vWmKUoplc=;
        b=UtbiC1R0LOiLeI9f9zVrT/7KsmMw/B+vm6JDrr4ldd4gnbUnkxDwQUtxAtIoKpc5wj
         8iY9CAKCt57g6kJ6QNdGwC5C1i5umJXCJcEYUqmiENFiZfBHnOxjsOQImjtvDdznEIRI
         j6IXEVB8MtcQ3CTkIMK4WvmJEm1Hl3s5SXO7kG9JvE1f/6R0G+lng0aWG8M87F6m4zDi
         L+RxkxS6gLHsHmrv7erjkkE9EZhTakV4wELhM+qkhFOPAAinjM5cSSWvOQMGmmRHzIxi
         Oas/fv1VaYWG+pG4csI04BAZlNJT2metch9Tu6YKIa9uy4c7aCg8IhhH2jBtJF0IFptk
         1agA==
X-Gm-Message-State: APjAAAWur/2iX7oe1rCt2j7j9O8QHSmLObT/UKR0XkhqA3nfI5vm+oZK
        yCkU/O5X8UQUkr0f7uYEp4UHRac=
X-Google-Smtp-Source: APXvYqwjJmH99IZmV74zd7SNNO4Eop/55jydbTyKm41kTRRGZqhCjpM9JgYAqEdOY+zOprwaTO9sZQ==
X-Received: by 2002:a05:6830:1bd5:: with SMTP id v21mr3288327ota.154.1579101582968;
        Wed, 15 Jan 2020 07:19:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t23sm5750777oic.28.2020.01.15.07.19.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 07:19:40 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 09:19:38 -0600
Date:   Wed, 15 Jan 2020 09:19:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     matthias.bgg@kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: Add MT6397 Pin Controller
Message-ID: <20200115151938.GA8182@bogus>
References: <20200110145952.9720-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110145952.9720-1-matthias.bgg@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 15:59:51 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The MT6397 mfd includes a pin controller. Add binding
> a description for it.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> ---
> 
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
