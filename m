From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 0/2] Simple irq_domain implementation
Date: Thu, 28 Jul 2011 11:31:03 +0200 (CEST)
Message-ID: <alpine.LFD.2.02.1107281127040.2660@ionos>
References: <20110726093141.12508.48108.stgit@ponder>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110726093141.12508.48108.stgit@ponder>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>, Sebastian Sewior <bigeasy@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, 26 Jul 2011, Grant Likely wrote:

> In the interest of getting this infrastructure merged, I've reworked the
> basic irq_domain patch to implement only what is required for ARM device
> tree board support.  That means it doesn't affect any architectures other
> than ARM, and I'll send follow-on patches targeted at v3.2 to migrate
> MIPS, Microblaze, x86 embedded and PowerPC over to it.

There is also this GPIO driver pending for quite some time ...
 
> Thomas, can you please take a look?  I've got devicetree board support
> queued up and ready to be merged but for this infrastructure.

Looks reasonable, please merge them through your tree.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

	tglx
