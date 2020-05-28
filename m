Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F86C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 097F920663
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 21:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590700290;
	bh=gxq8JI/sf5zV+V4EF/lqVTGBp0IAbBMCYTYeHkJUKQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qRXUYUmGRsK7EEhYII8XT4OaOtCcCpG0tugJrQdNX/qCyhsjk6oOqikOMf1mFWFC7
	 dnCfa5WXT1NKBFJn6TWYBFn6fVCt4db1Ms9o3amXmYKltJ7uZVXdljpUmkpKXU3ueT
	 Inm0TN3wo0P1VXm8HuuSXvDTn/ZQLX/Sqpwswpj4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407515AbgE1VL1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 17:11:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43045 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407473AbgE1VL0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 17:11:26 -0400
Received: by mail-io1-f68.google.com with SMTP id h10so2955iob.10;
        Thu, 28 May 2020 14:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZljoY+8IjPv0JWlK96jdn/1/iYk5qkwoS6MGBAeVyVk=;
        b=G0H9OJadGtF9Lnb9Vd2+vkyaffeWkoewlCX1fxdGqPsy+oc7XHhInC+95Bf2FdfKSo
         H9p8yGBqTokW3J8mStZWdyG+vasBiz/HP64E7mmWweJaFRSw5vE+pSLd4O34WGfeGWsZ
         /J/Pyw6YzIPXOTDROgV8oI/ufLLc1TA772QujYTU7lWzz+6knBv5T83PuKMqf9Ij12Z+
         Ml4Z2mn0PHERehV8TXYARHTalGEOr30D6MQAVmzP4PGIzY0VCVxwflv+xNKXUBvkS6hr
         a1cCaK/c5dKB3fzZD+ialouvagm5/ufsJOSWEwlGchYlSwOe4S+GehDAscTtjbjmePz7
         s5Aw==
X-Gm-Message-State: AOAM530zkRvqb5e7kSivJ1keXHBN8cXbavRrb4LJCHA7v5hAxOoFNpFx
        h+K8Y1gLymXIa/+oJ8sU2w==
X-Google-Smtp-Source: ABdhPJyCzXKGTp0uyCTgS3NFQU8mXyp4KovEXn1gidoZ3G38TdFavgHvl9TVte0bQrmqnL6NMpRvVA==
X-Received: by 2002:a6b:ab03:: with SMTP id u3mr3930793ioe.148.1590700285450;
        Thu, 28 May 2020 14:11:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o15sm3708913ilg.46.2020.05.28.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:11:25 -0700 (PDT)
Received: (nullmailer pid 691975 invoked by uid 1000);
        Thu, 28 May 2020 21:11:24 -0000
Date:   Thu, 28 May 2020 15:11:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: Convert
 to json-schema
Message-ID: <20200528211124.GA691918@bogus>
References: <20200519080812.28632-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519080812.28632-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 19 May 2020 10:08:12 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas DDR Bus Controller Device Tree binding documentation
> to json-schema.
> 
> Drop referrals to driver behavior.
> Make power-domains required, as it is present for all current users.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../memory-controllers/renesas,dbsc.txt       | 44 ---------------
>  .../memory-controllers/renesas,dbsc.yaml      | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 44 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
> 

Applied, thanks!
