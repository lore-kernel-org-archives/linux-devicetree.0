From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: IIO device indexing issue
Date: Wed, 4 Nov 2015 20:53:06 +0200
Message-ID: <563A5412.4030102@gmail.com>
References: <5637AFC5.7080007@gmail.com> <5639D22D.3050901@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5639D22D.3050901-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/11/15 11:38, Lars-Peter Clausen wrote:
> On 11/02/2015 07:47 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>> Hi,
>>
>> When we were using kernel 3.2 and with that board files we just got =
IIO
>> devices with static order so that we knew exactly what iio:device0 i=
s.
>>
>> Now with device tree that order is not so static anymore especially =
when
>> using device overlays (have not yet tried that thou). If there would=
 be
>> deferred probe for the device then if we have multiple iio:device's =
then
>> those could in theory be in any order.
>>
>> In example libiio uses iio device index to open the IIO device. So t=
he
>> problem is to know what iio:device is what.
>>
>> If we look files under /sys/bus/iio/iio:deviceX. They do not reveal =
what
>> device this is (especially if there are multiple device of same type=
). There
>> does not seem to be a way to give custom name for the iio device fro=
m device
>> tree that could have been used as a cue.
>>
>> Device tree aliases kinda sounded a good idea to try. Eg. define adc=
0 alias
>> and then link it to actual device node in tree.
>>
>> Aliases could be found under /proc/device-tree/aliases. Looking at i=
t shows
>> what device tree node it is. However there does not seem to be actua=
l link
>> from any /proc/device-tree entries to kernel drivers exposed under s=
ysfs.
>> And even the path components in device tree are not in same format a=
s in
>> sysfs. So there is no 1:1 mapping possible here.
>>
>> IIO devices in /sys/bus/iio/iio:deviceX seem to be symlinks to actua=
l
>> devices under /sys/devices and from there is physical path to the de=
vice and
>> under that the IIO device with the same name as is under /sys/bus/ii=
o.
>>
>> So in theory we could make a mapping configuration file that specifi=
es
>> logical name for iio device and then physical parent path for the de=
vice and
>> then find under it iio:device* files to determine what is the iio de=
vice
>> index for this physical device. Then open IIO device with that index=
 in
>> example with libiio. Sounds a bit complex?
>>
>> So did we miss something on how this should be defined/accessed or i=
s there
>> a slight issue here on how to identify iio devices?
>>
>> Don't know how device tree overlays affect this if we first load dev=
ice tree
>> overlay with some configuration and then unload it and load another =
one with
>> different configuration.
> Hi,
>
> Yes, excellent analysis. This is a real issue. As you said there is n=
o
> guarantee that the IIO device numbers are stable, they are assigned i=
n the
> order the devices are registered. If the device are registered in a
> different order for whatever reason the numbers will change. You can =
use
> readlink on the IIO device in /sys/bus/iio/devices to get its positio=
n in
> the global device topology and be able to tell what the parent device=
 is,
> but this path might not be completely stable either though. E.g. if y=
our
> device is on a I2C bus and the number of the I2C bus is dynamically a=
ssigned
> it might change when the probe order changes.
>
> Alias seem to be one way to solve this issue. The big question remain=
s is
> how to communicate the alias to userspace. For other device classes t=
he
> alias index is used as the device index e.g. a device with alias i2c0=
 ends
> up being the i2c adapter with index 0. But with IIO where we support =
a wide
> range of different devices that does not really work. E.g. what to do=
 if you
> have adc0 and dac0 as aliases for different devices. So you'd need a
> different way to expose the alias.
>
> Some bindings also use the "label" property to assign a unique name t=
o node.
> But again the same issue how to expose that information to applicatio=
ns.
>
To continue from this "label" property idea I was wondering if we would=
=20
add it as new optional(?) file node for IIO devices.

One could then specify it like:

tscadc: tscadc@44e0d000 {
     compatible =3D "ti,am3359-tscadc";
=2E..
     am335x_adc: adc {
         compatible =3D "ti,am3359-adc";
=2E..
         label =3D "Port A";
     };
};

And this would generate file /sys/bus/iio/iio:deviceX/label with=20
contents of "Port A".

Then during the application startup it would just need to scan all=20
devices under /sys/bus/iio and determine what labelled device it wants=20
to use.

It would be up to device's developer to determine what labels to use in=
=20
their designs. This would not break ABI and would be just an extension=20
for it.

One could also auto-assign label "am335x_adc" in this case too. But if=20
you include existing arch device tree then changing label in top level=20
is kinda a bit annoying as you would then need to duplicate all=20
properties with another label and disable arch device tree's settings.=20
Could cause also conflict if there are references elsewhere to existing=
=20
arch nodes.

Having following in device's device tree file would allow one to=20
override label or just only specify that.

#include "am33xx.dtsi"

&tscadc {
     status =3D "okay";

     adc {
         ti,adc-channels =3D <4 5 6 7>;

         label =3D "Port A";
     };
};

I think this "label" model would be simple to understand.

Whether this needs to be implemented as per device driver feature or=20
could be implemented as generic IIO functionality I do not know.

Thanks,
Vesa J=C3=A4=C3=A4skel=C3=A4inen

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
