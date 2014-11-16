From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: [PATCH 5/6] sunxi: video: Add simplefb support
Date: Sun, 16 Nov 2014 16:11:37 +0000
Message-ID: <1416154297.25454.24.camel@hellion.org.uk>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>
			 <1415984088-6800-6-git-send-email-hdegoede@redhat.com>
		 <1416138607.25454.13.camel@hellion.org.uk> <5468AC2E.80601@redhat.com>
	 <1416148688.25454.22.camel@hellion.org.uk> <5468BE9A.8050501@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5468BE9A.8050501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2014-11-16 at 16:11 +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/16/2014 03:38 PM, Ian Campbell wrote:
> > devicetree@, comments on the requirement that a node have a specific
> > path welcomed.
> > 
> > On Sun, 2014-11-16 at 14:52 +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 11/16/2014 12:50 PM, Ian Campbell wrote:
> >>> On Fri, 2014-11-14 at 17:54 +0100, Hans de Goede wrote:
> >>>> From: Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
> >>>>
> >>>> Add simplefb support, note this depends on the kernel having support for
> >>>> the clocks property which has recently been added to the simplefb devicetree
> >>>> binding.
> >>>
> >>> Link please, Linus's tree[0] doesn't seem to have it yet, I suppose it
> >>> is in some maintainer tree at the moment? It's not even in linux-next
> >>> yet though[1]. Maybe simple-framebuffer.txt isn't the right place to
> >>> look?
> >>
> >> Right now it is sitting here, which is the fbdev maintainers official tree:
> >> https://git.kernel.org/cgit/linux/kernel/git/tomba/linux.git/log/?h=for-next
> >>
> >>>
> >>> [0] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> >>> [1] https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> >>>
> >>>> +#if defined(CONFIG_OF_BOARD_SETUP) && defined(CONFIG_VIDEO_DT_SIMPLEFB)
> >>>> +void
> >>>> +sunxi_simplefb_setup(void *blob)
> >>>> +{
> >>>> +	static GraphicDevice *graphic_device = &sunxi_display.graphic_device;
> >>>> +	const char *node = "/chosen/framebuffer0-hdmi";
> >>>> +	const char *format = "x8r8g8b8";
> >>>
> >>> The bindings doc currently says:
> >>>         
> >>>         - format: The format of the framebuffer surface. Valid values are:
> >>>           - r5g6b5 (16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b).
> >>>           - a8b8g8r8 (32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r).
> >>>         
> >>> Perhaps x8r8g8b8 is defined in the updated version?
> >>
> >> Erm, no, I don't think anyone has actually bothered to keep the list in the
> >> binding up2date with what the kernel actually supports, x8r8g8b8 has been
> >> supported in the kernel before sunxi + simplefb every became a topic.
> > 
> > That's a shame, OS authors shouldn't really be expected to scrobble
> > about in Linux source to figure out what a binding is.
> > 
> >>>> +	const char *okay = "okay";
> >>>> +	char name[32];
> >>>> +	fdt32_t cells[2];
> >>>> +	int offset, stride, ret;
> >>>> +
> >>>> +	if (!sunxi_display.enabled)
> >>>> +		return;
> >>>> +
> >>>> +	offset = fdt_path_offset(blob, node);
> >>>
> >>> I think you should use fdt_node_offset_by_compatible here instead of
> >>> hardcoding a path.
> >>
> >> Hardcoding a path is deliberate. I don't know if you've read the
> >> previous u-boot code for this, but it did a lot of dt parsing to
> >> find clocks and add phandles to them, the way we eventually settled
> >> on when discussing this is for the dts to contain pre-populated simplefb
> >> nodes which u-boot just needs to fill with the mode info and enable, this
> >> way as we add support for more clocks (like the module clocks for the
> >> various display pipeline blocks), we don't need to update u-boot in lock-step,
> >> we just add the clocks to the simplefb node in the dts file when they get
> >> added to the dts file in the first place. See the updated bindings.
> > 
> > AFAICT this in no way invalidates what I suggested. There's no reason
> > why the need to populate/tweak a pre-existing node should have anything
> > to do with where the node is in the device-tree.
> 
> Right, I forgot to add one important bit to my explanation, sorry, if
> you look at the binding then it says that the name should be suffixed
> with the output type, so currently the sunxi u-boot code will look for
> /chosen/framebuffer0-hdmi. Which will e.g. also happen on any A10
> based tablets which typically have both hdmi out and an lcd screen,
> in the future I hope we will also get lcd support in u-boot, and then
> logically on tablets the lcd screen would take precedence, so then
> unless overriden through some config mechanism u-boot will chose
> to use the lcd, and will look for /chosen/framebuffer0-lcd which has
> a different set of clocks then /chosen/framebuffer0-hdmi.

This sounds like a use for:
        compatible = "simple-framebuffer,hdmi", "simple-framebuffer"
or some such, that's almost exactly what multiople compatible strings
are for. Relying on specific naming and/or path is rather
unconventional.

> >>> common/lcd.c does it this way too, it also doesn't
> >>> appear to use a node under /chosen. Perhaps this is changed in the more
> >>> uptodate binding which I've not seen yet.
> >>
> >> The use of /chosen is part of the updated bindings, which were discussed
> >> in length on various lists, and then eventually I spend 2 days online with
> >> Grant Likely in #devicetree to hash things out.
> >>
> >>>> +	cells[0] = cpu_to_fdt32(gd->fb_base);
> >>>> +	cells[1] = cpu_to_fdt32(CONFIG_SUNXI_FB_SIZE);
> >>>> +	ret = fdt_setprop(blob, offset, "reg", cells, sizeof(cells[0]) * 2);
> >>>
> >>> What arranges that #address-cells and #size-cells are both 1 at this
> >>> point?
> >>
> >> The pre-filled simplefb node.
> > 
> > I think you should use fdt_address_cells and fdt_size_cells to ensure
> > that it really is the case that they are as you expect. Or even better
> > use them to just DTRT regardless of what the pre-filled node's parent
> > says.
> 
> Verifying things to be as expected seem sensible, DTRT regardless seems
> impossible, since u-boot will have no idea what needs to be in there
> if either size-cells or address-cells != 1.

I think you have misunderstood what #size-cells / #address-cells are.
They tell you the number of cells which each address/size entry uses,
they do not tell you anything about the number of address/size
combinations in the reg property (i.e. the number of registers, which is
indeed a property of the binding).

IOW for a single region at 0xabcdef12 size 0x00003456 then:

#address-cells=1,#size-cells=1 => regs = <0xabcdef12 0x00003456>
#address-cells=2,#size-cells=1 => regs = <0 0xabcdef12 0x00003456>
#address-cells=1,#size-cells=2 => regs = <0xabcdef12 0 0x00003456>
#address-cells=2,#size-cells=1 => regs = <0 0xabcdef12 0 0x00003456>

The difference is between between storing the number as a u32 or a u64
(encoded as two cells), it doesn't change the meaning of anything.

> > I'm not really happy with the implication that the DT has to be the
> > exact one provided in the Linux source tree, and with the level of
> > coupling which is implied by this patch.
> 
> Some level of coupling is always needed that is what the bindings docs
> are for. Specifying how the bindings should look like from a firmware pov
> is no different then specifying how they should look like from an os pov.

This code is making assumptions over and above the bindings, and the
bindings themselves do not seem to be fully agreed upon yet (and contain
some unconventional constructs).

> The devicetree bindings have been going on for so long, that this
> would be the 2nd merge window this feature misses, Luc's original
> version was posted before the v2014.10 merge window.

I'm afraid I don't agree that just because it has taken a long time to
get something right we should commit to it before it is ready,
especially when it is an ABI, which is what a DT binding is.

If this scheme was acked by a DT maintainer then I'd be fine with it,
but so far it hasn't been, at least not publicly in the threads I've
looked at.

> AFAIK Grant agrees with v5

AFAIK Grant hasn't actually said that. If he does ack it (or if someone
points me to the correct mail) then I have no further objections.

