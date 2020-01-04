Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B3CC33C99
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:12:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC39D24653
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578172321;
	bh=Kc8R8PG2XjwdyEZc6dNj6JgJPNj/Pco8HHi++eEHxk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=E7EotG/xWFTmM2KrRYsqXDBX21VxjU68QBRpH7xF8hpSXoz6NkDtYX8FicfdvATHz
	 eAqKKxUASjdWK6/g5eoMIeHBdUeur7xErshqTbSkICPGe017cYODbYGsZVFFXw93W6
	 KgOWcW4VhHenK4JEsJqLS78aCi205k9uxgp4Ho1Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADVMA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:12:00 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:40774 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgADVMA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:12:00 -0500
Received: by mail-il1-f193.google.com with SMTP id c4so39391109ilo.7
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B0Hpin+TA8PZ/UPU++QRg3TQKcelVhxJf7UGPi4P5JQ=;
        b=UKtP5CMmLykimSvkjNwIll1Y5/POdjSUVi5Ndkuh+fM/HSMA1hX6yBGwyyoA4dOLzI
         FAA+KloEPphDNjr+z7F3Vzo7xjHopmSDWymWTGU6AJ+fFVswzQgsBjNtrYPrQfPpxr7V
         YnNkLTa+x5l8HvCGdgj8aj83wLLq70LqKmz3NfkPD8q3hYWVIsmu5eWzIiwPtzw/Uk2y
         3rZpngPNUETCXVcSUcotKPZS4J9EyR8mxn+mjk086YUxkIJPuHABfhdVaasnoxXcD2CA
         /5grfm6J4NRHDmsA1e+21ytP/LQgtOP8d0P8oX7MEuu+Ogdf1cJJkZiDeqHBxNrBAj07
         TP2w==
X-Gm-Message-State: APjAAAU3uZP4auvaTFa5UMltA+cEGWTGKQ0rSwgMEWcalqS/+E8qAXXp
        743pyiPICs009hvnWRqMOc8Upxk=
X-Google-Smtp-Source: APXvYqx21ThfQ1h9h7abilqU2m++evTAY/OkctOZPuXojbdngnNtwb9r8RG5EdtlBNFtM2hDOmTRIQ==
X-Received: by 2002:a92:b11:: with SMTP id b17mr80688407ilf.202.1578172318715;
        Sat, 04 Jan 2020 13:11:58 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a22sm10942550ioq.52.2020.01.04.13.11.57
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:11:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:11:57 -0700
Date:   Sat, 4 Jan 2020 14:11:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] dt: bindings: lm3692x: Add led-max-microamp
 property
Message-ID: <20200104211157.GA21511@bogus>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <015c9818d17d81783614da2b89ec46283468765b.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <015c9818d17d81783614da2b89ec46283468765b.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat,  4 Jan 2020 11:54:21 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> This can be used to limit the current per LED strip.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
