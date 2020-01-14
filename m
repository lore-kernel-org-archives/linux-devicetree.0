Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4F6C33CB0
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA5CA21569
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578961247;
	bh=qMV9t6yq7xpLcOxvDk7MIU+TGS/TsLnI3P1Rd0BbMos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2KscJh2NA3YbI6EVLXUARoZO/nWqtNZLwZNdF3e2P4f6GMNUgg0aNqSNHe7kFb0m2
	 9PmXkZ6SrvZqKGUykZmo2SY7d2iIVQQ47uzSG9lwp740HqZcxzj0fQq80ono7tDb9D
	 BdzjYiTXUv2lX7oYXPtIYuDuRR0RuhMgVbp187GA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgANAUr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:20:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41553 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgANAUq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 19:20:46 -0500
Received: by mail-ot1-f65.google.com with SMTP id r27so10846388otc.8
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 16:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z4zWbyVluCegWLV1bmjQGYNlUCTLZBFCektijqCqk8g=;
        b=QNaZSuVLfp+0628LcvurDDFP6PqXfQgZlhRcQS/gYiy1jwEqQEzB1NYloeySrhuAoi
         6FxxJlsY2lDvPPBprnR1lf9173Uvf3qRtG0Nw7xUyHIWP7KtdempqQhLesTCFfPKCCPW
         yZiORVeS107dJyI+ZG4ggEddQmCKszfTeKq1FuSRew6mITRnR90nNmoKoKYfVm/Yl17D
         iz0B6l6RgQXnZ7yyNJuBdI/Si0gPG5gz22QjR7c03mrtaKcm5xE19MV5SN/JzYbuZ9oS
         xRXYd5kGOivjr5BpNf0l67PtlpQ0aygRBXWh9FyzbaRxYuDeir9vQvqwoNC3KJdQtmBO
         XGig==
X-Gm-Message-State: APjAAAX7oekFigzMLlb+DYPknLKn9fY5RZCP+NzveMC+mP+d5HmUnzgu
        BMabDtLU3s9U6i/YBoH+dsSCCEFcSQ==
X-Google-Smtp-Source: APXvYqxHtJmwAn1QtebNOb01sqCGZBo8wLvd8aKZ+aXG7HSB/06jplO+TZSbJ4c4beIyzoOLYuo/hw==
X-Received: by 2002:a05:6830:c2:: with SMTP id x2mr15314812oto.8.1578961245876;
        Mon, 13 Jan 2020 16:20:45 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm4052713oic.22.2020.01.13.16.20.43
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:20:44 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d0
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:20:42 -0600
Date:   Mon, 13 Jan 2020 18:20:42 -0600
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
Subject: Re: [PATCH v2 11/17] dt-bindings: atmel-gpbr: add
 microchip,sam9x60-gpbr
Message-ID: <20200114002042.GA17036@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-12-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-12-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:18:03 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-gpbr to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-gpbr.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
