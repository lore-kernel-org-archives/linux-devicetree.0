From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFC PATCH v4 3/6] MIPS: Octeon: Add device tree source files.
Date: Fri, 27 May 2011 14:13:45 -0600
Message-ID: <20110527201345.GC6645@ponder.secretlab.ca>
References: <1305930343-31259-1-git-send-email-ddaney@caviumnetworks.com>
 <1305930343-31259-4-git-send-email-ddaney@caviumnetworks.com>
 <20110527015618.GC5032@ponder.secretlab.ca>
 <4DDFD892.1040309@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DDFD892.1040309@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 27, 2011 at 10:00:02AM -0700, David Daney wrote:
> On 05/26/2011 06:56 PM, Grant Likely wrote:
> >>+- #interrupt-cells: Must be<2>.  The first cell is the GPIO pin
> >>+   connected to the interrupt source.  The second cell is the interrupt
> >>+   triggering protocol and may have one of four values:
> >>+   0 - level triggered active high.
> >>+   1 - level triggered active low
> >>+   2 - edge triggered on the rising edge.
> >>+   3 - edge triggered on the falling edge.
> >
> >Since you're choosing arbitrary values here anyway, it's convenient to
> >follow the lead of include/linux/irq.h and using 1->edge rising,
> >2->edge falling, 4->level high, 8->level low.  In the past every irq
> >controller kind of did it's own thing, but that's not very scalable.
> >
> 
> OK.  I will use those still somewhat arbitrary values instead.

Indeed, they are still completely arbitrary, but at least they are the
same completely arbitrary values.  :-)

g.
