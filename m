Return-Path: <SRS0=mbMJ=64=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B29AC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 15:08:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 394C6206A5
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 May 2020 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589468910;
	bh=48I96bMQ1CEeb7oxxjCuOFlFMAEbO4NxGW7b5X6/HYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=y/K9AGY5sB0SW5fLH1BYTvVixTuAmGQPY3tGa9V+ciwcyRPV7st55QOSAXfseTiVK
	 PvpXKeoBDgF8zuvHXlOL9+Umms2JYqN6MzNCD0nQI0Kqmy/aVyIwXj5BNCW0h4S8pU
	 gA0CubW9Kyktd6sr3GbyPwGZlkQK6SPmRupLMTEE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgENPI3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 11:08:29 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36743 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgENPI3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 May 2020 11:08:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id x7so23890822oic.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 08:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z78zI7ZbyVskAgWCc1NqF/JnuqHwotn4rURhcKPHKm8=;
        b=im6T8Natc56LR63GRBJgNKWpKQtXYvCbLnDB2aWyBPV+luv4OMfE9nabAXAaPuqrcD
         48iLKrxj/C2UZ981aN1YYmTbJ4a4dhsJ6pI60Q1Xd9gpZpCQE2938fsUi5BEKUHwW9q3
         mbGGasQXbd8QuaLIwkzy5GXUxhunJLastgloT3Zz6x4k3tEL1meeueTcjYlJEVG5wotB
         dAWZZa+2SrGzRn82KExx/H4c6HnHHHBLOMbgokWEYzpXtGV1UEqeyck9vVJh4nQMXs26
         Ma6JG+6jOm8XWm4eiOZrVXOR8ww98JoI3OF+/b2keGUm7TV+4jSB6nUZEBzBpEipm+iS
         j/Rw==
X-Gm-Message-State: AOAM53284t+0ziXvC+i3KBtFMn5Q9nt9iR4dj9UoGB8g2lZCloScXjFZ
        u9vpnKC1+KhjEz6LWeWkaw==
X-Google-Smtp-Source: ABdhPJz7ekl6VwtUgZBoNPiDa7Tm0U7cB71ZTwaPGr/qw2e4m8JJLosEG/FZLKTP3dZtRI4GRHFX1A==
X-Received: by 2002:aca:5243:: with SMTP id g64mr1438425oib.90.1589468908927;
        Thu, 14 May 2020 08:08:28 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h9sm840838oor.21.2020.05.14.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 08:08:27 -0700 (PDT)
Received: (nullmailer pid 27316 invoked by uid 1000);
        Thu, 14 May 2020 15:08:27 -0000
Date:   Thu, 14 May 2020 10:08:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org,
        andre.przywara@arm.com, linux-actions@lists.infradead.org,
        robh+dt@kernel.org, cristian.ciocaltea@gmail.com,
        linux-arm-kernel@lists.infradead.org, afaerber@suse.de
Subject: Re: [PATCH RFC 6/8] dt-bindings: reset: s700: Add binding constants
 for mmc
Message-ID: <20200514150827.GA27226@bogus>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
 <1588761371-9078-7-git-send-email-amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588761371-9078-7-git-send-email-amittomer25@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  6 May 2020 16:06:08 +0530, Amit Singh Tomar wrote:
> This commit adds device tree binding reset constants for mmc controller
> present on Actions S700 Soc.
> 
> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
> ---
>  include/dt-bindings/reset/actions,s700-reset.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
