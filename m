From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Thu, 2 May 2013 21:11:40 +0200
Message-ID: <201305022111.41043.arnd@arndb.de>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130502185322.GA29333@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20130502185322.GA29333@obsidianresearch.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Gregory Clement <gregory.clement@free-electrons.com>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 02 May 2013, Jason Gunthorpe wrote:
> > +static struct of_device_id orion_irq_dt_ids[] __initconst = {
> > +     { .compatible = "marvell,orion-mpic", .data = orion_of_init },
> > +     { }
> 
> Is there a strong reason to change the compatible string? Looks to me
> like either the new driver or the old driver will bind depending on
> what is in the machine description. No need for a new string?
> 

The compatible string should change if the binding changes in an
incomptible way, and we should try not to change it unless it's
fundamentally flawed.

	Arnd
