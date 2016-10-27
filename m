From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Device tree hardware auto-configuration
Date: Thu, 27 Oct 2016 17:39:31 +0300
Message-ID: <341BD761-D64A-4061-9380-0E5953C6417B@konsulko.com>
References: <52F917CEA1B9C64C94833D53889D478C014C6CD7@dor-sms-xch01.digi.com> <cd2a1ee8-388e-f10d-2c0d-3c0e2b46439d@redhat.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd2a1ee8-388e-f10d-2c0d-3c0e2b46439d-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Palacios, Hector" <Hector.Palacios-i7dp0qKlBMg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

> On Oct 25, 2016, at 13:15 , Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>=20
> Hi,
>=20
> On 25-10-16 12:07, Palacios, Hector wrote:
>> Hello,
>>=20
>> Last ELCE 2016 I attended the conference "Device Tree hardware
>> auto-configuration" by Hans de Goede. Although the room was not very =
big, it was fully crowded, sign of the big interest in the embedded =
sector to find a  convenient solution to manage hardware changes based =
on self-detection of the platform.
>>=20
>> Hans also started a thread recently going over this [1].
>>=20
>> Examples of what we try to solve are:
>> - The same hardware platform has some hardware differences, for =
example because there are different revisions of the hardware.
>> - A platform has several slightly different models but a 95% of the =
device tree
>> is the same (a different GPIO is used to power a regulator, a =
different model of touch screen controller is used...) and we want to =
avoid multiple yet very similar DTs.
>>=20
>> There is no agreement on where these things should be solved.
>> Neither U-Boot nor the kernel are straightforward options.
>>=20
>> I would like to share an idea. It is just a sketch and I do apologize =
if it
>> looks naive, but maybe it can be used as foundation for a better =
solution.
>> In the DT, we have the 'compatible' property to match nodes to =
drivers.
>> In a similar way, I was wondering if we could have a new property =
'hardware-compatible' that matches nodes to variants of the hardware.
>>=20
>> A simple example:
>> - Board model A with an I2C touchscreen controller
>> - Board model B with a different I2C touchscreen controller (same =
address)
>>=20
>> &i2c1 {
>> 	/* Touchscreen for model A */
>> 	touch_modelA@28 {
>> 		compatible =3D "aaa,touch";
>> 		hardware-compatible =3D "model" "A"
>> 		reg =3D <0x28>;
>> 	};
>>=20
>> 	/* Touchscreen for model B */
>> 	touch_modelB@28 {
>> 		compatible =3D "bbb,touch";
>> 		hardware-compatible =3D "model" "B"
>> 		reg =3D <0x28>;
>> 	};
>> };
>>=20
>> Then, it would be a question of fixing up the DT at run-time with the =
hardware identified properties (not with the touch nodes themselves). =
Let's say we  identify that we're running on model A, revision 3 (in =
e-fuses, eeprom, or by heuristics), so we fixup the DT with root-level =
properties about the hardware variant:
>>=20
>> / {
>> 	hardware,model =3D "A";
>> 	hardware,revision =3D "3";
>> };
>>=20
>> The names of the properties (after the 'hardware,' prefix) could be =
anything.
>> The match would need to be made between the remaining property name =
and its value. The DT fixup might be done by the boot loader or by a =
misc kernel driver as in Hans' patch. Then the driver's probe would only =
be called if the hardware-compatible property values are satisfied.
>>=20
>> The idea behind is to not heavily fixup the DT with devices, but =
instead limit the fixup to a reduced set of properties. Or in other =
words, you can still tell what hardware you are supposed to have by =
looking at the DT, and the fixup (whether done the boot loader or the =
kernel) simply fills in the variables that determine it.
>>=20
>> As I said, it's just a sketch-idea that I had floating around since =
ELCE, and that I wanted to share.
>=20
> This idea has been discussed before, the more or less common name for =
it now is devicetree quirks, see:
>=20
> http://www.spinics.net/lists/devicetree/msg69490.html
> http://www.spinics.net/lists/devicetree/msg69494.html
>=20

Yeah, so this works for sure. We know we have to come up with something, =
but there=92s
no agreement yet on what that will be.

I think we can start by defining what parts are applicable for a quirks =
like mechanism
and which parts are better suited by a detection mechanism and =
application like a manager
later in the boot sequence.

The quirks method has the drawback that you need to do it very early so =
the kernel is
not up yet.

> For an initial attempt at implementing this.
>=20
> Regards,
>=20
> Hans

Regards

=97 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
