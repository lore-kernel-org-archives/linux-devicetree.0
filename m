From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] New Device Tree property - "bonding"
Date: Thu, 15 Dec 2016 10:07:13 +0100
Message-ID: <CAMuHMdXtbXQaCdozF3xxej3b1wQLRh25SFzyh0=Wu=Ah75frCw@mail.gmail.com>
References: <KL1PR06MB1031872E5DC2C65F2A490D6BC3890@KL1PR06MB1031.apcprd06.prod.outlook.com>
 <2054258.NRXTrTF0Rj@avalon> <CAL_JsqJw-KVZswBruG42MUdkmVSEb0L8OWCXbid7b41Ft4EpPQ@mail.gmail.com>
 <10679912.HCjz6JNtZJ@avalon> <SG2PR06MB1038A0DADECF2EB7795A487AC3820@SG2PR06MB1038.apcprd06.prod.outlook.com>
 <CAL_JsqKJcEmNUzOm-3j3FODkN1faXMAMmURRxfRpHfiGs_a+qA@mail.gmail.com> <SG2PR06MB1038FDD0F2C70D6CB0AED298C3820@SG2PR06MB1038.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1038FDD0F2C70D6CB0AED298C3820@SG2PR06MB1038.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 6, 2016 at 6:45 PM, Ramesh Shanmugasundaram
<ramesh.shanmugasundaram@bp.renesas.com> wrote:
>> >> On Monday 05 Dec 2016 09:57:32 Rob Herring wrote:
>> >> > On Mon, Dec 5, 2016 at 8:40 AM, Laurent Pinchart wrote:
>> >> > > On Monday 05 Dec 2016 08:18:34 Rob Herring wrote:
>> >> > >> On Fri, Nov 25, 2016 at 10:55 AM, Ramesh Shanmugasundaram wrote:
>> >> > >>> Hello DT maintainers,
>> >> > >>>
>> >> > >>> In one of the Renesas SoCs we have a device called DRIF
>> >> > >>> (Digital Radio
>> >> > >>> Interface) controller. A DRIF channel contains 4 external pins
>> >> > >>> - SCK, SYNC, Data pins D0 & D1.
>> >> > >>>
>> >> > >>> Internally a DRIF channel is made up of two SPI slave devices
>> >> > >>> (also called sub-channels here) that share common CLK & SYNC
>> >> > >>> signals but have their own resource set. The DRIF channel can
>> >> > >>> have either one of the sub-channel active at a time or both.
>> >> > >>> When both sub-channels are active, they need to be managed
>> >> > >>> together as one device as they share same CLK & SYNC. We plan
>> >> > >>> to tie these two sub-channels together with a new property called
>> "renesas,bonding".
>> >> > >>
>> >> > >> Is there no need to describe the master device? No GPIOs,
>> >> > >> regulators or other sideband controls needed? If that's never
>> >> > >> needed (which seems doubtful), then I would do something
>> >> > >> different here probably with the master device as a child of one
>> >> > >> DRIF and then phandles to master from the other DRIFs.
>> >> > >> Otherwise, this looks
>> >> fine to me.
>> >> > >
>> >> > > Here's a bit of background.
>> >> > >
>> >> > > The DRIF is an SPI receiver. It has three input pins, a clock
>> >> > > line, a data line and a sync signal. The device is designed to be
>> >> > > connected to a variety of data sources, usually plain SPI (1 data
>> >> > > line), IIS (1 data
>> >> > > line) but also radio tuners that output I/Q data
>> >> > > (http://www.ni.com/tutorial/4805/en/) over two data lines.
>> >> > >
>> >> > > In the case of IQ each data sample is split in two I and Q values
>> >> > > (typically 16 to 20 bits each in this case), and the values are
>> >> > > transmitted serially over one data line each. The synchronization
>> >> > > and clock signals are common to both data lines. The DRIF is
>> >> > > optimized for this use case as the DRIF instances in the SoC
>> >> > > (each of them having independent clocks, interrupts and control
>> >> > > registers) are grouped by two, and the two instances in a group
>> >> > > handle a single data line each but share the same clock and sync
>> input.
>> >> > >
>> >> > > On the software side we need to group the I and Q values, which
>> >> > > are DMA'ed to memory by the two DRIF instances, and make them
>> >> > > available to userspace. The V4L2 API used here in SDR (Software
>> >> > > Defined Radio) mode supports such use cases and exposes a single
>> >> > > device node to userspace that allows control of the two DRIF
>> >> > > instances as a single device. To be able to implement this we
>> >> > > need kernel code to be aware of DRIF groups and, while binding to
>> >> > > the DRIF instances separately, expose only one V4L2 device to
>> userspace for each group.
>> >> > >
>> >> > > There's no master or slave instance from a hardware point of
>> >> > > view, but the two instances are not interchangeable as they carry
>> >> > > separate
>> >> information.
>> >> > > They must thus be identified at the driver level.
>> >> >
>> >> > By master, I meant the external master device that generates the IQ
>> >> > data, not which of the internal DRIF blocks is a master of the other.
>> >> > So back to my question, does the external master device need to be
>> >> > described? I worry the answer now for a simple case is no, but then
>> >> > later people are going to have cases needing to describe more. We
>> >> > need to answer this question first before we can decide what this
>> >> > binding should look like.
>> >>
>> >> Oh yes the external device certainly needs to be described. As it is
>> >> controlled through a separate, general-purpose I2C or SPI controller,
>> >> it should be a child node of that controller. The DRIF handles the
>> >> data interface only, not the control interface of the external device.
>> >
>> > Yes, as Laurent mentioned, the external master will be described
>> separately. The data interface with the master is described through port
>> nodes. E.g.
>> >
>> >         port {
>> >                 drif0_ep: endpoint {
>> >                      remote-endpoint = <&tuner_ep>;
>> >                 };
>> >         };
>> >
>> > Do we agree on this model please?
>>
>> Well, that's not complete as you should have both DRIF0 and DRIF1 having
>> connections to the tuner. Then you can walk the graph and find everything,
>> and you then don't need the bonding property.
>
> Assuming the third party tuner exposes it's two data lines as two endpoints, it seems possible with of_graph.h apis to walk through tuner end points and get the phandle of the other DRIF device. However, there are couple of points coming to mind.
>
> - The ctrl pins shared between two DRIFs needs to be enabled in one of the DRIF device. Do we choose this device arbitrarily? Do we expose the CTRL signal properties (msb/lsb first, polarity etc) on both DRIF devices? Should we think about scalability?
>
> - It mandates the third party tuner device to expose it's two data lines as two endpoints. It assumes that a single third party master device controls both the data lines coming to each DRIF device.
>
> The bonding property looks a bit cleaner on these aspects because it describes only the DRIF device.

Does of_graph and endpoints need to be mandatory?

I can easily imagine using a single DRIF device as a receive-only MSIOF SPI
slave, without a tuner connected.

Cfr. spi-slave-system-control from my SPI skave mode support series
(https://lwn.net/Articles/700433/).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
