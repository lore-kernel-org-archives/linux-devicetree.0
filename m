From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Sat, 2 Jul 2011 13:25:27 +0100
Message-ID: <20110702122527.GH21898@n2100.arm.linux.org.uk>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201106301236.25822.arnd@arndb.de>
	<BANLkTikoMu3ccUxj5KRmKzdReQcBqK4Y9Q@mail.gmail.com>
	<201107011819.43316.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201107011819.43316.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, Barry Song <21cnbao@gmail.com>, workgroup.linux@csr.com, Grant Likely <grant.likely@secretlab.ca>, weizeng.he@csr.com, Olof Johansson <olof@lixom.net>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 01, 2011 at 06:19:43PM +0200, Arnd Bergmann wrote:
> On Friday 01 July 2011, Barry Song wrote:
> > It looks like we can new a common function named as of_io_earlymap()
> > or something in drivers/of/address.c. of_iomap() does ioremap,
> > of_io_earlymap() does early static mapping?
> > Then all SoCs can call this function to do early static mapping. if
> > so, some lines can be deleted in sirfsoc_of_clk_init(). How do you
> > think about newing the function in drivers/of/address.c?
> 
> I think that's a good idea, but the ARM specific implementation cannot
> be in common code. Other architectures have stuff similar to iotable_init
> in asm/fixmap.h. If we decide on a function prototype for this, the
> implementation can be arch/*/.

One of the issues with fixmap is that its based around single pages
and indexing an area.  It's idiotic to use such a thing if you have
to map the ISA memory regions for VGA.

Plus, of course, forcing everything down the route of ioremap() and
fixmap forces everyone to use 2-level page tables and 4K page table
entries, avoiding the possibility of having just a single 1st level
page table entry covering their IO space.  Not only does it increase
TLB pressure but it also makes page table walking more expensive.
