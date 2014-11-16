From: Ian Campbell <ijc@hellion.org.uk>
Subject: Re: [PATCH 5/6] sunxi: video: Add simplefb support
Date: Sun, 16 Nov 2014 14:38:08 +0000
Message-ID: <1416148688.25454.22.camel@hellion.org.uk>
References: <1415984088-6800-1-git-send-email-hdegoede@redhat.com>
	<1415984088-6800-6-git-send-email-hdegoede@redhat.com>
	<1416138607.25454.13.camel@hellion.org.uk> <5468AC2E.80601@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <5468AC2E.80601@redhat.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Hans de Goede <hdegoede@redhat.com>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
Cc: u-boot@lists.denx.de
List-Id: devicetree@vger.kernel.org

devicetree@, comments on the requirement that a node have a specific
path welcomed.

On Sun, 2014-11-16 at 14:52 +0100, Hans de Goede wrote:
> Hi,
> 
> On 11/16/2014 12:50 PM, Ian Campbell wrote:
> > On Fri, 2014-11-14 at 17:54 +0100, Hans de Goede wrote:
> >> From: Luc Verhaegen <libv@skynet.be>
> >>
> >> Add simplefb support, note this depends on the kernel having support for
> >> the clocks property which has recently been added to the simplefb devicetree
> >> binding.
> > 
> > Link please, Linus's tree[0] doesn't seem to have it yet, I suppose it
> > is in some maintainer tree at the moment? It's not even in linux-next
> > yet though[1]. Maybe simple-framebuffer.txt isn't the right place to
> > look?
> 
> Right now it is sitting here, which is the fbdev maintainers official tree:
> https://git.kernel.org/cgit/linux/kernel/git/tomba/linux.git/log/?h=for-next
> 
> > 
> > [0] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> > [1] https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/video/simple-framebuffer.txt
> > 
> >> +#if defined(CONFIG_OF_BOARD_SETUP) && defined(CONFIG_VIDEO_DT_SIMPLEFB)
> >> +void
> >> +sunxi_simplefb_setup(void *blob)
> >> +{
> >> +	static GraphicDevice *graphic_device = &sunxi_display.graphic_device;
> >> +	const char *node = "/chosen/framebuffer0-hdmi";
> >> +	const char *format = "x8r8g8b8";
> > 
> > The bindings doc currently says:
> >         
> >         - format: The format of the framebuffer surface. Valid values are:
> >           - r5g6b5 (16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b).
> >           - a8b8g8r8 (32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r).
> >         
> > Perhaps x8r8g8b8 is defined in the updated version?
> 
> Erm, no, I don't think anyone has actually bothered to keep the list in the
> binding up2date with what the kernel actually supports, x8r8g8b8 has been
> supported in the kernel before sunxi + simplefb every became a topic.

That's a shame, OS authors shouldn't really be expected to scrobble
about in Linux source to figure out what a binding is.

> >> +	const char *okay = "okay";
> >> +	char name[32];
> >> +	fdt32_t cells[2];
> >> +	int offset, stride, ret;
> >> +
> >> +	if (!sunxi_display.enabled)
> >> +		return;
> >> +
> >> +	offset = fdt_path_offset(blob, node);
> > 
> > I think you should use fdt_node_offset_by_compatible here instead of
> > hardcoding a path.
> 
> Hardcoding a path is deliberate. I don't know if you've read the
> previous u-boot code for this, but it did a lot of dt parsing to
> find clocks and add phandles to them, the way we eventually settled
> on when discussing this is for the dts to contain pre-populated simplefb
> nodes which u-boot just needs to fill with the mode info and enable, this
> way as we add support for more clocks (like the module clocks for the
> various display pipeline blocks), we don't need to update u-boot in lock-step,
> we just add the clocks to the simplefb node in the dts file when they get
> added to the dts file in the first place. See the updated bindings.

AFAICT this in no way invalidates what I suggested. There's no reason
why the need to populate/tweak a pre-existing node should have anything
to do with where the node is in the device-tree.

My suggestion literally amounts to:
  - offset = fdt_path_offset(blob, node);
  + offset = fdt_node_offset_by_compatible(blob, -1, "simple-framebuffer");

Nothing else in the code changes. You can still add the required details
to the prepopulated node, no matter where it lives.

I notice that v1 of these bindings was posted mid last week and were
still being discussed (at v5) on Friday, where there was active
discussion by DT maintainers (Grant, who hasn't yet acked it AFAICT). So
why is this in the fb tree already?

It seems to me that this binding is not yet at the point where u-boot
should be basing implementation on it. I'm sorry if this means this
feature misses the current u-boot merge window, but there will be
another soon. (didn't this one close on the 8th anyway?)

> > common/lcd.c does it this way too, it also doesn't
> > appear to use a node under /chosen. Perhaps this is changed in the more
> > uptodate binding which I've not seen yet.
> 
> The use of /chosen is part of the updated bindings, which were discussed
> in length on various lists, and then eventually I spend 2 days online with
> Grant Likely in #devicetree to hash things out.
> 
> >> +	cells[0] = cpu_to_fdt32(gd->fb_base);
> >> +	cells[1] = cpu_to_fdt32(CONFIG_SUNXI_FB_SIZE);
> >> +	ret = fdt_setprop(blob, offset, "reg", cells, sizeof(cells[0]) * 2);
> > 
> > What arranges that #address-cells and #size-cells are both 1 at this
> > point?
> 
> The pre-filled simplefb node.

I think you should use fdt_address_cells and fdt_size_cells to ensure
that it really is the case that they are as you expect. Or even better
use them to just DTRT regardless of what the pre-filled node's parent
says.

I'm not really happy with the implication that the DT has to be the
exact one provided in the Linux source tree, and with the level of
coupling which is implied by this patch.

I should be able to write my own DT for a device so long as it follows
the bindings. e.g. if *BSD supports a board (they often seem to have
their own DT files) then I should be able to boot that from u-boot too,
so long as all three follow the bindings.

If the u-boot code is going to put additional constraints on things over
and above the bindings (e.g. requiring that node to be under a
particular #{address/size}-cells regimen and IMHO the specific path
comes under this too despite what recent bindings updates attempt to
say) then that needs to be clearly documented somewhere, and even that
would make me slightly sad given how easy it would be to just make it
work following the bindings in the normal way.

Ian.
