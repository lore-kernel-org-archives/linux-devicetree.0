From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree BSP
Date: Sun, 5 Jul 2009 15:53:34 -0600
Message-ID: <fa686aa40907051453of20e849gab47e901ced28501@mail.gmail.com>
References: <4A49F472.3030902@petalogix.com>
	<20090704181837.4DC219B0051@mail75-va3.bigfish.com>
	<1d3f23370907050218l6b2eb9emdbcb7dc321dbab5a@mail.gmail.com>
	<20090705204647.1BBCAB2004B@mail107-dub.bigfish.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090705204647.1BBCAB2004B-UG8A/UOmamfGqIK/7oNHF6QXxVRGGlT3@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, David DeBonis <ddeboni-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, John Linn <linnj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[fixed quoting]

On Sun, Jul 5, 2009 at 2:43 PM, Stephen
Neuendorffer<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> John Williams wrote:
>> On Sun, Jul 5, 2009 at 4:15 AM, Stephen Neuendorffer wrote:
>>> I'm not exactly sure what you're trying to do here, but it doesn't look
>>> right to me.
>>> In particular, why would I have to have a separate core for these
>>> functions?
>>> Furthermore, I'm sure there must be some generic mechanisms that
>>> can/should
>>> be used for these kind of things.
>>> In general, we shouldn't reinvent the wheel here..
>>
>> The issue as I see it is that in a hardware design, the GPIO is a very
>> convenient core to drive a heartbeat LED, and aux input on proc_sys_reset
>> (for software-driven reset), or whatever.
>>
>> Clearly you don't want these GPIO cores to enumerate as regular xps_gpio
>> devices, binding to the standard GPIO driver and appearing in /dev/gpioN
>>
>> Is your concern the manual override of OF_ binding (the "compatible"
>> strings), or just the HW overhead of an extra core to drive these HW uti=
lity
>> functions?=A0 Save us from the bad old days of "misc_logic"=A0 IP cores =
that
>> drove this stuff in older Xilinx reference designs!
>>
>> Would you propose to get tricky and allocate specific bits on existing G=
PIOs
>> for these "special" functions, and write the GPIO driver/framework to ma=
sk
>> off these bits etc?=A0 Seems like a complicated software solution to a p=
roblem
>> trivially solved with a few extra gates.
>
> My (limited) understanding from reading other posts is that there is alre=
ady
> a GPIO subsystem for handling such misc-GPIO things.
> To me the cost of gates for multiple GPIO cores is small compared to the
> system cost of having
> a separate OF binding.  IMHO, this should be exposed the way any other GP=
IO
> with such capabilities
> is on any other OF/device-tree enabled system.

There are two things at issue here, and it is important not to
conflate them to avoid the risk of leaking Linux internal details out
into the device tree binding.

The first issue is how to describe the hardware in the device tree.  A
GPIO device is clearly being used, so it is entirely appropriate to
use the xps gpio binding to describe the device and the gpios property
to describe that it is being used for either a heartbeat LED or a
reset line.  The goal when designing a binding is to uniquely and
accurately describe the hardware.  If you find yourself trying to
manipulate how Linux behaves by changing the binding, then you're
probably taking a wrong approach, and you risk encoding Linux kernel
implementation details into the hardware description.

The second issue is how Linux actually uses the data.  The kernel does
have infrastructure for managing GPIO devices, but that doesn't mean
that it must use it for all GPIO devices.  If there is a reasonable
use case for it, then there is absolutely no problem with having
board-specific platform code that choses not to register a xps-gpio
device with gpiolib and doing its own thing.  This is one of the
reasons why powerpc platform code must make an explicit call to
register devices on the of_platform bus.  If platform code for a
particular board needs to manipulate the set of registered devices,
then it is free to do so.  So, for example, if you currently choose to
implement a custom heartbeat-gpio driver, then you are free to do so
in platform code.  But if 3 months from now you decide that was a bad
idea and go back to using the common gpio-leds driver, then you don't
need to change the device tree data because it should already
accurately describe the hardware.  You just need to change the custom
board support code.

Related to this is the question of where to describe things like GPIO
leds, reset GPIOs, clock sources, audio complexes, and other types of
board level things that aren't really addressable devices.
Addressable devices (like serial ports or i2c devices) are typically
child nodes of the addressable bus they are attached to, but that
doesn't work for something like an MDIO or SPI bus implemented with
GPIOs; especially when the GPIOs may not all come from the same GPIO
controller.  This is not a question that I've got an answer to, but
I've been thinking about defining a "machine" node, or something
similar that can be a parent of such non-addressable devices.  I'm
hoping Mitch, Ben, DavidG, Scott, or some other OF active folks will
jump in here and give their opinion before I go and define something
braindead.  I was thinking something like this, where the root node
would be the parent of this machine node:

        machine {
                spi@0 {
                        compatible =3D "virtual,mdio-gpio";
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        gpios =3D <&gpio 11 &gpio 12>;
                        phy@1 {
                                compatible =3D "nsm,dp83848k";
                                reg =3D <1>;
                        };
                };
                leds {
                        compatible =3D "gpio-leds";
                        heartbeat {
                                label =3D "heartbeat";
                                gpios =3D <&gpio 4>;
                        };
                };
        };

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
