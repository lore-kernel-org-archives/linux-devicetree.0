Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:37581 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963Ab3HUWtm (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 18:49:42 -0400
Received: by mail-oa0-f44.google.com with SMTP id l20so2183003oag.3
        for <devicetree@vger.kernel.org>; Wed, 21 Aug 2013 15:49:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1377016827-26827-2-git-send-email-bigeasy@linutronix.de>
References: <1377016827-26827-1-git-send-email-bigeasy@linutronix.de>
	<1377016827-26827-2-git-send-email-bigeasy@linutronix.de>
Date: Thu, 22 Aug 2013 00:49:42 +0200
Message-ID: <CACRpkdYtz1_hugbeVyWc83KLHMy6o11LgonBX5=S3Rvz1NBbiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt: dbx5x0: remove mentor,musb binding
From: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 20, 2013 at 6:40 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> The "mentor,musb" binding isn't documented so I was about to document
> it.
> The node is missing a few properties for configuration like
> "multipoint", "dyn_fifo", "num_eps" or "ram_bits". However I am not sure
> "missing" is the right word here because some of those informations
> might be obtained from the chip itself but it is not done (yet).
> Further the ePARP 2.3.1 says the matching goes from left to right taking
> the fist match. Right now there is jus a driver for
> "stericsson,db8500-musb" and none for "mentor,musb". I'm not 100% that
> it is simply possible to have a generic since even for DMA we have
> ifdefs in the driver between "generic mentor dma" and "ux500 dma" and I
> mean within musb and not the dma code.
>
> For that reason (that I am not sure a generic musb binding is possible and
> how its binding / required properties will look like) and the reason that
> we have here a minor binding without a driver to look at I suggest to
> remove that binding.
> If the majority of people prefer to keep this binding I'm curious how
> the documentation of the binding should look like.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Patch applied to my ux500-devicetree branch.

Yours,
Linus Walleij
