From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Thu, 1 Jul 2010 08:59:16 -0700
Message-ID: <71b1d294-48d9-4408-941c-2400174954e1@VA3EHSMHS031.ehs.local>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com><1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com><aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local><AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com><20100629012207.GG13509@yookeroo>
	<7d85d675-2028-4942-a819-c97d2295ea3b@SG2EHSMHS007.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Class: urn:content-classes:message
In-Reply-To: <7d85d675-2028-4942-a819-c97d2295ea3b-RaUQJvECHitCYczPSvLbDrjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From:
devicetree-discuss-bounces+stephen.neuendorffer=xilinx.com-uLR06cmDAlaKREJ1Ck/qmQ@public.gmane.org
org [mailto:devicetree-
> discuss-bounces+stephen.neuendorffer=xilinx.com-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org] On
Behalf Of Stephen Neuendorffer
> Sent: Monday, June 28, 2010 9:51 PM
> To: David Gibson; grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Subject: RE: [PATCH] of/fdt: Add unflatten_partial_device_tree
> 
> 
> >> Another question is what to do with the unflattened tree once it is
> >> unflattened.  Some of the existing code expects the node to be part
of
> >> the global tree.  Those could either be refactored, or the new
partial
> >> tree could be grafted into the global tree.  Grafting will have the
> >> least impact, but it probably isn't a good idea in the long term.
> >> Grafting together unrelated trees seems messy to me.
> >
> >I think I must have missed an earlier discussion.  What's the use
case
> >for multiple fdt blobs?
> 
> Basically, we are building systems which have an FPGA sitting on a
PCIe.  The
> FPGA contains an internal bus with lots of devices.  From the
structural point
> of view, it seems to make sense to describe the connectivity of this
subsystem
> with a device tree: albeit a slightly strange one with no processor:
just a pcie<->plb
> bridge and a number of devices.  Since this subsystem is, in fact,
architecture independent
> (you could physically plug it into a PCIe slot on a system with any
processor architecture)
> it is a bit of a poster case for generalizing more of the device tree
infrastructure.
> In particular, we are most interested in doing this in X86 systems.
> 
> Which leads me back to the first question: My approach so far is that
the device
> tree fragment is completely independent of any toplevel device tree,
for the simple
> reason that on X86, there *isn't* a toplevel device tree...   The
devices that get generated
> are in the regular device structure, which is similar to the way pci
bridges and pcimcia
> drivers work.

Going down this path, I've taken an approach where the PCI driver reads
the PCI BARs which are set earlier
and stuffs the correct ranges=<> property into the device tree.  I think
this is necessary because (I believe)
powerpc programs the BARs based on the flat device tree, whereas on X86,
the BIOS enumerates the BARs and
everyone else just deals with it.  This should enable the device driver
to use the existing address translation
code in driver/of/address.c:of_address_to_resource().  The current
status is that I get something like:

OF: ** translation for device /plb@0/xps-hwicap@80030000 **
OF: bus is default (na=1, ns=1) on /plb@0
OF: translating address: 80030000
OF: parent bus is default (na=1, ns=1) on /
OF: walking ranges...
OF: default map, cp=80000000, s=10000000, da=80030000
OF: parent translation for: d0000000
OF: with offset: 30000
OF: one level translation: d0030000
OF: reached root node
of_icap d0030000.xps-hwicap: Xilinx icap port driver
of_icap d0030000.xps-hwicap: Couldn't lock memory region at d0030000
of_icap: probe of d0030000.xps-hwicap failed with error -16

Apparently because the address region is already assigned to the PCI
device.  I think I need to figure out how
PCI bridges declare their address range but don't lock it, so that the
device in the FPGA (in this case the ICAP) can
claim it later.

Steve




This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
