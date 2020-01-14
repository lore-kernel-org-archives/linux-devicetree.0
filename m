Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63FCC33CAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:17:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E00B214AF
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578961041;
	bh=4fiixW2EB7t7wNVahtcaM/AyIKNE6SsJpV4VmYij+Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hXTZ0qcU72s/rqjBAB919XRV2+pA2jHi9J5yXSGu3fX4R0jhj54Vxc6y+IOINxzWx
	 0bSe7EvQOJfggl/3jRvLZSvWw794+Z59E+p5W8IsPlciCYDLLqrFIEFeoj4C7/cjWd
	 2Yt/88aODJF2bRlThcTeLf0GI3Mf5vMRoKaYlsP4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgANARV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:17:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40848 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbgANARV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 19:17:21 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so10141058oib.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 16:17:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PuZkmizV0FjMntSV+5swUbzzYgbKg4dX9XcvnF9x9qQ=;
        b=IiWhp6KDwLQj7zceDwcemjoz153z40iqLmgbb4p+kEttGEab7gPKqrnR7B5M2WELpP
         3W5QSMz2oGOp17NK5oUx55mhS2YrP8G6hLOF2gE8in8B/xIgz7xUfp4LG4CjmR16y+sH
         w+yYs2U6ZVsmtBot/SdP0R22zFAxEIGlnWRi6hTnpYi98FVN5W5prrKWFm0obmGFxGxF
         EOcqkYq27lA5/21oMQLTkarg/fHvEu7Evu9T5YXEWIdqrWIoKY8Jspxm80sd3IKSm40I
         WYoPltraHz8ZOa6nZQ7OOQ1OzmtdDw5CoFHma5mazuz8pHz9unVC6INHjNP1+04+x82j
         L8QA==
X-Gm-Message-State: APjAAAVc3lyfGR2uGEGM3m8dk002q9aNQeYLI8QAnMmMNZ2MnYQJw+ED
        bwKIRVvba39XH7z7KBRU1RHfZ3YQrw==
X-Google-Smtp-Source: APXvYqyb1VdRU9bU/8cush+urifcEZWveTmGCX295BX/LXCGf6RyQH78EzB8s6Tym5m3HqXBOQGFyQ==
X-Received: by 2002:a05:6808:ab1:: with SMTP id r17mr14011145oij.141.1578961040032;
        Mon, 13 Jan 2020 16:17:20 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm4050083oic.22.2020.01.13.16.17.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:17:18 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 223d55
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:17:17 -0600
Date:   Mon, 13 Jan 2020 18:17:17 -0600
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
Subject: Re: [PATCH v2 09/17] dt-bindings: atmel-sysreg: add
 microchip,sam9x60-ddramc
Message-ID: <20200114001717.GA11996@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-10-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:18:01 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-ddramc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
