From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [PATCH v5 06/27] irq_domain/powerpc: eliminate irq_map; use irq_alloc_desc() instead
Date: Mon, 02 Apr 2012 23:22:36 +0200
Message-ID: <m2wr5xomlf.fsf@igel.home>
References: <1329383368-12122-1-git-send-email-grant.likely@secretlab.ca>
	<1329383368-12122-7-git-send-email-grant.likely@secretlab.ca>
	<m2iphj3zxr.fsf@igel.home> <m2hax2qeqs.fsf@igel.home>
	<alpine.LFD.2.02.1204022251420.2542@ionos>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.02.1204022251420.2542@ionos> (Thomas Gleixner's
	message of "Mon, 2 Apr 2012 22:52:34 +0200 (CEST)")
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, LAK <linux-arm-kernel@lists.infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Milton Miller <miltonm@bga.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

Thomas Gleixner <tglx@linutronix.de> writes:

> Hmm. Which irq chip is handling the interrupt for that sata irq ?

It's MPIC 1.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
