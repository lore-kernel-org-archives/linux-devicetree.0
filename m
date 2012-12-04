From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: DT and probeable devices...
Date: Wed, 5 Dec 2012 10:04:36 +1100
Message-ID: <20121204230436.GB5217@truffula.fritz.box>
References: <50BDF6B5.7070306@codethink.co.uk>
 <CACxGe6vDNu04HtHVLBS6fJ5GDVfGb1dD7fq-HPh+vmcc+FWxcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vDNu04HtHVLBS6fJ5GDVfGb1dD7fq-HPh+vmcc+FWxcQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 04, 2012 at 02:05:33PM +0000, Grant Likely wrote:
> On Tue, Dec 4, 2012 at 1:12 PM, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org> wrote:
> > Hi,
> >
> > Im working on the OMAP5 pandaboard, and have run across a corner case.
> >
> > the Ethernet is USB attached (and thus discovered / probed by the USB
> > controller).
> >
> > However it has a reset line thats a GPIO on the board.
> >
> > Is DT supposed to be able to cover cases like this? If so, how?
> 
> USB devices can be described as child nodes of the USB bus, though
> they typically aren't because as you mention the USB bus is
> discoverable. There is a binding for USB devices[1]. I don't believe
> the kernel currently does anything to match USB dt nodes with a
> usb_device, but it wouldn't be hard to hook up. You'd probably need a
> hook in usb_new_device() to attach the of_node to the usb_device if it
> exists. Then the driver would have the ability to query the DT node
> for things like gpios.
> 
> [1] http://www.openfirmware.org/1275/bindings/usb/usb-1_0.ps

In a more general sense, probeable devices with some small
non-probeable parts are not new, though I haven't heard of it with usb
before.  It is very common (or it was, maybe less now in PCIe days) to
have on-board PCI devices, which are probeable of course, but which
have their interrupts routed directly to the PIC in a non-probeable
way.  Standard DT practice in those cases is to include a DT node for
the device, although you can leave out most of the contents except,
obviously, for the interrupt routing information.

As Grant says, extending this practice for USB is conceptually
straightforward, though there will be a bit of implementation work.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
