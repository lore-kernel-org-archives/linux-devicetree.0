From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC patch 7/8] fixup 1/2: genirq: generic chip: Add linear irq
 domain support
Date: Mon, 6 May 2013 15:25:18 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1305061524520.3095@ionos>
References: <20130503214629.810207749@linutronix.de> <1367843533-7117-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1367843533-7117-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, Gerlando Falauto <gerlando.falauto@keymile.com>, Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 6 May 2013, Sebastian Hesselbarth wrote:

> irq_domain_chip_generic is allocating and indexing irq_chip_generic
> itself. However, the size of irq_chip_generic varies with number of
> irq_chip_types. This fixup moves irq_chip_generic helt by
> irq_domain_chip_generic to array of ptr and fixes the pointer arith
> used by irq_alloc_domain_generic_chip.

Thanks. I folded it in.
