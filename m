From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 6 Jul 2010 16:57:13 -0600
Message-ID: <AANLkTikaWO58QAzkcYbGOw3JnW7bpbrPsBk9-t9hQPGF@mail.gmail.com>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
	<AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
	<20100629012207.GG13509@yookeroo>
	<7d85d675-2028-4942-a819-c97d2295ea3b@SG2EHSMHS007.ehs.local>
	<71b1d294-48d9-4408-941c-2400174954e1@VA3EHSMHS031.ehs.local>
	<20100702041810.GI8385@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100702041810.GI8385@yookeroo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 1, 2010 at 10:18 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Jul 01, 2010 at 08:59:16AM -0700, Stephen Neuendorffer wrote:
> [snip]
>> Going down this path, I've taken an approach where the PCI driver reads
>> the PCI BARs which are set earlier
>> and stuffs the correct ranges=3D<> property into the device tree. =A0I t=
hink
>> this is necessary because (I believe)
>> powerpc programs the BARs based on the flat device tree, whereas on X86,
>> the BIOS enumerates the BARs and
>
> Only on some powerpc subplatforms, I believe. =A0Some platforms have
> minimal firmwares that either don't configure the BARs at all, or get
> them so hopelessly wrong that we have to reconfigure everything anyway.

On powerpc without OFW, typically the device tree specifies the host
bridge BARs, and then the kernel enumerates the devices.  The device
tree usually doesn't specify where the child devices get located, but
it does tell the PCI subsystem what address ranges are available.

If OFW is present, then the kernel can usually adopt whatever OFW did
during enumeration.

In your situation, yes you will have to read the BAR settings provided
by the PCI subsystem and populate the ranges property correctly.

>> OF: ** translation for device /plb@0/xps-hwicap@80030000 **
>> OF: bus is default (na=3D1, ns=3D1) on /plb@0
>> OF: translating address: 80030000
>> OF: parent bus is default (na=3D1, ns=3D1) on /
>> OF: walking ranges...
>> OF: default map, cp=3D80000000, s=3D10000000, da=3D80030000
>> OF: parent translation for: d0000000
>> OF: with offset: 30000
>> OF: one level translation: d0030000
>> OF: reached root node
>> of_icap d0030000.xps-hwicap: Xilinx icap port driver
>> of_icap d0030000.xps-hwicap: Couldn't lock memory region at d0030000
>> of_icap: probe of d0030000.xps-hwicap failed with error -16
>>
>> Apparently because the address region is already assigned to the PCI
>> device. =A0I think I need to figure out how
>> PCI bridges declare their address range but don't lock it, so that the
>> device in the FPGA (in this case the ICAP) can
>> claim it later.

You also need to make sure your devices are children of the pci_device
so that they can claim the memory regions that they use.  If it isn't
a child, then it cannot claim the same region.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
