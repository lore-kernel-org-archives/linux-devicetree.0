From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Fri, 26 Sep 2014 09:20:54 +0200
Message-ID: <3346642.tZaefcZubX@wuerfel>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com> <20140926003750.GA12770@saruman> <20140926003934.GD12770@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140926003934.GD12770@saruman>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, balbi@ti.com
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, alexandre.belloni@free-electrons.com, Peter Chen <peter.chen@freescale.com>, p.zabel@pengutronix.de, jszhang@marvell.com, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

On Thursday 25 September 2014 19:39:34 Felipe Balbi wrote:
> > 
> > why would a glue layer need to access registers from the core ? That
> > sounds very odd. I haven't seen that and will, definitely, NACK such a
> > patch 
> > 
> > can you further describe why you think a glue layer might need to access
> > core IP's registers ?
> 
> I just realised we're talking about chipidea here... in any case, it's
> still valid to ask why would glue need to fiddle with core IP's
> registers.

Generally, the glue driver wouldn't access the registers, but I don't
think it's important to prevent it from doing that. In some cases, 
a glue driver needs to override a function of the core driver, e.g.
to work around an errata. We have a lot of those quirks in ATA drivers,
one example from ahci_mvebu.c is

static void ahci_mvebu_regret_option(struct ahci_host_priv *hpriv)
{
        /*
         * Enable the regret bit to allow the SATA unit to regret a
         * request that didn't receive an acknowlegde and avoid a
         * deadlock
         */
        writel(0x4, hpriv->mmio + AHCI_VENDOR_SPECIFIC_0_ADDR);
        writel(0x80, hpriv->mmio + AHCI_VENDOR_SPECIFIC_0_DATA);
}

	Arnd
