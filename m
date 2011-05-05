From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/6] powerpc: make irq_{alloc, free}_virt private and
 remove count argument
Date: Thu, 05 May 2011 10:39:55 +1000
Message-ID: <1304555995.2513.391.camel@pasglop>
References: <20110428192227.8979.49181.stgit@ponder>
	 <20110428200153.8979.23873.stgit@ponder>
	 <1304387267.2513.298.camel@pasglop>
	 <20110504155905.GB3317@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110504155905.GB3317@ponder.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Simek <monstr@monstr.eu>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, hpa@zytor.com, Dirk Brandewie <dirk.brandewie@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2011-05-04 at 09:59 -0600, Grant Likely wrote:
> 
> Heh, I wondered about that, but there hasn't been any users for at
> least 5 years (as evidenced by commit e12514650b, "Fix loop logic in
> irq_alloc_virt()") so it was looking pretty dead, and it made the
> patch to switch to using irq_alloc_desc*() quite a bit simpler if it
> was removed.  :-)
> 
> I'm not particularly attached to this patch, so I can drop it from the
> series. 

Well, Willy recently added support for the MSI block allocation so ...

Cheers,
Ben.
