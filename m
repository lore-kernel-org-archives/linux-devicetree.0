From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: Re: IIO device indexing issue
Date: Thu, 5 Nov 2015 13:24:47 +0800
Message-ID: <563AE81F.5050700@electromag.com.au>
References: <5637AFC5.7080007@gmail.com> <5639D22D.3050901@metafoo.de>
 <563A5412.4030102@gmail.com> <563AB014.4030401@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563AB014.4030401-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 5/11/2015 9:25 AM, Phil Reid wrote:
> On 5/11/2015 2:53 AM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>> On 04/11/15 11:38, Lars-Peter Clausen wrote:
>>> On 11/02/2015 07:47 PM, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>>>> Hi,
>>>>
>>>> When we were using kernel 3.2 and with that board files we just go=
t=20
>>>> IIO
>>>> devices with static order so that we knew exactly what iio:device0=
 is.
>>>>
>>>> Now with device tree that order is not so static anymore especiall=
y=20
>>>> when
>>>> using device overlays (have not yet tried that thou). If there=20
>>>> would be
>>>> deferred probe for the device then if we have multiple iio:device'=
s=20
>>>> then
>>>> those could in theory be in any order.
>>>>
>>>> In example libiio uses iio device index to open the IIO device. So=
 the
>>>> problem is to know what iio:device is what.
>>>>
>>>> If we look files under /sys/bus/iio/iio:deviceX. They do not revea=
l=20
>>>> what
>>>> device this is (especially if there are multiple device of same=20
>>>> type). There
>>>> does not seem to be a way to give custom name for the iio device=20
>>>> from device
>>>> tree that could have been used as a cue.
>>>>
>>>> Device tree aliases kinda sounded a good idea to try. Eg. define=20
>>>> adc0 alias
>>>> and then link it to actual device node in tree.
>>>>
>>>> Aliases could be found under /proc/device-tree/aliases. Looking at=
=20
>>>> it shows
>>>> what device tree node it is. However there does not seem to be=20
>>>> actual link
>>>> from any /proc/device-tree entries to kernel drivers exposed under=
=20
>>>> sysfs.
>>>> And even the path components in device tree are not in same format=
=20
>>>> as in
>>>> sysfs. So there is no 1:1 mapping possible here.
>>>>
>>>> IIO devices in /sys/bus/iio/iio:deviceX seem to be symlinks to act=
ual
>>>> devices under /sys/devices and from there is physical path to the=20
>>>> device and
>>>> under that the IIO device with the same name as is under /sys/bus/=
iio.
>>>>
>>>> So in theory we could make a mapping configuration file that speci=
fies
>>>> logical name for iio device and then physical parent path for the=20
>>>> device and
>>>> then find under it iio:device* files to determine what is the iio=20
>>>> device
>>>> index for this physical device. Then open IIO device with that=20
>>>> index in
>>>> example with libiio. Sounds a bit complex?
>>>>
>>>> So did we miss something on how this should be defined/accessed or=
=20
>>>> is there
>>>> a slight issue here on how to identify iio devices?
>>>>
>>>> Don't know how device tree overlays affect this if we first load=20
>>>> device tree
>>>> overlay with some configuration and then unload it and load anothe=
r=20
>>>> one with
>>>> different configuration.
>>> Hi,
>>>
>>> Yes, excellent analysis. This is a real issue. As you said there is=
 no
>>> guarantee that the IIO device numbers are stable, they are assigned=
=20
>>> in the
>>> order the devices are registered. If the device are registered in a
>>> different order for whatever reason the numbers will change. You ca=
n=20
>>> use
>>> readlink on the IIO device in /sys/bus/iio/devices to get its=20
>>> position in
>>> the global device topology and be able to tell what the parent=20
>>> device is,
>>> but this path might not be completely stable either though. E.g. if=
=20
>>> your
>>> device is on a I2C bus and the number of the I2C bus is dynamically=
=20
>>> assigned
>>> it might change when the probe order changes.
>>>
>>> Alias seem to be one way to solve this issue. The big question=20
>>> remains is
>>> how to communicate the alias to userspace. For other device classes=
 the
>>> alias index is used as the device index e.g. a device with alias=20
>>> i2c0 ends
>>> up being the i2c adapter with index 0. But with IIO where we suppor=
t=20
>>> a wide
>>> range of different devices that does not really work. E.g. what to=20
>>> do if you
>>> have adc0 and dac0 as aliases for different devices. So you'd need =
a
>>> different way to expose the alias.
>>>
>>> Some bindings also use the "label" property to assign a unique name=
=20
>>> to node.
>>> But again the same issue how to expose that information to=20
>>> applications.
>>>
>> To continue from this "label" property idea I was wondering if we=20
>> would add it as new optional(?) file node for IIO devices.
>>
>> One could then specify it like:
>>
>> tscadc: tscadc@44e0d000 {
>>     compatible =3D "ti,am3359-tscadc";
>> ...
>>     am335x_adc: adc {
>>         compatible =3D "ti,am3359-adc";
>> ...
>>         label =3D "Port A";
>>     };
>> };
>>
>> And this would generate file /sys/bus/iio/iio:deviceX/label with=20
>> contents of "Port A".
>>
>> Then during the application startup it would just need to scan all=20
>> devices under /sys/bus/iio and determine what labelled device it=20
>> wants to use.
>>
>> It would be up to device's developer to determine what labels to use=
=20
>> in their designs. This would not break ABI and would be just an=20
>> extension for it.
>>
>> One could also auto-assign label "am335x_adc" in this case too. But=20
>> if you include existing arch device tree then changing label in top=20
>> level is kinda a bit annoying as you would then need to duplicate al=
l=20
>> properties with another label and disable arch device tree's=20
>> settings. Could cause also conflict if there are references elsewher=
e=20
>> to existing arch nodes.
>>
>> Having following in device's device tree file would allow one to=20
>> override label or just only specify that.
>>
>> #include "am33xx.dtsi"
>>
>> &tscadc {
>>     status =3D "okay";
>>
>>     adc {
>>         ti,adc-channels =3D <4 5 6 7>;
>>
>>         label =3D "Port A";
>>     };
>> };
>>
>> I think this "label" model would be simple to understand.
>>
>> Whether this needs to be implemented as per device driver feature or=
=20
>> could be implemented as generic IIO functionality I do not know.
>>
>> Thanks,
>> Vesa J=C3=A4=C3=A4skel=C3=A4inen
> This would be a very useful feature as I'm encountering this problem=20
> at the moment.
> The label concept is simple and easy to use.
Thinking a bit more how would this work if accessing the device via the=
=20
network interface.
Currently it show the device (chip) name (eg max5541) but there can be=20
multiple devices like that.
Needs to be published thru libiio as well?

Regards
Phil
