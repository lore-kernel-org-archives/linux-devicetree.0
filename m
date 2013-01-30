From: "Saridakis, Dean   (US SSA)" <dean.saridakis-IHqVjY1oUdQxoycv7ERPSQ@public.gmane.org>
Subject: RE: DTs, Linux drivers & PCI Devices
Date: Wed, 30 Jan 2013 00:58:59 +0000
Message-ID: <20130130005944.AE5612C00DA@ozlabs.org>
References: <20130129051244.GH16729@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130129051244.GH16729-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > I've been diving into Linux kernel drivers & device trees for a new project &
> am looking for some help.
> >
> > First, is it reasonable/possible to define a PCI (PCIe) device in a
> > device tree? Seems like you'd have to reference a BAR#s to do this (&
> > still have addresses mapped by enumeration).  A couple reasons I'm
> > interested in doing this:
> > - The PCI device logic will be migrated to a system bus
> > - DT properties provide a nice way to pass in driver configuration
> > data
> 
> It's certainly possible.  On traditional OF systems, PCI devices are always
> shown in the device tree (and only OF, not the OS does the PCI probing).
> Only including the host bridges in flattened trees is essentially a relaxation of
> the usual rules, because it's usually not necessary and can be awkward for a
> flat tree system.
> 

I'm learning as I go here, thanks for your patience:
- I'm using U-boot & just discovered it modifies the device tree
- From what I read in the spec's you referenced, seems like the assigned-addresses (assigned-address?) property would be the how the BAR window addresses would be passed to the OS.

So not sure if U-boot boardsetup can be convinced to create or fill in PCI device nodes in the DT. Looks like it's based on your libfdt (thank you!), but details are "left as an excercise for the reader." 

And if I could get U-boot to fill things in, it's not clear if/how linux kernel init would handle it. 
(Saw a reference to "PCI OF bindings" in booting-without-of.txt, but wasn't sure what that was referencing...)

If that were to all come together, I'd also like to define child nodes under a PCI device BAR node. (That'd be the most elegant approach.) Since "reg" is used to define the child register offsets within the BAR address space, but the BAR address is established w/ assigned-addresses, not sure how those dots would connect. 
I guess an example of how a traditional OF system would represent a PCI device would clear up some of my confusion - any pointers?

> > It's not clear to me how the linux kernel interprets/processes the
> > device tree. I'm working w/ powerpc (fsl QorIQ). E.g., shouldn't
> > everything from the DT show up in /sys/bus/platform/devices ?
> 
> Not necessarily, no.  platform devices are sort of a last-resort place for things
> that aren't on a well defined bus.  That usually includes top level devices from
> an fdt, and often includes things further down the fdt for platform specific
> buses.  But things like PCI devices, or i2c devices or what have you will still
> appear under the appropriate bus types.
> 
> > I
> > noticed that not everything is there, e.g., only 2 of the 4 PCIe RCs.
> > (Noticed this after trying to add my own simple dummy entry to a
> > reserved reg space as an experiment).
> 
> Hrm.  Not showing all the RCs is a bit odd, though.

Looks like U-boot boardsetup filtered these out.

> 
> > Ultimately I'd like to use the DT to describe a set of logic cores on
> > a subordinate bus. There is also a subordinate interrupt controller,
> > which I think I can figure out how to describe, but am not sure how
> > kernel glue works -- somehow I'd need to bind that controller to
> > routing code I provide.
> >
> > Documentation I've been reading includes:
> > - ePAPR
> > - DT wiki
> > - kernel doc (driver-model, devicetree)
> > - Linux DDs v3 (no coverage of platform drivers) Any other recommended
> docs?
> 
> Although large parts of it won't be terribly relevant to you, you should
> probably look at the original OF spec - IEEE 1275, and also the PCI Bus binding
> document for IEEE 1275.
> 
> http://www.complang.tuwien.ac.at/forth/1275.ps.gz
> 
> http://www.openfirmware.org/ofwg/bindings/pci/pci2_1.pdf
> 
> --
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson

Hope I didn't ramble too much -- getting tired...
