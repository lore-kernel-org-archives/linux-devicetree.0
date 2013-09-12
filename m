From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Date: Thu, 12 Sep 2013 15:10:11 +0100
Message-ID: <20130912141011.GK12758@n2100.arm.linux.org.uk>
References: <20130911104126.GN29403@sirena.org.uk> <52304BFF.4060007@freescale.com> <20130911113002.GP29403@sirena.org.uk> <523186DF.4070203@freescale.com> <1378982395.2627.416.camel@shinybook.infradead.org> <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com> <1378984665.2627.423.camel@shinybook.infradead.org> <20130912114831.GL29403@sirena.org.uk> <20130912115549.GI12758@n2100.arm.linux.org.uk> <alpine.DEB.2.00.1309121523130.2394@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1309121523130.2394@lnxricardw.se.axis.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "b44548@freescale.com" <b44548@freescale.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "b18965@freescale.com" <b18965@freescale.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>, Huang Shijie <b32955@freescale.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta, Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "lznuaa@gmail.com" <lznuaa@gmail.com>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.or>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2013 at 03:25:45PM +0200, Ricard Wanderlof wrote:
> A bit of an odd name when used in this context I think; LUTs are usually  
> used to perform mapping or transformation functions, e.g. looking up a  
> value 'y' given an input value 'x'. In this case it's just a table of  
> commands to be executed. But I guess the name LUT has been used in some  
> hardware specification so there's not much we can do about it.

Remember that not all designers speak the English language, so they
may very well call something like this a lookup table, because it's
very similar to what they may have implemented in things like video
chips to translate colour indexes to actual colours... especially
when they call the thing which controls where in the "table" entries
are read from an "index".  They could've also called it an "array"
too.

Either way, it doesn't matter - the principle is that it's a sequence
of consecutive programmable entries which provide commands for the
controller to use.

Just remember all the problems of flat pack furnature where the
instructions are a poor translation of another language - or indeed
technological devices for that matter.  There's plenty of examples
out there where stuff is "lost in translation" and you're left
wondering what they're talking about.
