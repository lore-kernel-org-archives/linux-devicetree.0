Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943A0C33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 696C121569
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578955051;
	bh=+Vwx7gkSAe5ZKuyDwReisBuyr1j6476uD+cB0xRNHyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=WTeMEyGinhyDc9ESQBe4e5qqvJDtkQJG/3cZ9Xf+ovLYx36vJO9QJ73KGMJUUH5hZ
	 7WQfN+JNUtXxkc+mB67txBxsklGdr8G2+0s8JaaOuxrCl87FrO9gJiAJt46L8YEcUq
	 /Jlr6DT2+r79/uF4hzKVwLlY85QaNDIu32I+tCVo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgAMWh2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:37:28 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39972 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728633AbgAMWh2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:37:28 -0500
Received: by mail-oi1-f194.google.com with SMTP id c77so9929260oib.7
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zw6iSRepM4LG+d/YXuCQ8oJD6o1KO8WeOLqBNcecU20=;
        b=anwMKKamvFS9jwfiQuhmYcdH8bHXmJnxSN60U6tdzaIaQ95S8lNWl3DdXpWIVWYHmQ
         pVifPnWD2AsCwWnJLYNYw4AmfoEmdJE5ZiBE36V1APKMEiV9a/d7uVh2MDY4SI6mwCtk
         bBAnQSpG0m5BLzNZZwL/riRCmdcGXOhxLGkRkfKjv4rF8T/fuVY5GINfDtV3oOCK9IQl
         dfs0zYjz9+ZQo+sikFEjDmDLFEZTSHYudkWS0CvSIDSYo6x027f0/PBEPkoZgbeuKjx8
         nhOG+YqqDdn3h9jQqcQN3JkbimfQDqlCXOXXwhtL6ndzswOeNMTy+UMHAhZ+uMsyVeNP
         2uCQ==
X-Gm-Message-State: APjAAAUS5oce28DOm32Ejq3cl6BRwMDkLIP9qRUhI+LDiPM+KHg13bqJ
        cmIqSPoI3p18XEzCEbdN1L5ROOc=
X-Google-Smtp-Source: APXvYqxEO4f8uFh/X9jwFzE3VBp5KCFXLfagJMcXpidc9lKfCbvbHXUaintCUoPa7PSnLjX+F8iYNg==
X-Received: by 2002:a54:4f8d:: with SMTP id g13mr13784741oiy.43.1578955046822;
        Mon, 13 Jan 2020 14:37:26 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i3sm4639801otr.31.2020.01.13.14.37.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:37:25 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220b00
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:37:25 -0600
Date:   Mon, 13 Jan 2020 16:37:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     guillaume La Roque <glaroque@baylibre.com>, marcel@holtmann.org,
        johan.hedberg@gmail.com, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: Re: [PATCH v6 1/2] dt-bindings: net: bluetooth: add interrupts
 properties
Message-ID: <20200113223725.GA22169@bogus>
References: <20200109104257.6942-1-glaroque@baylibre.com>
 <20200109104257.6942-2-glaroque@baylibre.com>
 <20200109105305.GL30908@localhost>
 <a33f9c30-03a8-ea12-e9d3-5e050e41318e@baylibre.com>
 <20200109132917.GM30908@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109132917.GM30908@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 09, 2020 at 02:29:17PM +0100, Johan Hovold wrote:
> On Thu, Jan 09, 2020 at 02:13:23PM +0100, guillaume La Roque wrote:
> > 
> > On 1/9/20 11:53 AM, Johan Hovold wrote:
> > > On Thu, Jan 09, 2020 at 11:42:56AM +0100, Guillaume La Roque wrote:
> > >> add interrupts and interrupt-names as optional properties
> > >> to support host-wakeup by interrupt properties instead of
> > >> host-wakeup-gpios.
> > >>
> > >> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 4 +++-
> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > >> index c44a30dbe43d..d33bbc998687 100644
> > >> --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > >> +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > >> @@ -37,7 +37,9 @@ Optional properties:
> > >>      - pcm-frame-type: short, long
> > >>      - pcm-sync-mode: slave, master
> > >>      - pcm-clock-mode: slave, master
> > >> -
> > >> + - interrupts: must be one, used to wakeup the host processor if
> > >> +   gpiod_to_irq function not supported
> > >> + - interrupt-names: must be "host-wakeup"
> > > Looks like you forgot to address Rob's comment. If I understood him
> > > correctly you either need to stick with "host-wakeup-gpios" (and fix
> > > your platform) or deprecate it in favour of "interrupts":
> > >
> > > 	https://lkml.kernel.org/r/20191218203818.GA8009@bogus
> > 
> > not forgot marcel ask me a v6
> 
> Not much point in sending v6 before addressing feedback on v5.
> Especially as Marcel asked for a v6 with acks. ;)
> 
> > for rob comment ok but it's not possible to support gpiod_to_irq on my
> > platform.
> > 
> > if i deprecated it i need to update all DT with good interrupt number
> > right?
> 
> Not sure. Perhaps just updating the binding is enough. Rob?

Correct. Just need to reflect in the binding which way is preferred. If 
it's a case of update all the dts files, then we often just don't 
document the old way.

Rob
