From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v3] uio/pdrv_genirq: Add OF support
Date: Tue, 19 Apr 2011 18:09:19 -0500
Message-ID: <20110419180919.17971598@schlenkerla.am.freescale.net>
References: <1303116654-5042-1-git-send-email-monstr@monstr.eu>
	<20110419060816.GA5252@ponder.secretlab.ca>
	<20110419220018.GB2772@local>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110419220018.GB2772@local>
Sender: linux-kernel-owner@vger.kernel.org
To: "Hans J. Koch" <hjk@hansjkoch.de>
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, john.williams@petalogix.com
List-Id: devicetree@vger.kernel.org

On Wed, 20 Apr 2011 00:00:18 +0200
"Hans J. Koch" <hjk@hansjkoch.de> wrote:

> On Tue, Apr 19, 2011 at 12:08:16AM -0600, Grant Likely wrote:
> > PowerPC and x86 will return 0 for an unassigned IRQ, as will most platforms.
> 
> That might be right for these architectures. On ARM SoCs, IRQ0 is often a
> normal irq like any other (e.g. "Audio DMA Controller 1" on Telechips TCC8000).

It's true on at least some powerpc and x86 interrupt controllers as well.
ARM isn't special. :-)

I'm not sure what goes on on x86, as I see a real " 0:" in
/proc/interrupts.  But on powerpc, Linux's IRQ numberspace is decoupled
from that of any IRQ controller.  This is mainly to accommodate multiple
IRQ controllers with their own numberspaces in the same system; being able
to avoid irq 0 is just a bonus.

-Scott
