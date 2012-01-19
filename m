From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v6 9/9] ARM: vexpress: Add Device Tree for V2P-CA15
 core tile (TC1 variant)
Date: Thu, 19 Jan 2012 17:50:53 +0000
Message-ID: <20120119175053.GE10404@n2100.arm.linux.org.uk>
References: <1323957761-13553-1-git-send-email-pawel.moll@arm.com>
 <1323957761-13553-10-git-send-email-pawel.moll@arm.com>
 <4F0C495C.4000103@citrix.com>
 <1326979652.32197.66.camel@hornet.cambridge.arm.com>
 <4F181BD9.20401@gmail.com>
 <1326980594.32197.67.camel@hornet.cambridge.arm.com>
 <4F182248.7070209@gmail.com>
 <1326984672.32197.68.camel@hornet.cambridge.arm.com>
 <4F184C48.2050505@citrix.com>
 <1326994035.13748.7.camel@hornet.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326994035.13748.7.camel-okZbbLrgpR/YkXV2EHHjLW3o5bpOHsLO@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2012 at 05:27:15PM +0000, Pawel Moll wrote:
> On Thu, 2012-01-19 at 17:00 +0000, David Vrabel wrote:
> > The problem wasn't with including skeleton.dtsi.  
> 
> Including as it is creates two device_type="memory" nodes, one with
> regs=<0 0>, which is definitely wrong.
> 
> > With
> > CONFIG_ARM_ATAG_DTB_COMPAT the zImage decompressor modifies the appended
> > DTB using information from the ATAGs (see atags_to_fdt()).
> > 
> > If there's an ATAG giving the amount of RAM the DTB's "memory" node is
> > replaced with a new one.  Since the vexpress DTBs don't have a "memory"
> > node it's added and the DTB ends up with two nodes describing memory.
> 
> The "memory@address" node name is in my opinion perfectly legal - p. 3.4
> of the DT spec says "The name component of the node name (see 2.2.1)
> shall be memory.". So the decompressor code may be wrong in looking for
> adress-less "memory" node...

I don't think you can expect such early code to properly parse a DT tree
with a variability in how memory stuff is declared into that DT tree.

What if you have two memory nodes specified in the DT file, and the
ATAG data contains one?

The more I look at this, the more I'm convinced that Grant's idea that
DT should entirely override ATAGs all the way to the kernel proper was
the wrong solution - at least in the kernel, if we had both available,
we could make a choice there, and have the full DT library to be able
to manipulate the DT blob.

Unfortunately, that's not so, so we're just going to have to accept
that on ARM it should be "memory" if we want the ATAG code to override
it.  Expecting the decompressor to figure out that it needs to delete
DT nodes and all that I think is asking far too much.
