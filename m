From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [RFC] New Device Tree property - "bonding"
Date: Mon, 05 Dec 2016 16:40:26 +0200
Message-ID: <2054258.NRXTrTF0Rj@avalon>
References: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com> <CAL_Jsq+-6v1z-MYHC8Lvvao+=SFhVn2XwBc3O6fSN_zNcrJ3kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+-6v1z-MYHC8Lvvao+=SFhVn2XwBc3O6fSN_zNcrJ3kA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org" <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Monday 05 Dec 2016 08:18:34 Rob Herring wrote:
> On Fri, Nov 25, 2016 at 10:55 AM, Ramesh Shanmugasundaram wrote:
> > Hello DT maintainers,
> > 
> > In one of the Renesas SoCs we have a device called DRIF (Digital Radio
> > Interface) controller. A DRIF channel contains 4 external pins - SCK,
> > SYNC, Data pins D0 & D1.
> > 
> > Internally a DRIF channel is made up of two SPI slave devices (also called
> > sub-channels here) that share common CLK & SYNC signals but have their
> > own resource set. The DRIF channel can have either one of the sub-channel
> > active at a time or both. When both sub-channels are active, they need to
> > be managed together as one device as they share same CLK & SYNC. We plan
> > to tie these two sub-channels together with a new property called
> > "renesas,bonding".
>
> Is there no need to describe the master device? No GPIOs, regulators
> or other sideband controls needed? If that's never needed (which seems
> doubtful), then I would do something different here probably with the
> master device as a child of one DRIF and then phandles to master from
> the other DRIFs. Otherwise, this looks fine to me.

Here's a bit of background.

The DRIF is an SPI receiver. It has three input pins, a clock line, a data 
line and a sync signal. The device is designed to be connected to a variety of 
data sources, usually plain SPI (1 data line), IIS (1 data line) but also 
radio tuners that output I/Q data (http://www.ni.com/tutorial/4805/en/) over 
two data lines.

In the case of IQ each data sample is split in two I and Q values (typically 
16 to 20 bits each in this case), and the values are transmitted serially over 
one data line each. The synchronization and clock signals are common to both 
data lines. The DRIF is optimized for this use case as the DRIF instances in 
the SoC (each of them having independent clocks, interrupts and control 
registers) are grouped by two, and the two instances in a group handle a 
single data line each but share the same clock and sync input.

On the software side we need to group the I and Q values, which are DMA'ed to 
memory by the two DRIF instances, and make them available to userspace. The 
V4L2 API used here in SDR (Software Defined Radio) mode supports such use 
cases and exposes a single device node to userspace that allows control of the 
two DRIF instances as a single device. To be able to implement this we need 
kernel code to be aware of DRIF groups and, while binding to the DRIF 
instances separately, expose only one V4L2 device to userspace for each group.

There's no master or slave instance from a hardware point of view, but the two 
instances are not interchangeable as they carry separate information. They 
must thus be identified at the driver level.

Back to the DT bindings, the need to expose relationships between (mostly) 
independent devices is quite common nowadays. It has been solved in some cases 
by creating a separate DT node that does not correspond to any physical 
hardware and whose sole purpose is to contain phandles to devices that need to 
be grouped. Drivers then bind to the compatible string of that "virtual" DT 
node. The proposed bonding property is a different approach to solve a similar 
problem. Would it be worth it addressing the problem at a more general level 
and try to design a common solution ?

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
