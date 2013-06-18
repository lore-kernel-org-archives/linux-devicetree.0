From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 11/12] ARM: mvebu: Relocate Armada 370 PCIe device tree
 nodes
Date: Tue, 18 Jun 2013 19:18:58 +0200
Message-ID: <201306181918.59046.arnd@arndb.de>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306181829.35514.arnd@arndb.de> <20130618191535.44fe595c@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130618191535.44fe595c@skate>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 18 June 2013, Thomas Petazzoni wrote:
> > To clarify my earlier comment, I think it would be nicer to write this as
> > 
> >                        ranges =
> >                               <0x82000000 0 0x40000    0xffff0001 0x40000 0 0x00002000
> >                                0x82000000 0 0x80000    0xffff0001 0x80000 0 0x00002000
> >                                0x82000000 1 0 MBUS_ID(0x12, 0x34) 0  1 0
> >                                0x82000000 2 0 MBUS_ID(0x13, 0x34) 0  1 0
> >                                0x81000000 1 0 MBUS_ID(0x12, 0x35) 0 0 0x10000;
> >                                0x81000000 2 0 MBUS_ID(0x13, 0x35) 0 0 0x10000>;
> > 
> > The MBUS_ID numbers above are made up since I don't know them, but this way you can
> > describe how the entire 4GB MMIO address space of the PCI bus is mapped into the
> > MBUS address space.
> 
> This is NOT possible because we don't know in advance how much memory
> space and I/O space each PCIe device will require.
> 
> Arnd, we've discussed this at length with you while getting the PCIe
> driver merged, and we've explained this to you numerous times. Could
> you please understand that any of your proposal that suggests writing
> down static windows for PCIe devices will not work?

Where did I suggest static windows for PCIe devices?

	Arnd
