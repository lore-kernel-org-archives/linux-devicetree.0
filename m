From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: How to register GPIOs over PCI
Date: Wed, 15 Sep 2010 14:29:46 -0600
Message-ID: <20100915202946.GA5001@angua.secretlab.ca>
References: <1054265387.16.1284579451319.JavaMail.open-xchange@proteus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1054265387.16.1284579451319.JavaMail.open-xchange@proteus>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Schwarz,Andre" <andre.schwarz-P0pTl12WyEgpBod+wgzj8A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Anton Vorontsov <avorontsov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 15, 2010 at 09:37:31PM +0200, Schwarz,Andre wrote:
> Grant, Anton,
> 
> reading through the of/gpio docs and thinking about some improvements for our
> proprietary "ancient" code gives a lot of opportunities for major improvements
> ... since you are authors and your quick help in the past is really appreciated
> I dare to address you directly ;-)
> 
> On some (mostly PowerPC) based boards we have NAND-Flash connected to a PCI
> FPGA.
> There's no NAND controller inside ... just bitbang. Currently there's an
> implementation using "struct nand_chip" + hooks + nand_scan() inside the pci
> driver. Since the driver is designed to do other things and is not available
> during boot (=no RFS on Nand) I definitely want to get rid of this.

Why?  This sounds like entirely the right way to go about it.  Have
the PCI device register a gpio-nand device at probe time and you're
good to go.  As long as the driver is built into the kernel there
should be no problems with rootfs on NAND.

> To me it looks like we could use the "gpio-nand" driver. All we need is
> registering the proper (mem mapped) GPIOs with the required names via
> device-tree. As far as I understand the FPGA can be considered an
> of_mm_gpio_chip ?
> 
> Honestly I don't know how to define it using dts syntax.
> 
> All we have regarding PCI is general bus ranges, devsel and irq lines ... and of
> course the offset inside the FPGA.
> I've not seen a direct representation of a PCI device - only SoC components.

There is a binding for PCI devices.  Search for Open Firmware PCI
binding specification.

> How am I supposed to handle the unknown (=dynamically assigned) base address ?
> Since the system also has PCI slots I can't make sure to always get the same
> adress ...

This gets harry.  You could populate the pci bus with a node for the
FPGA, and the associated gpios and the desired address range (but I
think you'd have to add support for matching probed PCI devices with
the device tree node in the powerpc PCI setup code; probably a good
idea, but also probably something you don't want to tackle.)

If your bootloader assigns the PCI address ranges for you, then you
can also get it to update the .dtb file with the assigned addresses
(or even set it up statically). 

Either way, the kernel doesn't handle this use case well at the
moment.

g.
