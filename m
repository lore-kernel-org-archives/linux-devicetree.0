From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Fri, 2 Jul 2010 14:18:10 +1000
Message-ID: <20100702041810.GI8385@yookeroo>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
	<AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
	<7d85d675-2028-4942-a819-c97d2295ea3b@SG2EHSMHS007.ehs.local>
	<71b1d294-48d9-4408-941c-2400174954e1@VA3EHSMHS031.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <71b1d294-48d9-4408-941c-2400174954e1-+Ck8Kgl/v0/nHLUNXTEFU7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 01, 2010 at 08:59:16AM -0700, Stephen Neuendorffer wrote:
[snip]
> Going down this path, I've taken an approach where the PCI driver reads
> the PCI BARs which are set earlier
> and stuffs the correct ranges=<> property into the device tree.  I think
> this is necessary because (I believe)
> powerpc programs the BARs based on the flat device tree, whereas on X86,
> the BIOS enumerates the BARs and

Only on some powerpc subplatforms, I believe.  Some platforms have
minimal firmwares that either don't configure the BARs at all, or get
them so hopelessly wrong that we have to reconfigure everything anyway.

> everyone else just deals with it.  This should enable the device driver
> to use the existing address translation
> code in driver/of/address.c:of_address_to_resource().  The current
> status is that I get something like:
> 
> OF: ** translation for device /plb@0/xps-hwicap@80030000 **
> OF: bus is default (na=1, ns=1) on /plb@0
> OF: translating address: 80030000
> OF: parent bus is default (na=1, ns=1) on /
> OF: walking ranges...
> OF: default map, cp=80000000, s=10000000, da=80030000
> OF: parent translation for: d0000000
> OF: with offset: 30000
> OF: one level translation: d0030000
> OF: reached root node
> of_icap d0030000.xps-hwicap: Xilinx icap port driver
> of_icap d0030000.xps-hwicap: Couldn't lock memory region at d0030000
> of_icap: probe of d0030000.xps-hwicap failed with error -16
> 
> Apparently because the address region is already assigned to the PCI
> device.  I think I need to figure out how
> PCI bridges declare their address range but don't lock it, so that the
> device in the FPGA (in this case the ICAP) can
> claim it later.
> 
> Steve
> 
> 
> 
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 
> 

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
