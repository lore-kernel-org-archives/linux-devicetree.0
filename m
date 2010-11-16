From: David VomLehn <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Subject: Re: Device tree with early buffer allocations and aliased memory
Date: Tue, 16 Nov 2010 15:21:55 -0800
Message-ID: <4CE31213.1040608@cisco.com>
References: <20101027184908.GA7669@dvomlehn-lnx2.corp.sa.net>
	<AANLkTi=OWBbB8vPNapxkBDiVRCoGS-sZ5-CXcKK0n8iv@mail.gmail.com>
	<20101103205037.GA15096@dvomlehn-lnx2.corp.sa.net>
	<20101110042537.GA4110@angua.secretlab.ca>
	<20101115231008.GA468@dvomlehn-lnx2.corp.sa.net>
	<20101116065718.GD4074@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101116065718.GD4074-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
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
Cc: Device Tree Mailing List <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/15/2010 10:57 PM, Grant Likely wrote:

...
> I'm not sure I completely follow you.  Any memory described in a
> device_type="memory" node will by default be used as system RAM by
> Linux.  If some of that region needs to be used for DMA buffers, then
> you'll need to make sure that when a driver allocates a buffer, that
> the buffer is made valid for DMA operations.  How you do this is
> architecture specific.
Okay, I think I've got this down
...
> what does 'stbus' mean?  If it is the hardware name for the bus, then
> it is probably a good choice.  'soc' is often used, but I'm not a big
> fan of that convention because it doesn't reflect the actual internal
> architecture of the chip.
Yes, this is what STMicroelectronics call their bus, specifically 
"STBus". Which looks like what the device tree calls a simple- bus.
...
>>>> 		compatible = "simple-bus";
>>>> 		#address-cells =<1>;
>>>> 		#size-cells =<1>;
>>>> 		dma-ranges =<0x10000000 0x1000000 0x0fc00000
>>>> 			0x20000000 0x10000000 0x0fc00000
>>>> 			0x2fc00000 0x2fc00000 0x10400000
>>>> 			0x60000000 0x60000000 0x20000000>;
...
> <digress into details of hardware design>
> Is a device legally able to DMA into the address range
> 0x20000000..0x2fbfffff instead of 0x10000000..0x1fbfffff?  What is the
> reason for dma'ing to base 0x10000000 for the first 0xfc00000, and to
> base 0x20000000 for the second if the two ranges are simple aliases of
> each other?
>
>  From your earlier description it sounded like the 0x10000000 alias is
> only to provide Linux with RAM to run out of, but the real ram base
> address is 0x20000000.  As such, it still sounds like the dma-ranges
> should cover the entire physical memory region from
> 0x20000000..0x3fffffff, and not reference the 0x10000000 alias at all.
> </digress>
Think I've got it--the 0x10000000-0x1fc00000 is not visible to DMA 
devices, so it doesn't belong in the dma-ranges, only those address that 
can actually be given to DMA devices. So, I'll drop the first triplet 
and keep the others.
...
> I'd just go with the explicit ranges simply because it is simpler.  If
> it was a more common use-case, then I might have a different opinion,
> but since it is an oddball case I'd stick with familiar patterns for
> specifying dma constraints.
Sounds good.
> g.
Thanks!
