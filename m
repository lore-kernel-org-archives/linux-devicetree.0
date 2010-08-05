From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: Request review of device tree documentation
Date: Thu, 5 Aug 2010 14:43:25 +1000
Message-ID: <20100805044325.GC25458@yookeroo>
References: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTilK4YkRMJqlcRDOAlGBzpdlZuSo9NF5NrRNocHT-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 11, 2010 at 04:59:46PM -0600, Grant Likely wrote:
> I've been doing a bit of work on some introductory level documentation
> of the flattened device tree.  I've got a rough copy up on the
> devicetree.org wiki, and I could use some feedback.  If anyone has
> some time to look at it, you can find it here:
> 
> http://devicetree.org/Device_Tree_Usage

Sorry I haven't replied sooner, I've been away, then sick and
generally preoccupied.  Still here are some comments now.

How Addressing Works:

 * Small inconsistency you use "address1", "address2" then "unit-address3".

 * Perhaps re-emphasise that a parent's #*-cells properties govern the
   children's reg properties, not its own, since this is a common
   misunderstanding..

Non Memory Mapped Devices:

 * Your phrasing here suggests that non-memory-maped == zero
   size-cells, which is not always true.

Ranges (Address Translation):

 * Third paragraph, first sentence is a grammatical dogs' breakfast,

How Interrupts Work:

 * Bogus paragraph break partway through first sentence.

 * At the end you say the second cell indicates the interrupt's
   polarity, but you don't specify how this is encoded.  It might be
   worth emphasising that while most interrupt specifiers do include
   trigger and polarity type information, the encoding of it can and
   does vary between interrupt controllers.

Advanced Sample Machine:

 * The unit address in the name shouldn't have a "0x" prefix

Advanced Interrupt Mapping:

 * Perhaps worth noting that while a PCI *card* will use INTA..INTD,
   on-board PCI devices can, and frequently do, have interrupts wired
   side-band to the PCI bus, directly to the main interrupt
   controller.

 * In your example, you're muddying the waters of your previous usage
   of interrupt-parent.  The PCI child nodes have the PCI top-level
   node as their implicit interrupt parent, because its their first
   ancestor with an interrupt-map, and we hit that before the
   interrupt-parent property specified at the very top level.  This
   means amongst other things that if there are PCI devices with
   seperately wired interrupts, they must explicitly set
   interrupt-parent to bypass the normal PCI interrupt mapping.


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
