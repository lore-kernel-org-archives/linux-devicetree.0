From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: IIO device indexing issue
Date: Thu, 5 Nov 2015 19:13:41 +0000
Message-ID: <563BAA65.3020609@kernel.org>
References: <5637AFC5.7080007@gmail.com> <5639D22D.3050901@metafoo.de>
 <563A5412.4030102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563A5412.4030102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/11/15 18:53, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
> On 04/11/15 11:38, Lars-Peter Clausen wrote:
>> On 11/02/2015 07:47 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>>> Hi,
>>>
>>> When we were using kernel 3.2 and with that board files we just got=
 IIO
>>> devices with static order so that we knew exactly what iio:device0 =
is.
>>>
>>> Now with device tree that order is not so static anymore especially=
 when
>>> using device overlays (have not yet tried that thou). If there woul=
d be
>>> deferred probe for the device then if we have multiple iio:device's=
 then
>>> those could in theory be in any order.
>>>
>>> In example libiio uses iio device index to open the IIO device. So =
the
>>> problem is to know what iio:device is what.
>>>
>>> If we look files under /sys/bus/iio/iio:deviceX. They do not reveal=
 what
>>> device this is (especially if there are multiple device of same typ=
e). There
>>> does not seem to be a way to give custom name for the iio device fr=
om device
>>> tree that could have been used as a cue.
>>>
>>> Device tree aliases kinda sounded a good idea to try. Eg. define ad=
c0 alias
>>> and then link it to actual device node in tree.
>>>
>>> Aliases could be found under /proc/device-tree/aliases. Looking at =
it shows
>>> what device tree node it is. However there does not seem to be actu=
al link
>>> from any /proc/device-tree entries to kernel drivers exposed under =
sysfs.
>>> And even the path components in device tree are not in same format =
as in
>>> sysfs. So there is no 1:1 mapping possible here.
>>>
>>> IIO devices in /sys/bus/iio/iio:deviceX seem to be symlinks to actu=
al
>>> devices under /sys/devices and from there is physical path to the d=
evice and
>>> under that the IIO device with the same name as is under /sys/bus/i=
io.
>>>
>>> So in theory we could make a mapping configuration file that specif=
ies
>>> logical name for iio device and then physical parent path for the d=
evice and
>>> then find under it iio:device* files to determine what is the iio d=
evice
>>> index for this physical device. Then open IIO device with that inde=
x in
>>> example with libiio. Sounds a bit complex?
>>>
>>> So did we miss something on how this should be defined/accessed or =
is there
>>> a slight issue here on how to identify iio devices?
>>>
>>> Don't know how device tree overlays affect this if we first load de=
vice tree
>>> overlay with some configuration and then unload it and load another=
 one with
>>> different configuration.
>> Hi,
>>
>> Yes, excellent analysis. This is a real issue. As you said there is =
no
>> guarantee that the IIO device numbers are stable, they are assigned =
in the
>> order the devices are registered. If the device are registered in a
>> different order for whatever reason the numbers will change. You can=
 use
>> readlink on the IIO device in /sys/bus/iio/devices to get its positi=
on in
>> the global device topology and be able to tell what the parent devic=
e is,
>> but this path might not be completely stable either though. E.g. if =
your
>> device is on a I2C bus and the number of the I2C bus is dynamically =
assigned
>> it might change when the probe order changes.
>>
>> Alias seem to be one way to solve this issue. The big question remai=
ns is
>> how to communicate the alias to userspace. For other device classes =
the
>> alias index is used as the device index e.g. a device with alias i2c=
0 ends
>> up being the i2c adapter with index 0. But with IIO where we support=
 a wide
>> range of different devices that does not really work. E.g. what to d=
o if you
>> have adc0 and dac0 as aliases for different devices. So you'd need a
>> different way to expose the alias.
>>
>> Some bindings also use the "label" property to assign a unique name =
to node.
>> But again the same issue how to expose that information to applicati=
ons.
>>
> To continue from this "label" property idea I was wondering if we
> would add it as new optional(?) file node for IIO devices.>=20
> One could then specify it like:
>=20
> tscadc: tscadc@44e0d000 {
>     compatible =3D "ti,am3359-tscadc";
> ...
>     am335x_adc: adc {
>         compatible =3D "ti,am3359-adc";
> ...
>         label =3D "Port A";
>     };
> };
>=20
> And this would generate file /sys/bus/iio/iio:deviceX/label with
> contents of "Port A".
>=20
> Then during the application startup it would just need to scan all
> devices under /sys/bus/iio and determine what labelled device it
> wants to use.
>=20
> It would be up to device's developer to determine what labels to use
> in their designs. This would not break ABI and would be just an
> extension for it.
>=20
> One could also auto-assign label "am335x_adc" in this case too. But
> if you include existing arch device tree then changing label in top
> level is kinda a bit annoying as you would then need to duplicate all
> properties with another label and disable arch device tree's
> settings. Could cause also conflict if there are references elsewhere
> to existing arch nodes.
>=20
> Having following in device's device tree file would allow one to
> override label or just only specify that.
>=20
> #include "am33xx.dtsi"
>=20
> &tscadc {
>     status =3D "okay";
>=20
>     adc {
>         ti,adc-channels =3D <4 5 6 7>;
>=20
>         label =3D "Port A";
>     };
> };
>=20
> I think this "label" model would be simple to understand.
>=20
> Whether this needs to be implemented as per device driver feature or
> could be implemented as generic IIO functionality I do not know.
The principal looks good to me.  It's not however only an IIO issue
so perhaps we should expand the discussion to include other subsystems
likely to have similar issues (though perhaps to a lesser degree) such =
as
hwmon and input?  Any others?

We could also autobuild the label from other sources such as ACPI
to uniquely describe the instance of the device (afterall all we really
care about is that it always has the same name on the same hardware,=20
being able to assign meaningful simple names would just be the icing
on the cake!)

Jonathan
> Thanks,
> Vesa J=C3=A4=C3=A4skel=C3=A4inen
>=20
> --=20
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
