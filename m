Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72129C33CAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47C192084D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 00:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578960007;
	bh=S1NaguMR9V42wx+4NBdr8/GDzglDpxcOx6sESbSOMC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ikrw+t8P4/0VtCSrVlsyirwtpnhWHOL/3hDEx4LV3z9fLQrvUsLUSvNJQsHSynKQA
	 FlxdSVn+VKEWtmJH9J0GobZtQZ/J5z61Q2ihWNM10yxXem3DwUMh2s53oN44VePNf5
	 JkhKqrliAPd02R0A9DhRL7l7fcjB81n8/aFUGxo8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgANAAH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 19:00:07 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46936 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgANAAG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 19:00:06 -0500
Received: by mail-ot1-f68.google.com with SMTP id r9so10786265otp.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 16:00:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hWr5fTf0UvM/FdokqnbY78OahK5vgKtckbIjPFsKcM=;
        b=EgrNBD3lr5kV0VP/G3FMn21kLKj2LW/asjhNC6WOs0WUr7LMLynrT1+WuWUmzn5u1q
         g2iAOwynYpGHgJUYKfHJoTtMrnvDQuxdv2rTCe1z2JEQvN764MY9XZ1/Nb/0OWrxhrrT
         uFSdDYGoew7k88VyJAldlHp9N6yWwaM3lpn+o9Gmnh1ww1Fcvk/kNWWZ7MFZg0JvJGQ+
         3/RmjVNyq1L7chzRxqcY5t/94KGv9xIjqhx/Ke/cMbSqcRG1BH4Ey4GuO+mIOMqpcVpy
         5AS1DLA/P7SYq74OA6YxMyCpcW+ByO1zvGq8BbLABCqEIRMaGpk0ENbrRripnIKGHeAq
         myww==
X-Gm-Message-State: APjAAAV7tKGJ9xBao+1pgJfUqUsCbI0sPV9Tm9eRCQZqgDxF4WvJpoZz
        CCpmrRRRMIoOJUQj13kPSqaN6bVFYw==
X-Google-Smtp-Source: APXvYqyGDSmSaGFYFogNURNhOGLeEn+JCg4ronb3q5JUc+DYMekv2Pk5rT7CkSsfMkx/VDDXoxLksQ==
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr15221151oto.355.1578960005811;
        Mon, 13 Jan 2020 16:00:05 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p184sm4034876oic.40.2020.01.13.16.00.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 16:00:04 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 223f23
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 17:25:51 -0600
Date:   Mon, 13 Jan 2020 17:25:51 -0600
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
Subject: Re: [PATCH v2 05/17] dt-bindings: atmel-isi: add
 microchip,sam9x60-isi
Message-ID: <20200113232550.GA2344@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-6-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578673089-3484-6-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 18:17:57 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-isi to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/media/atmel-isi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
