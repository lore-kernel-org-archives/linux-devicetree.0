Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:39757 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752392Ab3G3LT3 convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 30 Jul 2013 07:19:29 -0400
Message-ID: <1375183165.2272.1.camel@hornet>
Subject: Re: [PATCH v2 4/4] mtd: nand: gpio: Add support for multichip
 devices
From: Pawel Moll <pawel.moll@arm.com>
Date: Tue, 30 Jul 2013 12:19:25 +0100
In-Reply-To: <1375182325-30003-2-git-send-email-shc_work@mail.ru>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
	 <1375182325-30003-2-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, 2013-07-30 at 15:05 +0400, Alexander Shiyan wrote:
> +- gpio-ale : specifies the ALE gpio pin.
> +- gpio-cle : specifies the CLE gpio pin.
> +- gpio-nwp : specifies the NWP gpio pin (Optional).
> +- gpios-nce : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> +- gpios-rdy : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.

Let me quote Documentation/devicetree/bindings/gpio/gpio.txt:

	GPIO properties should be named "[<name>-]gpios"

So I believe it should rather be: "ale-gpios", "cle-gpios", "nwp-gpios",
"nce-gpios", "rdy-gpios"...

Pawel


