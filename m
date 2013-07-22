Return-Path: <devicetree-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:44962 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932388Ab3GVVe6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
	Mon, 22 Jul 2013 17:34:58 -0400
Message-Id: <E1V1Nkn-00072x-Df@jdl.com>
Subject: Re: The future of DT binding maintainership
In-reply-to: <1925583.R0td2pS6as@flatron>
References: <CACxGe6vtJPbbqwpH8Th5S36Hx50f39j1P4OpLb-Um9xQie6Lng@mail.gmail.com> <2962401.WRRoYlXkRr@flatron> <60BA5429A0E1584BA3633194F6F993B502B21362@NA-MBX-03.mgc.mentorg.com> <1925583.R0td2pS6as@flatron>
Date: Mon, 22 Jul 2013 16:34:49 -0500
From: Jon Loeliger <jdl@jdl.com>
Sender: devicetree-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: "Chaiken, Alison" <Alison_Chaiken@mentor.com>, Grant Likely <grant.likely@secretlab.ca>, Wolfram Sang <w.sang@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <devicetree@vger.kernel.org>


> > Is there a schema out there in the wild that exemplifies what you mean?
> 
> Not really. The format of schemas is currently in design stage. I'm 
> currently rethinking some details of what I have in my mind. Give me some 
> more time and I will post an RFC to the ML with all that written down.

...and...

> > The schema-check idea reminds me of the W3C HTML validators:
> > 
> >       http://validator.w3.org/
> > 
> > Since device-tree source looks a bit like XML (or maybe more like JSON),
> > will be the schemas be similar in spirit to DTDs, and is it helpful to
> > think of the validator in this spirit?   Or will the checker be more
> > like "gcc -Wall", since it will be invoked by a compiler?
> 
> My idea is to implement compile time verification in dtc, so I guess it 
> will be more like the latter. Since dts is what dtc can already parse, my 
> plan is to keep the schemas in spirit to dts, just modifying/extending it 
> to allow specifying bindings with them, rather than static values.
> 
> Best regards,
> Tomasz

It is possible to add some-damn XML DTD parsing and
rule glomming even in DTC if that is what is wanted.
I think it will be more an issue of expressability.
That is, how can the desired style of rules be most
eloquently expressed, internalized and applied?

That will be the current challenge first.

jdl
