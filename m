From: okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Subject: Re: [PATCH V3 1/3] vfio, platform: add support for ACPI while
 detecting the reset driver
Date: Tue, 29 Mar 2016 08:15:42 -0400
Message-ID: <8f766d081b33d91f196e7bd5e13b6f33@codeaurora.org>
References: <1459172124-6730-1-git-send-email-okaya@codeaurora.org>
 <98854818.NJS35fvhsb@wuerfel>
 <e736f6bc775cdca8a4bb0dab20654823@codeaurora.org>
 <147496989.L43SVC7xRY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <147496989.L43SVC7xRY@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Baptiste Reynal <b.reynal-lrHrjnjw1UfHK3s98zE1ajGjJy/sRE9J@public.gmane.org>, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2016-03-29 07:25, Arnd Bergmann wrote:
> On Tuesday 29 March 2016 06:59:15 okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org wrote:
>> On 2016-03-29 05:25, Arnd Bergmann wrote:
>> > On Monday 28 March 2016 09:35:22 Sinan Kaya wrote:
>> >> The code is using the compatible DT string to associate a reset d=
river
>> >> with
>> >> the actual device itself. The compatible string does not exist on=
 ACPI
>> >> based systems. HID is the unique identifier for a device driver
>> >> instead.
>> >> The change allows a driver to register with DT compatible string =
or
>> >> ACPI
>> >> HID and then match the object with one of these conditions.
>> >>
>> >> Rules for loading the reset driver are as follow:
>> >> - ACPI HID needs match for ACPI systems
>> >> - DT compat needs to match for OF systems
>> >>
>> >> Tested-by: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (device tree only)
>> >> Tested-by: Shanker Donthineni <shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> (ACPI onl=
y)
>> >> Signed-off-by: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> >>
>> >
>> >
>> > This really feels wrong for two reasons:
>> >
>> > * device assignment of non-PCI devices is really special and doesn=
't
>> >   seem to make sense on general purpose servers that would be the
>> > target
>> >   for ACPI normally
>>=20
>>=20
>> Why is it special? Acpi is not equal to pci. Platform devices are=20
>> first
>> class devices too. Especially, _cls was introduced for this reason.
>=20
> It still feels like a hack. The normal design for a server is to have
> all internal devices show up on the PCI host bridge, next to the PCIe
> ports, to have a simple way to manage any device, both internal and
> off-chip. Putting a device on random MMIO registers outside of the
> discoverable buses and have the firmware work around the lack of
> discoverability will always be inferior.
>=20

It is a HW implementation choice. Having everything as pci problem has=20
been already solved. I would vote for it when we had SW pci bridge laye=
r=20
just to use usb and sata. Not anymore. Especially, _cls solves this=20
problem



>> >
>> > * If there is indeed a requirement for ACPI to handle something li=
ke
>> > this,
>> >   it should be part of the ACPI spec, with a well-defined method o=
f
>> > handling
>> >   reset, rather than having to add a device specific hack for each
>> >   device separately.
>> >
>>=20
>> I see. Normally, this is done by calling _rst method. AFAIK, Linux
>> doesn=E2=80=99t support _rst. I can check its presence and call it i=
f it is
>> there.
>=20
> Yes, that sounds reasonable: In patch 2 where you check for the
> presence of the reset method, just keep the existing logic for
> DT based systems, and use _rst on ACPI based systems instead,
> then you can drop both patches 1 and 3.
>=20

I can certainly drop patch #3 and push the reset responsibility to acpi=
=2E

I never liked having a fragmented sw design across multiple drivers.

I need something for patch #1. Compatible is a DT property not ACPI.but=
=20
then, I won't have a reset driver anymore.

If we think about how vfio pci works, we pass the pci vendor and device=
=20
id to new_id file to find out which pci device needs to be pass thru.

I can go to a similar route. This time we pass the object id through=20
new_id and I call reset method on this object.

Let me know what you think?

> 	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
