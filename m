From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Fri, 3 May 2013 00:09:56 +0200
Message-ID: <201305030009.57041.arnd@arndb.de>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com> <alpine.LFD.2.02.1305022324371.2891@ionos> <5182E11E.5010103@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5182E11E.5010103@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 02 May 2013, Sebastian Hesselbarth wrote:
> > Just look at the various implementations in drivers/irqchip/ and find
> > out how similar they are. Moving code to drivers/irqchip/ does not
> > make an excuse for reestablishing the mess which was addressed by the
> > generic irq chip implementation.
> >
> > Can you - and that means all of you ARM folks - please get your gear
> > together and add the missing features to the generic irq chip
> > implementation? I'm not going to accept more of that OF/DT frenzy.
> 
> So you are suggesting to have a "linux,generic-intc" or you want me
> to have "marvell,orion-intc" make use of generic irq chip again?
> 
> The second is easy, the first will take me a while to think about
> proper DT properties how to encode mask/unmask/ack/.. availability
> and offsets.

I think it should not be "linux,..." since the description can
well be OS independent. I don't have a good idea for a generic
name, but it's not very important.

The main missing piece in the generic irqchip code at the moment
is support for the linear irqdomain. Once we have that, a lot of
code can be simplified significantly.

	Arnd