> > I should be able to write my own DT for a device so long as it follows
> > the bindings. e.g. if *BSD supports a board (they often seem to have
> > their own DT files) then I should be able to boot that from u-boot too,
> > so long as all three follow the bindings.
> 
> Ack, and I don't see how what we're doing here breaks that.

An author would need to know this out of band requirement that #*-cells
are required to be 1, which is an unusual requirement to start with.

> > If the u-boot code is going to put additional constraints on things over
> > and above the bindings (e.g. requiring that node to be under a
> > particular #{address/size}-cells regimen
> 
> Bindings always specify a particular address / size cells regimen, otherwise
> it is not well defined how to interpret them.

No so. Almost no bindings specify these, they are a common device-tree
concept and for a given node are defined by that node's parent (or
grandparent, etc), not by the node's bindings. This is all part of the
way buses are represented in DT. 

In fact it's a bit odd to have a reg property under /chosen at all,
since it doesn't really fit in with the bus structure. I've done
something similar in some bindings I've authored[0], but AIUI I got that
wrong and really should have used a set of non-reg properties with a
single value so there was no need to parse using #*-cells  (cf the
initrd-start + initrd-end properties under /chosen). Sadly DT is an ABI,
so for my bindings I'm kind of stuck with it for the foreseeable future.

[0]
http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt;h=08ed7751859dbe2d2c32d86d7df371057d7b45a4;hb=HEAD

>  If there are extra address /
> size fields those need to have a defined meaning, so an #{address/size}-cells regimen
> is always implied by the bindings.
> 
> In this case the address / size cells comes from how we specify any memory
> address on sunxi which is 1 / 1.

That just happens to be what the dt's in the Linux source have written
into them, there is nothing fundamental which requires this and you
could perfectly validly author a sunxi DT which uses 2/2 or 2/1 etc.

> > and IMHO the specific path
> > comes under this too despite what recent bindings updates attempt to
> > say) then that needs to be clearly documented somewhere, and even that
> > would make me slightly sad given how easy it would be to just make it
> > work following the bindings in the normal way.
> 
> The path requirement comes from 2 things:
> 
> 1) u-boot needs to be able to find which node belongs to which display pipeline
> 2) u-boot needs to be able to find the right node for the output chosen, were
> there may be multiple output options u-boot can chose for a single display
> pipeline
> 
> So just searching for the node by compatible will not work.

It would work if you used compatible how it was intended to be used.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
