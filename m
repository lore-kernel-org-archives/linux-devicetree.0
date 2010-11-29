From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 03/11] x86/dtb: Add a device tree for CE4100
Date: Mon, 29 Nov 2010 13:07:20 -0600
Message-ID: <20101129130720.7d060e1c@udp111988uds.am.freescale.net>
References: <1290706801-7323-1-git-send-email-bigeasy@linutronix.de>
	<1290706801-7323-4-git-send-email-bigeasy@linutronix.de>
	<1290808645.32570.158.camel@pasglop>
	<20101128160449.GC30784@www.tglx.de>
	<1290984809.32570.208.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1290984809.32570.208.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 29 Nov 2010 09:53:29 +1100
Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> On Sun, 2010-11-28 at 17:04 +0100, Sebastian Andrzej Siewior wrote:
> > >> +	isa@legacy {

What is "@legacy"?  I don't think I've seen that in a unit address
before, googling only turns up this device tree, and a quick grep
through the ISA and base OF specs turns up nothing.

> > >> +		device_type = "isa";
> > >> +		compatible = "simple-bus";
> > >
> > >What does "simple-bus" means ?
> > I added simple bus in order to get probed. But I now I rember that this
> > is also supported per device_type. I get rid of it.
> 
> device_type is a nasty bugger, we are trying to get rid of Linux
> reliance on it.
> 
> Things like "simple-bus" don't rock my boat either, it's adding to the
> device-tree "informations" that are specific to the way Linux will
> interpret it, which is not how it should be.

The motivation for simple-bus comes from Linux, but its definition is
OS-neutral.  It indicates that no special bus knowledge is required to
access the devices under it.

I don't think it applies to ISA, though -- I/O space is special bus
knowledge, and the "ranges" looks weird for memory-space as well.

If we're going to get rid of device_type here, it would be nice to have
some other way to indicate that this node follows the ISA binding,
without having to recognize an implementation-specific compatible.

-Scott
