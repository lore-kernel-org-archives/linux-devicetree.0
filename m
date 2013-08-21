Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:38768 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab3HURk7 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 21 Aug 2013 13:40:59 -0400
Message-ID: <5214FBA8.5000603@wwwdotorg.org>
Date: Wed, 21 Aug 2013 11:40:56 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] of: add vendor prefix for Microchip Technology Inc
References: <201308211719.57748.poeschel@lemonage.de>
In-Reply-To: <201308211719.57748.poeschel@lemonage.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Lars Poeschel <poeschel@lemonage.de>
Cc: rob.herring@calxeda.com, Pawel Moll <Pawel.Moll@arm.com>, mark.rutland@arm.com, ian.campbell@citrix.com, rob@landley.net, Grant Likely <grant.likely@linaro.org>, arnd@arndb.de, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 08/21/2013 09:19 AM, Lars Poeschel wrote:
> Trivial patch to add Microchip Technology Inc. to the list
> of devicetree vendor prefixes, as it is already used in
> Documentation/devicetree/bindings/gpio/gpio-mcp23s08.txt

Oh dear. Perhaps it can be legacy-ified...

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt 

> +mcp	Microchip Technology Inc.

If I saw "mcp," in a *.dts file, I wouldn't immediately think "Microchip".

Their stock ticker appears to be MCHP, so I'd suggest either "mchp" or
"microchip" instead; that latter being my personal preference.
