From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Sat, 21 May 2011 11:42:34 -0600
Message-ID: <BANLkTi=8vX1Cs_fzpQXZBuuDuLYLu1FGmg@mail.gmail.com>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
 <20110519233958.GB18181@ponder.secretlab.ca> <4DD66B8A.5040404@gmail.com>
 <201105201621.03801.arnd@arndb.de> <4DD68614.6090209@gmail.com> <a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Neuendorffer <stephen.neuendorffer@xilinx.com>
Cc: Rob Herring <robherring2@gmail.com>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

[cc'ing Rafael and Kevin because this ventures into clock stuff]

On Fri, May 20, 2011 at 10:08 AM, Stephen Neuendorffer
<stephen.neuendorffer@xilinx.com> wrote:
>
>
>> -----Original Message-----
>> From:
> devicetree-discuss-bounces+stephen.neuendorffer=3Dxilinx.com@lists.oz=
labs.
> org [mailto:devicetree-
>> discuss-bounces+stephen.neuendorffer=3Dxilinx.com@lists.ozlabs.org] =
On
> Behalf Of Rob Herring
>> Sent: Friday, May 20, 2011 8:18 AM
>> To: Arnd Bergmann
>> Cc: devicetree-discuss@lists.ozlabs.org; Jeremy Kerr;
> linux-arm-kernel@lists.infradead.org
>> Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
>>
>> Arnd,
>>
>> On 05/20/2011 09:21 AM, Arnd Bergmann wrote:
>> > On Friday 20 May 2011 15:24:26 Rob Herring wrote:
>> >> Maybe we are looking this in the wrong way.
>> >>
>> >> AMBA is not really the bus, but certain types of devices on the
> bus.
>> >> Granted, it may actually be an AMBA bus vs. vendor bus (i.MX AIPS=
),
> but
>> >> that is really transparent to s/w. Separating AMBA devices in the
>> >> devicetree is really Linux requirements defining the devicetree
>> >> structure. It is certainly conceivable that an OS could make no
>> >> distinction. In my case, there is a mixture of regular platform
> devices
>> >> and AMBA(Primecell really) devices all interleaved on the same bu=
s.
>> >
>> > I don't see how that would work. If the bus is AMBA, it should
>> > only have AMBA devices on it, otherwise how would they be connecte=
d?
>> >
>> The ARM definition of AMBA encompasses a lot of things. It is the
>> definition of the AXI, AHB and APB buses. It also has the definition
> of
>> the peripheral ID register definitions which primarily only ARM Ltd
>> peripherals implement. You can have those bus types yet not have any
>> peripherals with the ID registers. The Linux amba bus primarily deal=
s
>> with just the peripheral ID for probe matching. There is also bus
> clock
>> handling, but that's not really unique to an AMBA bus. Arguably the
>> platform bus could have bus clock handling as well.
>
> I tried to bring up exactly this issue, but I don't think I got my po=
int
> across
> effectively. =A0(probably because I started off with "why the hell do=
es
> this exist???")
> (face palm) =A0The amba_bus driver really deals with a bunch of issue=
s
> that
> are specific to a very small number of platforms and the style of cor=
es
> from ARM.
>
>> > Whether software is supposed to know care about this is a differen=
t
>> > question. The device tree should generally reflect the block
>> > diagram of the hardware,
>>
>> Agreed.
>>
>> > and I would expect the AMBA devices be
>> > on a different level from the rest there.
>> >
>> But this part is not true.
>>
>> >> Based on this, I think of_platform_populate should always just
> match
>> >> against "simple-bus" and make the matches parameter define the
> device
>> >> creation hook rather than the bus type. Or you could have both
>> >> bus_matches and dev_matches parameters.
>> >
>> > I think it would be much better to only look at the parent bus for
>> > device to add, never at the device itself.
>> >
>> > If the bus is AMBA, add all devices as amba_device, if it's
> simple-bus,
>> > add all devices as platform_device.
>> >
>> That is how it is currently, but the reality is that I only have 1 b=
us
>> with both ARM Primecell peripherals and other peripherals which are
>> standard platform bus devices. i2c-designware is one example. It is =
on
>> the APB just like the pl011 uart. So do you propose I create a amba
>> driver for it? It has no peripheral ID registers, so that may not ev=
en
>> work.

We should clarify one point here.  There is no such thing as a
"standard platform device".  The platform_bus_type is a construct used
by Linux to model devices that cannot be probed any other way.
Typcially they are memory mapped onto a processor local bus without
any special behaviour, but they can also appear as sub devices of a
multi function device, or to describe something that isn't memory
mapped at all like gpio-leds.

In the case we're talking about the bus really is an AMBA bus, and all
the devices on it are in some sense real amba devices.  The problem is
that not all of the devices on the bus implement peripheral ID
registers or other mechanisms that good upstanding AMBA devices are
expected to have.  Plus, drivers already exist for some of these
devices in the form of platform_drivers.  We *could* enforce all
children of an AMBA bus to be driven by amba_drivers, and we could
implement it right now by adding an amba_driver registration along
side each platform_driver (the bulk of the code being shared of
course), but it is a matter of constructive laziness that we choose
not to.  We choose not to because it adds a big chunk of new code
without really buying us anything.  In fact, there are probably "good
upstanding" amba devices that do implement the peripheral ID
registers, but Linux drives them via platform_driver anyway.

OMAP (hi Kevin!) ran into a similar problem in figuring out how to
represent the internal busses on OMAP chips.  They've got a bunch of
additional "hwmod" data that describes how to handle power management
for system, but all of that infrastructure is largely transparent to
the driver.  As far as the driver is concerned, platform_device and
platform_driver is about the right abstraction.  The TI folks took a
bit of a different approach and instead of creating a different bus
type, they now attach additional data to the device at driver probe
time flagging the device as an omap device and setting it up for the
omap infrastructure to manage manipulating the clocks.  The advantage
being that clocks and power rails can be manipulated for plain-jane
platform_devices, but the expense is that the OMAP infrastructure
needs to jump through hoops to setup up the power management
callbacks.  (This work is still somewhat ongoing, and it remains to be
seen what the final result will ultimately look like).

In the DT context, the question then becomes what do device nodes in
the tree get registered as?  platform_device or amba_device?  Given
the above, it's not even clear that the presence of an
arm,amba-deviceid or an arm,amba-device compatible value is a clean
indication that a device should be registered as an amba_device.  The
options on the table are:

1) drop amba-bus entirely and use platform_device everywhere, similar
to what OMAP has done
2) strictly create amba_devices for nodes compatible with "arm,amba-dev=
ice"
3) be intelligent about amba device creation; create an amba_device
only for devices we know are driven with amba_driver.

