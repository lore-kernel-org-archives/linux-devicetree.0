From: David Jander <david.jander-/Q/L1SwJa3aEVqv0pETR8A@public.gmane.org>
Subject: Re: [RFC] i.MX DRM devicetree binding
Date: Thu, 14 Jun 2012 17:29:06 +0200
Message-ID: <20120614172906.70f70717@archvile>
References: <20120614130756.GS30400@pengutronix.de>
 <20120614161016.20c79038@archvile>
 <20120614144533.GV30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120614144533.GV30400-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Ahmed Ammar <aammar-sEEEE4iEDtaXzmuOJsdVMQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 14 Jun 2012 16:45:33 +0200
Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> On Thu, Jun 14, 2012 at 04:10:16PM +0200, David Jander wrote:
> > On Thu, 14 Jun 2012 15:07:56 +0200
> > Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > 
> > > +
> > > +Required properties:
> > > +- compatible: Should be "fsl,imx-parallel-display"
> > > +- crtc: the crtc this display is connected to, see below
> > > +Optional properties:
> > > +- interface_pix_fmt: How this display is connected to the
> > > +  crtc. Currently supported types: "rgb24", "rgb565"
> > > +- edid: verbatim EDID data block describing attached display.
> > 
> > I never really understood why one should put EDID data in a device-tree. It
> > carries a lot of irrelevant information and is in a quite hostile format. The
> > only reason it exists actually is historically grown "intelligency" built into
> > VESA compatible CRT monitors for PC's.... what do _we_ have to do with that?
> > There isn't even a decent tool to generate this data on linux.
> > On top of that, the examples I have seen of EDID blobs in device-trees so far
> > are just plain wrong and even contain device id's from "Samsung SyncMaster"
> > and other such stuff that IMHO has no place here.
> > 
> > But we need an alternative way of communicating timing parameters. Can't we
> > use something more ad-hoc, like the data one would give to DRM_MODE() in
> > drm_crtc.h?
> 
> Generally +1 for this.

Thanks ;-)

> I Just don't want to open up another front for now, but I am willing to
> support a generic (not i.MX specific) format to describe display timings
> in devicetree.

I understand.

> The only discussion I know about was here:
> 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2010-February/080683.html

Oh yeah. I remember vaguely having dealt with that one. I think we actually use
the code being discussed there on another boards, and also remember feeling
acute pain from tying to figure out how to cough up some useful EDID data blob
for our LCD panels. It felt wrong on all ends, and I think I ended up hacking
something around this in order to avoid having to deal with EDID.

> The outcome was that the suggested format was not entirely generic and
> that it would be better to use some existing format rather than
> inventing something new. I disagree here. The thing called modeline,
> drm_display_mode or fb_videomode is well established and it is known
> which parameters (most) displays need, so it should be possible to have
> a generic display description in the devicetree.

Right! It really can't be that complicated.

> However, we need EDID data parsing anyway in the kernel and being able

Why? This also feels almost entirely wrong, specially on an embedded system.
IMHO, encoders that actually receive EDID data via legacy DDC interfaces,
should convert this data immediately to generic timing data, and the kernel
should use that instead. But I agree that this is a different discussion and
should be held elsewhere.

> to overwrite the (maybe broken monitor supplied) EDID data in the
> devicetree might become handy. So having this way of supplying EDID data
> is good to have even if there is a generic display description.

I don't see why it would be good to have, but I agree that since it is
optional, it can perfectly well be ignored and we can use something else
instead. In fact, once there is "something else", I doubt anyone would want to
use EDID in a device-tree. EVK's like Babbage and LOCO have DDC interfaces,
and all other real embedded systems I can think of would rather benefit from
more straight-forward timing information, which can probably be copied almost
verbatim from the datasheet of the LCD panel.

Best regards,

-- 
David Jander
Protonic Holland.
