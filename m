From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: IIO device indexing issue
Date: Wed, 04 Nov 2015 10:38:53 +0100
Message-ID: <5639D22D.3050901@metafoo.de>
References: <5637AFC5.7080007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5637AFC5.7080007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/02/2015 07:47 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
> Hi,
>=20
> When we were using kernel 3.2 and with that board files we just got I=
IO
> devices with static order so that we knew exactly what iio:device0 is=
=2E
>=20
> Now with device tree that order is not so static anymore especially w=
hen
> using device overlays (have not yet tried that thou). If there would =
be
> deferred probe for the device then if we have multiple iio:device's t=
hen
> those could in theory be in any order.
>=20
> In example libiio uses iio device index to open the IIO device. So th=
e
> problem is to know what iio:device is what.
>=20
> If we look files under /sys/bus/iio/iio:deviceX. They do not reveal w=
hat
> device this is (especially if there are multiple device of same type)=
=2E There
> does not seem to be a way to give custom name for the iio device from=
 device
> tree that could have been used as a cue.
>=20
> Device tree aliases kinda sounded a good idea to try. Eg. define adc0=
 alias
> and then link it to actual device node in tree.
>=20
> Aliases could be found under /proc/device-tree/aliases. Looking at it=
 shows
> what device tree node it is. However there does not seem to be actual=
 link
> from any /proc/device-tree entries to kernel drivers exposed under sy=
sfs.
> And even the path components in device tree are not in same format as=
 in
> sysfs. So there is no 1:1 mapping possible here.
>=20
> IIO devices in /sys/bus/iio/iio:deviceX seem to be symlinks to actual
> devices under /sys/devices and from there is physical path to the dev=
ice and
> under that the IIO device with the same name as is under /sys/bus/iio=
=2E
>=20
> So in theory we could make a mapping configuration file that specifie=
s
> logical name for iio device and then physical parent path for the dev=
ice and
> then find under it iio:device* files to determine what is the iio dev=
ice
> index for this physical device. Then open IIO device with that index =
in
> example with libiio. Sounds a bit complex?
>=20
> So did we miss something on how this should be defined/accessed or is=
 there
> a slight issue here on how to identify iio devices?
>=20
> Don't know how device tree overlays affect this if we first load devi=
ce tree
> overlay with some configuration and then unload it and load another o=
ne with
> different configuration.

Hi,

Yes, excellent analysis. This is a real issue. As you said there is no
guarantee that the IIO device numbers are stable, they are assigned in =
the
order the devices are registered. If the device are registered in a
different order for whatever reason the numbers will change. You can us=
e
readlink on the IIO device in /sys/bus/iio/devices to get its position =
in
the global device topology and be able to tell what the parent device i=
s,
but this path might not be completely stable either though. E.g. if you=
r
device is on a I2C bus and the number of the I2C bus is dynamically ass=
igned
it might change when the probe order changes.

Alias seem to be one way to solve this issue. The big question remains =
is
how to communicate the alias to userspace. For other device classes the
alias index is used as the device index e.g. a device with alias i2c0 e=
nds
up being the i2c adapter with index 0. But with IIO where we support a =
wide
range of different devices that does not really work. E.g. what to do i=
f you
have adc0 and dac0 as aliases for different devices. So you'd need a
different way to expose the alias.

Some bindings also use the "label" property to assign a unique name to =
node.
But again the same issue how to expose that information to applications=
=2E

- Lars