Option 1) requires migrating amba_drivers to platform_drivers, and it
also requires figuring out how to do the amba clock management on
platform_devices (not trivial, but probably a good thing overall
because we're rapidly approaching the point where we need clock
management on platform_devices anyway).
Option 2) is probably the wrong thing because it requires
arm,amba-device to *not* appear in nodes if Linux currently uses a
platform_device to drive the device.  This is bad because it leaks
Linux kernel implementation details into the device tree, which falls
down if at some future point a platform_driver is migrated to an
amba_driver, or visa-versa.  In that case all platforms still using
the old data would break on a new kernel; a situation we strive to
avoid.
Option 3) is possibly the best solution, or at least best near term
solution.  Looking at the kernel tree, there are only about 15
amba_drivers currently implemented.  It would be trivial to give
of_platform_populate a list of compatible values that should be
registered as amba_devices instead of platform_devices.  In fact, it
would be easy to extend the match table passed into
of_platform_populate() so that the caller can provide a handler
function for certain compatible values.  If the .data member is
populated, then it is a callback, which could be something like
of_amba_device_create() for the list of known amba devices.

ie:  This structure should be shared by all platforms, or overridden
*only if absolutely necessary*
struct of_device_id amba_platform_match[] __initdata =3D {
        { .compatible =3D "arm,amba-pl022", .data =3D of_amba_device_cr=
eate },
        { .compatible =3D "arm,amba-pl030", .data =3D of_amba_device_cr=
eate },
        /* ... */
        { .compatible =3D "arm,amba-pl031", .data =3D of_amba_device_cr=
eate },
        { .compatible =3D "simple-bus", }, /* no callback;
platform_device with child devices */
        { }
};

Russell, it seems to me that the primary behaviour that amba_bus has
over platform_bus is the clock management, and secondarily
verification of the type of device by the device id.  Am I correct, or
am I missing something?

>
> Same here. =A0I don't know what the right solution for it is, but I f=
ind
> amba_bus
> solution to get in the way more than help. =A0I had to hack the etm/e=
tb
> driver
> and the amba_bus to shreds to get it to work for me at all.
> I think most of what amba_bus does could be better handled by:
> 1) generic support in platform bus for clock enabling/power domains.
> These are system concerns that most drivers shouldn't really know/car=
e
> about, and

Which, as mentioned above, is what OMAP has done.

> will likely vary between SOCs.
> 2) helper functions for drivers for primecell devices that does the
> peripheral id checking.

I think this lines up with my option 3 above.

g.
