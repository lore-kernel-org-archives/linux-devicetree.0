Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5C8C33CA9
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 007592080D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578962016;
	bh=w6b7zxtaX1JNVVh331GpaaL1Tljp48nC2gXOjBChnjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GPZnJu8lGmqiq+AcBNJpd3SO8NhBNsXJmvHf514qEQETkDaBKroIpGI8olKuVrFTw
	 ryf6dc9JT26pyKRuGFq6tQoFiv8V+wpeZGNM7urPmEgZ6TaioLA+C0WXSr3Otcy26U
	 6uTdh183lgu9SDZgwAvqvftH+NgfA5OD8Iwd3i5M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728890AbgANAdf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:33:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:46635 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbgANAdf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 19:33:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id r9so10859253otp.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 16:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fXJN2b85yGTyfLCLDYBimi22Hg8WM/nHD10wRzYfTm4=;
        b=j36JRgsLUiTDIbiAFY1Pumd+qwP+cKvCMqsHLGscha7cRINzUBrDSAIv6oTWZ213aQ
         Wb1nHDMiWlu9AXOxZyk/ykc9EmoQ5zzi6CmkWludkqRU4PZS+83N8dwVMApjFDibS+RY
         u2he8oBaU9UmxZ4z7ofIS/Y0qhyo58W9aqVJd+ZZDmd4mk+h0ktZHXcRJVi93HonACC5
         SWtmAkh99LkQig77k0eAr9mGNQ5VpL9vXIz/uBFm4vnBDW949V9ZyffFiC645js9XIsR
         amwoOf4R+5fXh+rj9lzwA7Mj5Q2VX8HvOe2cAC6Pta2/zVTVWBgho6TCUzDgKftox6/l
         n5Yg==
X-Gm-Message-State: APjAAAW2H0MgXWzLCPlxghXy5z0gtPlfBVSeBUHxEQ1WPivxC9mUiyiS
        idZnB496XBCRXtzw4nkzorDV7MEc5g==
X-Google-Smtp-Source: APXvYqzD4/+rVw3ysbVqE7Im1L2IBJSfx3057VTUcI6O+vvs/YrAgB88vndXd3yQ4SFr/TA4O9AUEg==
X-Received: by 2002:a05:6830:155a:: with SMTP id l26mr15251852otp.339.1578962014222;
        Mon, 13 Jan 2020 16:33:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r25sm4777303otk.2.2020.01.13.16.33.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:33:33 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22198d
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 18:33:32 -0600
Date:   Mon, 13 Jan 2020 18:33:32 -0600
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
Subject: Re: [PATCH v2 15/17] dt-bindings: arm: add sam9x60-ek board
Message-ID: <20200114003332.GA3401@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-16-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-16-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:18:07 +0200, Claudiu Beznea wrote:
> Add documentation for SAM9X60-EK board.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
