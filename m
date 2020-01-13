Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53973C33CAE
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AAA12080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578958840;
	bh=ekpsGuHx8XGU6flbs8e8D7XDFTMebDIjmH8ohTnK4Kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VbRWbAuCH5boWc0R439I7FCNfftbqVOp2VhudBTDSrzz0XrsJ0LRQebNiasUCo3hl
	 4oHrjui/NnzK2HStWn+u2qUd+aRDj2giBbWF4tLsKjFaMpzgaqgDM9uC12KrIWFPyG
	 JRiV1nuASXKvgZuE5qxYijGJLb27aplPn2wVkE0Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgAMXkj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 18:40:39 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44789 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgAMXki (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 18:40:38 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so10050160oia.11
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 15:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oyL/JS9B7rUgj8Iql4HM1FyxI7CsxZnIzSDjO8scpzY=;
        b=C4qfd3nrmBaoN0aZDhljeCEKz7loRNKjyt41JwuihTwadJUj4V/ASwzsqYDsrazL2z
         R5/BjkBe/7BxHJvbHrHpvc7WWAjknP43Gs4SQ+0FjUJBRLCHUGUCIXqPbnoi1jbBR/kR
         PfLr+Y9Nk9ooLQAAQiYltMkvgcnvlSZHEHuy8JkAGlcebWRZ5XiruhPVfGxIGc8poghB
         cMkbhnpHFCsKvcTWAaDeS2u8Is58cffyeVUY51Hp4x0gpdZT5WonMwHLtHsVhYb0I6hX
         tAvt/uMLRhjuMV7KVhxosesUghtGABCjUDoU0fNnk2cmUgAUx5PR5sK8dfOUIhZk195M
         0wKw==
X-Gm-Message-State: APjAAAUMQuOa9Qe+6xxA8YsWbbwrMzhwDqTlmW+kH22fUAf5WJ72m7Dl
        rqutz9EhGUVVhXer3GdndqlKA/LPQQ==
X-Google-Smtp-Source: APXvYqx73v9iefoAyW50vHmQTEQ4RjkHV+g/2d8ub6RChB5Uy6duM9aqHAN167en8UopU6UGz1Pslw==
X-Received: by 2002:aca:5188:: with SMTP id f130mr15334804oib.47.1578958837089;
        Mon, 13 Jan 2020 15:40:37 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y196sm4040823oie.1.2020.01.13.15.40.36
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 15:40:36 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a32
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:23:23 -0600
Date:   Mon, 13 Jan 2020 17:23:23 -0600
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
Subject: Re: [PATCH v2 03/17] dt-bindings: atmel-can: add
 microchip,sam9x60-can
Message-ID: <20200113232323.GA31125@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-4-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:17:55 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-can to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/net/can/atmel-can.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
