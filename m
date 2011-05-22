From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Sun, 22 May 2011 12:00:46 +0200
Message-ID: <201105221200.46810.rjw@sisk.pl>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>
	<20110521234725.GB17672@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110521234725.GB17672@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kevin Hilman <khilman@ti.com>, Segher Boessenkool <segher@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jeremy Kerr <jeremy.kerr@canonical.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sunday, May 22, 2011, Russell King - ARM Linux wrote:
> On Sat, May 21, 2011 at 11:42:34AM -0600, Grant Likely wrote:
> > Russell, it seems to me that the primary behaviour that amba_bus has
> > over platform_bus is the clock management, and secondarily
> > verification of the type of device by the device id.  Am I correct, or
> > am I missing something?
> 
> It matches by vendor/device ID just like PCI does, and does the bus
> clock management and power management in a really nice way, which I
> doubt platform devices will ever do.

Then we should use the AMBA bus where possible.  Also, if there are
AMBA devices that currently pretend to be platform devices, they should be
converted back to AMBA.

> The way this discussion is going, I'm going to suggest that we also
> convert PCI stuff to being platform devices too.  I don't see the
> point of PCI existing for all the same reasons being given in this
> thread.

I agree.

Thanks,
Rafael
