Return-Path: <SRS0=49W1=4N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF2FC35E01
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:11:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D26F620CC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Feb 2020 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582654313;
	bh=sGHqlcYOl3EldWYVvF0lXf1vB1m7xedTjOc2qgQXYmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=mwAmHi/mAWbG6q/ZWz18rJ4BSC/2Yg0IinLPuKt8fiS4rg3HS5w7pbW3JOVM5LrJY
	 Kx3FuY3JvOa2pAUSBSP0y1AmiqfiqSqpw7E1CioOv8uKKnsbw6fHvZf2N6rJ9xggZH
	 w5cSXWp25Vwm1ez3qy51N2/evFMlYqHCqJp6FZB4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbgBYSLx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Feb 2020 13:11:53 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46034 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbgBYSLx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Feb 2020 13:11:53 -0500
Received: by mail-ot1-f68.google.com with SMTP id 59so354815otp.12
        for <devicetree@vger.kernel.org>; Tue, 25 Feb 2020 10:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UrnALHtlDEqFTXIUDbXk3KceoADMu/thuZsi/4q8zwI=;
        b=V8llg593pt1pSiVn1MMYRG4F8joA81/xI2LBFJeuNXRfIzoBJF0HzNoO2kEk3d+eps
         YoJCEi2NqpXIBFi9fEWt7fhqgD43BwuRgg3joFUi97dNy2H90KCnpaPPNMc83hGrDmr1
         46pxGRejK1BaBhBqQGoiV7PoZDtxCN64I9aq5+Z2i5d97NnauRpUJG/1/Bvtqechy/O6
         wlxhDRYTEW9DUDiSq/iSw7Y2v3zp8DJWoY1AZn/k/w+KsoQvG4NALk3cMoRzTLxHr4iZ
         nQ/HWCtX7OVsFYdwHYve20Wpm/U11HkNjTDyiTiERcEctUobVBZ/57EQjcH3GVPQ3W5F
         EedA==
X-Gm-Message-State: APjAAAUYaWyctgs1OXhAjEClMUTCefgwrkFPDjsVkI15hbPhP991wAO9
        eil1Mmwty3eIwIu8oEZyJA==
X-Google-Smtp-Source: APXvYqzyFO1ShWEDFoKd1t5wCvom/ANQ8PxbXA4NrIRJbZXlbnjudZWkRF22V9hDbNbZ1b7itBeVOg==
X-Received: by 2002:a05:6830:4a4:: with SMTP id l4mr46001282otd.91.1582654310875;
        Tue, 25 Feb 2020 10:11:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n25sm5527623oic.6.2020.02.25.10.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:11:49 -0800 (PST)
Received: (nullmailer pid 28247 invoked by uid 1000);
        Tue, 25 Feb 2020 18:11:48 -0000
Date:   Tue, 25 Feb 2020 12:11:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/3 v2] dt-bindings: Add vendor prefix for Hydis
 technologies
Message-ID: <20200225181148.GA28196@bogus>
References: <20200223121841.26836-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223121841.26836-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 23 Feb 2020 13:18:39 +0100, Linus Walleij wrote:
> This vendor has produced a number of display panels,
> including HVA40WV1.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - New patch adding this vendor.
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
