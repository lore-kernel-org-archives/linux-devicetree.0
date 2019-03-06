From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: Re: [PATCH 2/6] drivers/misc: Add Aspeed XDMA engine driver
Date: Tue, 05 Mar 2019 19:00:05 -0500
Message-ID: <e889a254-ec7e-49f5-bdb0-1d8d8a9063a6@www.fastmail.com>
References: <1551735420-16202-1-git-send-email-eajames@linux.ibm.com>
 <1551735420-16202-3-git-send-email-eajames@linux.ibm.com>
 <CAK8P3a0eS11_T9wk4iLRT7A94Lh9gSf5QNGH4--pdA5HdEGMCw@mail.gmail.com>
 <84551e54-0382-6042-48cb-842d79214a98@linux.ibm.com>
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <84551e54-0382-6042-48cb-842d79214a98@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org



On Wed, 6 Mar 2019, at 08:15, Eddie James wrote:
> 
> On 3/5/19 2:01 AM, Arnd Bergmann wrote:
> > On Mon, Mar 4, 2019 at 10:37 PM Eddie James <eajames@linux.ibm.com> wrote:
> >> The XDMA engine embedded in the AST2500 SOC performs PCI DMA operations
> >> between the SOC (acting as a BMC) and a host processor in a server.
> >>
> >> This commit adds a driver to control the XDMA engine and adds functions
> >> to initialize the hardware and memory and start DMA operations.
> >>
> >> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > Hi Eddie,
> >
> > Thanks for your submission! Overall this looks well-implemented, but
> > I fear we already have too many ways of doing the same thing at
> > the moment, and I would hope to avoid adding yet another user space
> > interface for a specific hardware that does this.
> >
> > Your interface appears to be a fairly low-level variant, just doing
> > single DMA transfers through ioctls, but configuring the PCIe
> > endpoint over sysfs.
> 
> Hi, thanks for the quick response!
> 
> There is actually no PCIe configuration done in this driver. The two 
> sysfs entries control the system control unit (SCU) on the AST2500 
> purely to enable and disable entire PCIe devices. It might be possible 
> to control those devices more finely with a PCI endpoint driver, but 
> there is no need to do so. The XDMA engine does that by itself to 
> perform DMA fairly automatically.

I had a series a while back to expose random bits from devices in sysfs. It got
shot down pretty well, but the main contention was over the devicetree
bindings.

I think we could revive it as a library-type thing that drivers can use to expose
bits like what you're describing without putting the grubby details in the
devicetree. The we would have a consistent approach to exposing otherwise
hard to describe functions (which is what a lot of a BMC turns out to be).

Andrew
