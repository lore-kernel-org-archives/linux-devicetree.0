From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Mon, 29 Nov 2010 23:47:35 +0000
Message-ID: <20101129234735.4ce3a933@lxorguk.ukuu.org.uk>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>
	<20101128160449.GC30784@www.tglx.de>
	<1290984809.32570.208.camel@pasglop>
	<20101129130720.7d060e1c@udp111988uds.am.freescale.net>
	<1291061128.32570.298.camel@pasglop>
	<4CF40DF4.9060204@firmworks.com>
	<1291063470.32570.312.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1291063470.32570.312.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Mitch Bradley <wmb@firmworks.com>, Scott Wood <scottwood@freescale.com>, sodaville@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, x86@kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> This is actually the case of most systems, tho those Atoms SoC are a bit
> weird as, afaik, they don't really have PCI... they just simulate some
> kind of PCI config space for on-chip devices ,at least that's my
> understanding.

This is true of a lot of devices on most "PCI" chipsets today. Even back
to things like the VIA K6 era chipsets with the V-Bus, or the
MediaGX/Geode where some of PCI space is a hallucination brought on by
SMM traps and BIOS upgrades have been known to add devices to the bus
which are not even neatly on their own sub-tree of any kind. Indeed some
PCI devices may be half PCI half magic.

> Sebastian, do you have a block diagram of the SoC ? Following the actual
> bus hierarchy of the chip might be the best approach.

That may not be wise. Your real bus heirarchy may not be architecturally
defined on some systems so you can't incorporate it into code, nor is it
necessarily a heirarchy - eg some of the Geodes.

Alan
