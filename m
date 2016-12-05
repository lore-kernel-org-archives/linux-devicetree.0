From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC] New Device Tree property - "bonding"
Date: Mon, 05 Dec 2016 18:20:15 +0200
Message-ID: <10679912.HCjz6JNtZJ@avalon>
References: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com> <2054258.NRXTrTF0Rj@avalon> <CAL_JsqJw-KVZswBruG42MUdkmVSEb0L8OWCXbid7b41Ft4EpPQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJw-KVZswBruG42MUdkmVSEb0L8OWCXbid7b41Ft4EpPQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Monday 05 Dec 2016 09:57:32 Rob Herring wrote:
> On Mon, Dec 5, 2016 at 8:40 AM, Laurent Pinchart wrote:
> > On Monday 05 Dec 2016 08:18:34 Rob Herring wrote:
> >> On Fri, Nov 25, 2016 at 10:55 AM, Ramesh Shanmugasundaram wrote:
> >>> Hello DT maintainers,
> >>> 
> >>> In one of the Renesas SoCs we have a device called DRIF (Digital Radio
> >>> Interface) controller. A DRIF channel contains 4 external pins - SCK,
> >>> SYNC, Data pins D0 & D1.
> >>> 
> >>> Internally a DRIF channel is made up of two SPI slave devices (also
> >>> called sub-channels here) that share common CLK & SYNC signals but have
> >>> their own resource set. The DRIF channel can have either one of the
> >>> sub-channel active at a time or both. When both sub-channels are active,
> >>> they need to be managed together as one device as they share same CLK &
> >>> SYNC. We plan to tie these two sub-channels together with a new property
> >>> called "renesas,bonding".
> >> 
> >> Is there no need to describe the master device? No GPIOs, regulators
> >> or other sideband controls needed? If that's never needed (which seems
> >> doubtful), then I would do something different here probably with the
> >> master device as a child of one DRIF and then phandles to master from
> >> the other DRIFs. Otherwise, this looks fine to me.
> > 
> > Here's a bit of background.
> > 
> > The DRIF is an SPI receiver. It has three input pins, a clock line, a data
> > line and a sync signal. The device is designed to be connected to a
> > variety of data sources, usually plain SPI (1 data line), IIS (1 data
> > line) but also radio tuners that output I/Q data
> > (http://www.ni.com/tutorial/4805/en/) over two data lines.
> > 
> > In the case of IQ each data sample is split in two I and Q values
> > (typically 16 to 20 bits each in this case), and the values are
> > transmitted serially over one data line each. The synchronization and
> > clock signals are common to both data lines. The DRIF is optimized for
> > this use case as the DRIF instances in the SoC (each of them having
> > independent clocks, interrupts and control registers) are grouped by two,
> > and the two instances in a group handle a single data line each but share
> > the same clock and sync input.
> > 
> > On the software side we need to group the I and Q values, which are DMA'ed
> > to memory by the two DRIF instances, and make them available to
> > userspace. The V4L2 API used here in SDR (Software Defined Radio) mode
> > supports such use cases and exposes a single device node to userspace
> > that allows control of the two DRIF instances as a single device. To be
> > able to implement this we need kernel code to be aware of DRIF groups
> > and, while binding to the DRIF instances separately, expose only one V4L2
> > device to userspace for each group.
> > 
> > There's no master or slave instance from a hardware point of view, but the
> > two instances are not interchangeable as they carry separate information.
> > They must thus be identified at the driver level.
> 
> By master, I meant the external master device that generates the IQ
> data, not which of the internal DRIF blocks is a master of the other.
> So back to my question, does the external master device need to be
> described? I worry the answer now for a simple case is no, but then
> later people are going to have cases needing to describe more. We need
> to answer this question first before we can decide what this binding
> should look like.

Oh yes the external device certainly needs to be described. As it is 
controlled through a separate, general-purpose I2C or SPI controller, it 
should be a child node of that controller. The DRIF handles the data interface 
only, not the control interface of the external device.

> > Back to the DT bindings, the need to expose relationships between (mostly)
> > independent devices is quite common nowadays. It has been solved in some
> > cases by creating a separate DT node that does not correspond to any
> > physical hardware and whose sole purpose is to contain phandles to
> > devices that need to be grouped. Drivers then bind to the compatible
> > string of that "virtual" DT node. The proposed bonding property is a
> > different approach to solve a similar problem. Would it be worth it
> > addressing the problem at a more general level and try to design a common
> > solution ?
> 
> We already have somewhat standard ways of grouping, but they are per
> type of device (display, sound card, etc.). I'm not sure we gain much
> standardizing across these devices and to some extent that ship has
> sailed. Even within display subsystems, I don't think there is one
> style that fits all. Sometimes a parent subsystem node with children
> makes sense for the h/w. Sometimes that doesn't make sense and we have
> the virtual node with a "ports" property (like sun8i did). I've never
> been too happy with that style largely just because it feels like
> we're letting DRM define the binding. However, it's generally extra
> data that an OS could just ignore. There have also been many display
> bindings that started out with a virtual node and we got rid of it. So
> it's not something I like to encourage and we need to be clear when it
> is okay or not.
> 
> To state the problem more generally (at least when using OF graph), I
> think the problem is simply how do we define and group multiple entry
> points to an OF graph. Maybe these should be graph nodes themselves
> rather than phandles to the nodes with the entry points of the graph.

CC'ing Maxime Ripard for the sun8i side.

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
