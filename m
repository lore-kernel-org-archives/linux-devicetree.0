From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] arm64: Add architecture support for PCI
Date: Tue, 04 Feb 2014 19:34:50 +0100
Message-ID: <8676627.b6SYsazoah@wuerfel>
References: <1391453028-23191-1-git-send-email-Liviu.Dudau@arm.com>
 <13031998.NR888KZWhk@wuerfel> <20140204181514.GA25695@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140204181514.GA25695@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 February 2014 11:15:14 Jason Gunthorpe wrote:
> On Tue, Feb 04, 2014 at 10:44:52AM +0100, Arnd Bergmann wrote:
> 
> >   Now I want to integrate the EHCI into my SoC and not waste one
> >   of my precious PCIe root ports, so I have to create another PCI
> >   domain with its own ECAM compliant config space to put it into.
> >   Fortunately SBSA lets me add an arbitrary number of PCI domains,
> >   as long as they are all strictly compliant. To software it will
> 
> Just to touch on this for others who might be reading..
> 
> IMHO any simple SOC that requires multiple domains is *broken*. A
> single domain covers all reasonable needs until you get up to
> mega-scale NUMA systems, encouraging people to design with multiple
> domains only complicates the kernel :(

Well, the way I see it, we already have support for arbitrary
PCI domains in the kernel, and that works fine, so we can just
as well use it. That way we don't have to partition the available
256 buses among the host bridges, and anything that needs a separate
PCI config space can live in its own world. Quite often when you
have multiple PCI hosts, they actually have different ways to
get at the config space and don't even share the same driver.

On x86, any kind of HT/PCI/PCIe/PCI-x bridge is stuffed into a
single domain so they can support OSs that only know the
traditional config space access methods, but I don't see
any real advantage to that for other architectures.

> SOC internal peripherals should all show up in the bus 0 config space
> of the only domain and SOC PCI-E physical ports should show up on bus
> 0 as PCI-PCI bridges. This is all covered in the PCI-E specs regarding
> the root complex.
> 
> Generally I would expect the internal peripherals to still be
> internally connected with AXI, but also connected through the ECAM
> space for configuration, control, power management and address
> assignment.

That would of course be very nice from a software perspective,
but I think that is much less likely for any practical
implementation.

> > 2. all address windows are set up by the boot loader, we only
> >   need to know the location (IMHO this should be the
> >   preferred way to do things regardless of SBSA).
> 
> Linux does a full address map re-assignment on boot, IIRC. You need
> more magics to inhibit that if your BAR's and bridge windows don't
> work.
> 
> Hot plug is a whole other thing..

I meant the I/O and memory space windows of the host bridge here,
which typically don't get reassigned (except on mvebu). For the
device resources, there is a per-host PCI_REASSIGN_ALL_RSRC
flag and pcibios_assign_all_busses() function that we typically
set on embedded systems where we don't trust the boot loader
to set this up correctly, or at all.

On server systems, I would expect to have the firmware assign
all resources and the kernel to leave them alone. On sparc
and powerpc servers, there is even a third method, which
is to trust firmware to put the correct resources for each
device into DT, overriding what is written in the BAR.

> > it's possible that the designware based ones get point 4 right.
> 
> The designware one's also appear to be re-purposed end point cores, so
> their config handling is somewhat bonkers. Tegra got theirs sort of
> close because they re-used knowledge/IP from their x86 south bridges -
> but even then they didn't really implement ECAM properly for an ARM
> environment.
> 
> Since config space is where everyone to date has fallen down, I think
> the SBSA would have been wise to list dword by dword what a typical
> ECAM config space should look like.

I absolutely agree.

	Arnd
