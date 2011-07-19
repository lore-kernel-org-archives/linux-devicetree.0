From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/7] tty: serial: support device tree in pxa
Date: Tue, 19 Jul 2011 22:17:27 +0200
Message-ID: <2932110.niB1oCsTtu@wuerfel>
References: <20110719194010.GI6848@ponder.secretlab.ca>
	<CACxGe6u1Pq990opdt7irttuY1OvpZVNXSM11cLdqo5zN8YpYeg@mail.gmail.com>
	<20110719200515.GB308@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110719200515.GB308@n2100.arm.linux.org.uk>
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
Cc: eric.y.miao@gmail.com, nico@fluxnic.net, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, haojian.zhuang@gmail.com, Grant Likely <grant.likely@secretlab.ca>, ben-linux@fluff.org, khali@linux-fr.org, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Tuesday 19 July 2011 21:05:15 Russell King - ARM Linux wrote:
> On Tue, Jul 19, 2011 at 01:53:53PM -0600, Grant Likely wrote:
> > On Tue, Jul 19, 2011 at 1:48 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > > Right. We should probably rename of_serial to 8250_of and remove the qpace
> > > parts from the driver.
> > 
> > In fact, I think we've got about 3 devtree drivers for 8250 serial
> > ports.  I think it is about time for some consolidation work.  :-)
> > 
> > I wonder if we can roll of_serial directly into the 8250.c driver.
> 
> The original serial.c got split into 8250.c, plus several probe modules
> (8250_pnp.c, 8250_pci.c, etc) to get around the problem of lots of
> bus specific crap appearing in the main driver.  8250_of.c would follow
> on that theme.

Yes. Going even further, I'd actually like to pull the ISA bits and the
platform driver out of the 8250.c file as well. While it would be
possible to combine the platform driver with the of driver, I don't
think that's too useful in case of 8250 because the two actually
look quite different.

	Arnd
