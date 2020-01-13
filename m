Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A149C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:44:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 384E62080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578959076;
	bh=dIlRjkZT12r2wfmOAPqexEVN/cHWXJ59S3jB6BaD6jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=YmRLQvmjIzqFfRExJpSMIg5EsZnEeyTwPqLuqVSNswrg/i/qY+7uSVLKxq/EK+Y4q
	 JpeWGfcobmJaFuKrER1tBFBWrhqLGCSggPcPM1QM3mKNqvQ3nUkliUnBGZRUnN5/Ex
	 aPI2u5+z0f1Me9ehkQ4tXTWZQC0pNISMI4h7r5vo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgAMXof (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:44:35 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38124 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728794AbgAMXof (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:44:35 -0500
Received: by mail-oi1-f195.google.com with SMTP id l9so10077326oii.5
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7d1TijNzzm5olBqQ6BOPTTjVLO96fK38vWoVBLQU76w=;
        b=Fvh31oS5CajnEgA6OLRolPffxZWiq1SGj8IUkA86gDqvEc5mhCevgpgcZ1aSC/lf5s
         aDtTNtYJcKADV3FuaSJqin4xQU1WUec2BlR1jHEqUYIix1a/iSSuQKpuf+ToIYvRs/nY
         qR0xcPvMgPgNxTOzeWNjRcx7jcZDY7iGyU8ayq9CLeMssUYS+28Ack8RDzHSQ7OncIxR
         Vobma1Qpj0s4/k6/i9ys7Bxc/5eKFYYSHjFjQTugysYtv89i0G9bEv2/GyvoI68nK3I8
         WLS2xy8Bk4s1k0f+2W/i84qg8kgJf6qGLm5erNsCo8AzpZWxsnaG0o1xE20XO3TkTh2A
         bOSQ==
X-Gm-Message-State: APjAAAW0gOZvxd8XVVx7CaqcbMUXDFvejUPFpGVN6UNwL0yioumaes1t
        02vyIjAH8K9XS2Hx/Ff12x+ubQCc9A==
X-Google-Smtp-Source: APXvYqzENzDLtk8ue6bLxMgyes9sMwNmhHzl61Vad9i5zvU9aaNzxv9lxzZoNStbZqljWkF76DbHhA==
X-Received: by 2002:aca:4587:: with SMTP id s129mr14108800oia.124.1578959074635;
        Mon, 13 Jan 2020 15:44:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v4sm4753305otf.7.2020.01.13.15.44.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:44:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d0
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:23:10 -0600
Date:   Mon, 13 Jan 2020 17:23:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, vkoul@kernel.org,
        eugen.hristev@microchip.com, jic23@kernel.org, knaack.h@gmx.de,
        lars@metafoo.de, pmeerw@pmeerw.net, mchehab@kernel.org,
        lee.jones@linaro.org, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        wg@grandegger.com, mkl@pengutronix.de, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-can@vger.kernel.org, linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 02/17] dt-bindings: at_xdmac: add microchip,sam9x60-dma
Message-ID: <20200113232310.GA30698@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:17:54 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-dma to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/dma/atmel-xdma.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
