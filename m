Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BE8C33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 23:27:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 410B524679
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 23:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579044423;
	bh=PPRKWQ5QDWXOR83RKwXIekU7AQc4h2uVttMnr+Mvuvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=thSsHzhLFAk4kAUSgRvdVb11RFuWqRw0FW/oYHQV0UfaEnRpDrckY2Z8lZ11ZWDCC
	 s6phV5kIt4hJ053Guj4ZeiTMjeacJDpE4XZ0JgWnRMBiv4/boLemFJuPpUds6XZiIT
	 +p/Yb9d3bf+sLZe2bQegV8xA7Q/vEn6AZYhcyNJU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgANX1C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 18:27:02 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34657 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgANX1C (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 18:27:02 -0500
Received: by mail-ot1-f66.google.com with SMTP id a15so14431264otf.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 15:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ttZMLAqDhxSTsHlfd8sLeyc9soxLzGATxjf7nZzKPPw=;
        b=GRbpNC11nN4Oit+cR/C7n5wMccbOnUOzPHUuL5T/S28ldheV5oRdItTss1NEYPYNTq
         pD/vDlTmn/+oDGKgwfF0797iPIg3UO9rwyINDUFPLIFpRPn7hhBX7Vq6o8UyclNHcZOE
         sWiXok+yt+S2tZFiwIFwx/6YE/+OFp00MHQzFK6paRPs8H0Zg7IuUK/ReiQQG2KF6Qw7
         iHSwbJMereL/1Z7V3NPPZTPkWYkyIN6ox7jHXm+uDiOMvUEnl6mYVbc3a2+XaWxpnPwr
         6NNwvPjXB0dFOxZXVlE/a8kGlsfYZ0YuV/SDo/15VIDlTjsgaRhfSmX3kdDfg9t0igqF
         a8AQ==
X-Gm-Message-State: APjAAAUIZIpxHC1uTaKyFIKg+XyN4VfNSPMVZli4454I56rTkaLEFKsM
        GbcRqCA1W68VWOBUNxeS4/T/jWk=
X-Google-Smtp-Source: APXvYqyhHNfaiKT9S0jk+YqKd4I51tVaNEiGNgd7cPzowjkqkGCkZBvwN2JJCHiOFmg/eYcWvU+w8A==
X-Received: by 2002:a05:6830:139a:: with SMTP id d26mr687224otq.75.1579044421198;
        Tue, 14 Jan 2020 15:27:01 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l23sm5892492otf.23.2020.01.14.15.27.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:27:00 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 221a3a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:26:59 -0600
Date:   Tue, 14 Jan 2020 17:26:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     robh+dt@kernel.org, lee.jones@linaro.org, mark.rutland@arm.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, radu_nicolae.pirea@upb.ro,
        richard.genoud@gmail.com, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: atmel-tcb: add microchip,sam9x60-tcb
Message-ID: <20200114232659.GA16642@bogus>
References: <1578997397-23165-1-git-send-email-claudiu.beznea@microchip.com>
 <1578997397-23165-3-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578997397-23165-3-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 14 Jan 2020 12:23:12 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-tcb to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-tcb.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
