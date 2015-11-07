From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: IIO device indexing issue
Date: Sat, 7 Nov 2015 11:03:26 +0200
Message-ID: <563DBE5E.6060307@gmail.com>
References: <5637AFC5.7080007@gmail.com> <563A5412.4030102@gmail.com>
 <563BAA65.3020609@kernel.org> <5517276.dg3z7SpAvu@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5517276.dg3z7SpAvu@adelgunde>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/11/15 11:49, Markus Pargmann wrote:
> Hi,
>
> On Thursday, November 05, 2015 07:13:41 PM Jonathan Cameron wrote:
>> On 04/11/15 18:53, Vesa J=C3=A4=C3=A4skel=C3=A4inen wrote:
>>> To continue from this "label" property idea I was wondering if we
>>> would add it as new optional(?) file node for IIO devices.>
>>> One could then specify it like:
>>>
>>> tscadc: tscadc@44e0d000 {
>>>      compatible =3D "ti,am3359-tscadc";
>>> ...
>>>      am335x_adc: adc {
>>>          compatible =3D "ti,am3359-adc";
>>> ...
>>>          label =3D "Port A";
>>>      };
>>> };
>>>
>>> And this would generate file /sys/bus/iio/iio:deviceX/label with
>>> contents of "Port A".
>>>
>>> Then during the application startup it would just need to scan all
>>> devices under /sys/bus/iio and determine what labelled device it
>>> wants to use.
>>>
>>> It would be up to device's developer to determine what labels to us=
e
>>> in their designs. This would not break ABI and would be just an
>>> extension for it.
>>>
>>> One could also auto-assign label "am335x_adc" in this case too. But
>>> if you include existing arch device tree then changing label in top
>>> level is kinda a bit annoying as you would then need to duplicate a=
ll
>>> properties with another label and disable arch device tree's
>>> settings. Could cause also conflict if there are references elsewhe=
re
>>> to existing arch nodes.
>>>
>>> Having following in device's device tree file would allow one to
>>> override label or just only specify that.
>>>
>>> #include "am33xx.dtsi"
>>>
>>> &tscadc {
>>>      status =3D "okay";
>>>
>>>      adc {
>>>          ti,adc-channels =3D <4 5 6 7>;
>>>
>>>          label =3D "Port A";
>>>      };
>>> };
>>>
>>> I think this "label" model would be simple to understand.
>>>
>>> Whether this needs to be implemented as per device driver feature o=
r
>>> could be implemented as generic IIO functionality I do not know.
>> The principal looks good to me.  It's not however only an IIO issue
>> so perhaps we should expand the discussion to include other subsyste=
ms
>> likely to have similar issues (though perhaps to a lesser degree) su=
ch as
>> hwmon and input?  Any others?
>>
>> We could also autobuild the label from other sources such as ACPI
>> to uniquely describe the instance of the device (afterall all we rea=
lly
>> care about is that it always has the same name on the same hardware,
>> being able to assign meaningful simple names would just be the icing
>> on the cake!)
> There is a similar discussion for the new character device GPIO inter=
face.[1]
>
> Simple labels have the problem that they could be the same for two de=
vicetree
> overlays or chips that are connected via SPI.
>
As far as I understand the overlays, you always specify a hardware=20
hierarchy where you want to add additional information to device tree.=20
This means that while adding device with overlays you have full control=
=20
what device it is and then can configure what label property device=20
should have.

If you would add two SPI devices those would be unique items in the=20
device tree this means that overlay adding those would be unique and=20
then you can assign unique label for the devices.

When you have full control for device tree and device tree overlays=20
added to your device then this should not be problem?

Problem not addressed by device tree would be dynamically configured=20
buses like USB which could have user connected devices. But then again=20
you probably do not configure this with device tree either? In this cas=
e=20
if "label" would be read&write property then udev or such could then=20
fill it with details based on your configuration.

As commented on the thread you pointed out was question should the labe=
l=20
property have physical path components in there. There was comment that=
=20
symlink (in IIO case this would be symlinks under /sys/bus/iio/) should=
=20
have the details available if this is needed for decision.

Basically application developer could have following tools to perform=20
his decision:

Scan /sys/bus/iio/ for iio:deviceN's.

- Get "name" property (driver identification).
- Do realpath for symlink to get physical address
- Get "label" property to have cue what this device is for

On other thread one idea was to have UUID for devices as a label (fstab=
=20
+ partition UUID's was the idea behind it). How to make it stick for=20
every boot is the problem here however. You could use UUID in hash mode=
=20
(eg. version 5) and then just determine what details affect it. For USB=
=20
devices which could be moved to other slots this is still an issue as o=
n=20
some cases it would be irrelevant on what slot it is and in some cases=20
it could be relevant. There are also other properties that are device=20
specific like should the UUID hash include serial number of the device=20
or not? This same problem matches to other automatic label cases. So I=20
suppose there is no one solution that fits for all cases.

To setup label automatically you seem to need to have local configurati=
on.

If the process would be something like:

- Setup device tree with optional label property.
- If label is not defined in device tree leave it as empty
- When user space starts up it can have local configuration that adjust=
s=20
labels
- If there is a daemon in system like udev and new device is inserted=20
then it could have rules for configuring labels.

I think this would allow one to setup whatever identification one wants=
=20
to use for label.

Rest would be application configuration that uses available information=
=20
to do its magic.

Thanks,
Vesa J=C3=A4=C3=A4skel=C3=A4inen
