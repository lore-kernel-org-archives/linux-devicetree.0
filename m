From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 03/12] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Wed, 19 Jun 2013 21:08:30 +0200
Message-ID: <201306192108.30998.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306182345.26281.arnd@arndb.de> <20130619185224.GB5701@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130619185224.GB5701@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 19 June 2013, Ezequiel Garcia wrote:
> > > What happens is that any decoding window that was setup by the bootloader,
> > > is wiped and completely new windows are allocated using the translations
> > > in the DT, as described by this binding.
> > > 
> > > This was the case from the start with the old MBus driver. FWIW, I think
> > > it's actually the best choice that can be made: it makes the kernel
> > > independent of the previous setting.
> > > 
> > > I know you've suggested differently in the past, but I'm not sure I
> > > understand what's the benefit in keeping the bootloaders configuration.
> > 
> > The device tree normally describes things that are either wired up
> > in hardware or set up by the boot loader. Describing things that the
> > boot loader may or may not have set up and that the kernel should
> > set up but may ignore if it wants to is a bit fishy, but it seems
> > that you have decided to do it that way. You should definitely
> > document the fact that all ranges except the "internal-regs" are just
> > suggestions and cannot be relied on to be present at boot time.
> > 
> 
> Hold on! I've just noticed this, and I want to clarify something, just
> to avoid mis-interpretations. The binding is not saying "the windows
> described through this ranges are present at boot time".
> 
> Rather, it is "this binding will guarantee that the windows described 
> in it will be present after the mbus allocates them".
> 
> Does it sound too fishy?

I don't think it's a guarantee that the binding can make. The binding
describes the interface between the hardware/firmware and the kernel,
not an interface between one kernel driver and another.

You could instead write:

"The ranges property defines a set of mbus windows that are expected
to be set by the operating system and that are guaranteed to be free
of overlaps with one another or with the system memory ranges.
Each entry in the property refers to exactly one window. If an
operating system choses to use a different set of mbus windows,
it must ensure that any address translations performed from downstream
devices are adapted accordingly. The operating system may insert
additional mbus windows that do not conflict with the ones listed
in the ranges, e.g. for mapping PCIe devices. As a special case,
the internal register window must be set up by the boot loader
at the address listed in the ranges property, since the operating
uses it to set up the other windows."

	Arnd
