From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] Merging device trees at runtime for module-based systems
Date: Fri, 2 Nov 2012 15:53:52 +1100
Message-ID: <20121102045352.GP27695@truffula.fritz.box>
References: <5087B919.2010006@gmail.com> <508AD8F9.8030105@wwwdotorg.org>
 <5091AD78.3060701@gmail.com> <5091BAAA.5010809@firmworks.com>
 <5091FC38.2020806@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5091FC38.2020806-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 31, 2012 at 10:36:08PM -0600, Stephen Warren wrote:
> On 10/31/2012 05:56 PM, Mitch Bradley wrote:
> > On 10/31/2012 1:00 PM, Daniel Mack wrote:
> >> cc devicetree-discuss. Here's a reference to the full thread:
> >>
> >>   http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/145221/
> >>
> >> On 26.10.2012 20:39, Stephen Warren wrote:
> >>> On 10/24/2012 03:47 AM, Daniel Mack wrote:
> >>>> Hi,
> >>>>
> >>>> a project I'm involved in uses a module/baseboard combo, and components
> >>>> on either board are described in DT. I'm currently using separate dts
> >>>> files which build upon each other with include statements, which works
> >>>> fine for development.
> >>>>
> >>>> In production though, we will certainly have running changes (and hence
> >>>> different versions) over the lifetime of the product for both the
> >>>> baseboard and the module, and the hardware has support for identifying
> >>>> the versions of both sides at runtime.
> ...
> >> I start to believe that the cleanest solution to this would be to
> >> have full DTC functionality in U-Boot and compile the tree
> > 
> > ... which is exactly the way that Open Firmware does it, since the
> > invention of the device tree.  The model is that the boot firmware,
> > which needs to know the system configuration to do its job anyway,
> > exports that configuration via the device tree.
> 
> Doesn't OF generate the DT from internal data structures (although I
> don't know where those come from...),

Well.. in OF the device tree *is* a core live data structure.  It will
be constructed as devices are probed, firmware level device drivers
are attached to it and it might be modified by client interface
operations.  Traditionally there is no tree in the flattened format,
only the live tree which clients will query with OF calls.  Some
recent OF implementations do use the flat tree in some ways - we've
had some systems where a flattened tree is provided by an early boot
to the full OF; it acts as a skeleton that is then extended in OF's
live tree.  We've also had some OF implementations that for
compatiblity with kernels that expect a flattened tree flatten their
internal tree structure into the FDT format as the last thing before
entering the OS.

> whereas what Daniel mentions above
> is more like the bootloader having access to a bunch of .dts fragments,
> selecting the appropriate subset of those to use, parsing them into an
> internal data structure (i.e. running dtc), and then generating a DTB
> from it. The overall result is that the bootloader causes a DTB to be
> generated at run-time, so at that level it's the same, but the
> implementation seems pretty different.

How OF constructs its internal tree can vary a lot with the OF
implementation, and I'm not terribly clear on what you had in mind, so
I don't think either side is really sufficiently well defined to
really say if they're similar or not.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
