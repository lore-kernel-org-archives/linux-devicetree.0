Return-Path: <devicetree-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:64399 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751038Ab3G3P5O (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Tue, 30 Jul 2013 11:57:14 -0400
Date: Tue, 30 Jul 2013 16:56:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 4/4] mtd: nand: gpio: Add support for multichip
 devices
Message-ID: <20130730155635.GE29859@e106331-lin.cambridge.arm.com>
References: <1375182325-30003-1-git-send-email-shc_work@mail.ru>
 <1375182325-30003-2-git-send-email-shc_work@mail.ru>
 <1375183165.2272.1.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375183165.2272.1.camel@hornet>
Sender: devicetree-owner@vger.kernel.org
To: Pawel Moll <Pawel.Moll@arm.com>
Cc: Alexander Shiyan <shc_work@mail.ru>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 30, 2013 at 12:19:25PM +0100, Pawel Moll wrote:
> On Tue, 2013-07-30 at 15:05 +0400, Alexander Shiyan wrote:
> > +- gpio-ale : specifies the ALE gpio pin.
> > +- gpio-cle : specifies the CLE gpio pin.
> > +- gpio-nwp : specifies the NWP gpio pin (Optional).
> > +- gpios-nce : specifies the NCE gpio pin or several NCE GPIOs for multichip NAND.
> > +- gpios-rdy : specifies the RDY gpio pin or several RDY GPIOs for multichip NAND.
> 
> Let me quote Documentation/devicetree/bindings/gpio/gpio.txt:
> 
> 	GPIO properties should be named "[<name>-]gpios"
> 
> So I believe it should rather be: "ale-gpios", "cle-gpios", "nwp-gpios",
> "nce-gpios", "rdy-gpios"...
> 
> Pawel
> 

+1

Mark.
