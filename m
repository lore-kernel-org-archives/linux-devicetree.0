Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E82AC433E4
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 03:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DE03207BB
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 03:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594695922;
	bh=UQaR61ef5609DeMXEyd/UBklNYCosfPofUB6vOcDTDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=pPOh+3qah1nHd1cnoGHmCyX/U21PoxR4c9nPju96+XJYIigAtsBqqqsvIDnGtFXlN
	 gU8S+RLGGkA3DiDbJq0iWCqPlc3nrJx6Xem0Nyw8FZNahgigltQ/s0weWJKxyQI8yQ
	 occ7gBaZqEdNU0pw8v6mKpRa+1ruGoA0ESr2PRuc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgGNDFU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 23:05:20 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:42603 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgGNDFT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 23:05:19 -0400
Received: by mail-il1-f193.google.com with SMTP id t27so13021149ill.9;
        Mon, 13 Jul 2020 20:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F4cMDTYNUb4VJ3F8Lt11u7vNETjB97DZgQdvKOq3BPw=;
        b=N89SiEW6JljhmhIju8Ddq338C4muAyWQBogZZoPnUj+C7Lgs0yvy2KpNGmTN9INiNb
         0pngbvjDluDIDkLHYoRtdgtzTqTBus+Du8EHIQ+XfjB438QbpoofCQGIQREamF2cCtt5
         zy7Htvp/SbjNEStUt5tvfY9pQ5PVoxd21fnbVd468MeE7ZcYsbzRnsWmoZH8tGkfAF3q
         GpGU2SY3ctPaRvpGlAb9HzAO4byi/S3vC3JNw0CQcImJKqjjUX3BBB232LSGsNKu2cUL
         JQLDwQEj9ZRu5OYNrEQcUt06uXgRC2v+mCCaZ+6M0dbw+Z3jRualHzxdLi6pN1fM+JYk
         x12Q==
X-Gm-Message-State: AOAM531RRqs2xXI9EYQR5EfwUmZ/5clHhbnT+lgAXV/p/SfxIY8aghaT
        92KmfDOjrVimLdi8ipIzIQ==
X-Google-Smtp-Source: ABdhPJylOG8xyOCK5MSGoWgc/G6Qnyl+MAEPvvF6mluanAl9FhRmcSOm1wJ05+LdPSMSqM+inMdOXQ==
X-Received: by 2002:a05:6e02:d51:: with SMTP id h17mr2926866ilj.131.1594695918670;
        Mon, 13 Jul 2020 20:05:18 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z78sm9897815ilk.72.2020.07.13.20.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 20:05:17 -0700 (PDT)
Received: (nullmailer pid 1209067 invoked by uid 1000);
        Tue, 14 Jul 2020 03:05:16 -0000
Date:   Mon, 13 Jul 2020 21:05:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Philippe Schenker <philippe.schenker@toradex.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Dan Murphy <dmurphy@ti.com>, linux-renesas-soc@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 7/7] dt-bindings: net: renesas,etheravb: Convert to
 json-schema
Message-ID: <20200714030516.GA1209018@bogus>
References: <20200706143529.18306-1-geert+renesas@glider.be>
 <20200706143529.18306-8-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706143529.18306-8-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 06 Jul 2020 16:35:29 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Ethernet AVB (EthernetAVB-IF) Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Update the example to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Replace "renesas,[rt]xc-delay-ps" by "[rt]x-internal-delay-ps", for
>     which the base definition is imported from ethernet-controller.yaml.
> ---
>  .../bindings/net/renesas,etheravb.yaml        | 261 ++++++++++++++++++
>  .../devicetree/bindings/net/renesas,ravb.txt  | 137 ---------
>  2 files changed, 261 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/renesas,etheravb.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/renesas,ravb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
