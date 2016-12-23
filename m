From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] iio: misc: add a generic regulator driver
Date: Fri, 23 Dec 2016 13:56:11 +0100
Message-ID: <CAMuHMdXnzDUYcr8qiUTwE2peBdjwuVWPRUkms2J8AHFaQ=SHHQ@mail.gmail.com>
References: <1480432969-20913-1-git-send-email-bgolaszewski@baylibre.com>
 <44cce3d5-f65e-1a35-20a4-5eb9fda42312@metafoo.de> <CAMpxmJWDWk-mXUHHGEKm-VVwzqEGLDQjc274Xq+Qwc2eN=YbsQ@mail.gmail.com>
 <d4c7f1ca-49d4-7abe-bfc9-e1728f62a9fb@metafoo.de> <bf3dde7e-cee8-c54c-db93-447ffa063116@kernel.org>
 <CAMpxmJVJ+y9tRbRBsVg+i0EJO_6EFuvrypwC=ETnBWbMnxRFyg@mail.gmail.com>
 <c670d597-46b6-235f-545f-7136a3abff7f@metafoo.de> <CAMuHMdX3u4cb2Yq2+VV_eDUaw2EqiOjN2TorW+F5-39Mm=mXmQ@mail.gmail.com>
 <9609b56b-194c-9899-1142-ff2ee285c6bd@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9609b56b-194c-9899-1142-ff2ee285c6bd-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lars,

On Fri, Dec 23, 2016 at 12:35 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
> On 12/23/2016 11:00 AM, Geert Uytterhoeven wrote:
>> On Mon, Dec 12, 2016 at 6:15 PM, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org> wrote:
>>> On 12/06/2016 12:12 PM, Bartosz Golaszewski wrote:
>>>> We're already using libiio to read the measured data from the power
>>>> monitor, that's why we'd like to use the iio framework for
>>>> power-cycling the devices as well. My question is: would bridging the
>>>> regulator framework be the right solution? Should we look for
>>>> something else? Bridge the GPIO framework instead?
>>>
>>> I wouldn't necessaries create bridge, but instead just use the GPIO
>>> framework directly.
>>>
>>> We now have the GPIO chardev interface which meant to be used to support
>>> application specific logic that control the GPIOs, but where you don't want
>>> to write a kernel driver.
>>>
>>> My idea was to add GPIOs and GPIO chips as high level object inside libiio
>>> that can be accessed through the same context as the IIO devices. Similar to
>>> the current IIO API you have a API for gpios that allows to enumerate the
>>> GPIO devices and their pins as well as modify the pin state.
>>
>> That would mean libiio has access to all GPIOs, allowing a remote person
>> to not only control through iiod the GPIOs for industrial control, but also the
>> GPIOs not intended for export, right?
>
> Well, it is a policy question. Who gets access to what. Right now it is all
> or nothing, a privileged application gets access to all devices/GPIOs, a
> unprivileged application gets access to nothing. Same for GPIOs as well as
> IIO devices.
>
> iiod at the moment does not have any access control at all, which in itself
> is a problem. We need to add support for that at some point. I don't see an
> issue with implementing a finer grained access scheme when we do so. E.g.
> unprivileged applications only get access to certain pins.

OK, so that's WIP.

>> Having a separate GPIO switch driver avoids that, as DT (or some other means)
>> can be used to specify and label the GPIOs for IIO use.
>
> Sure, functionally this would be equivalent, but we have to ask whether this
> is the right way to use the DT. Is access policy specification part of the
> hardware description? In my opinion the answer is no. At the hardware
> description level there is no operating system, there is no userspace or
> kernelspace, there is are no access levels. Putting the distinction between
> a switch/regulator that can be controlled from userspace or can only be
> controlled from kernel space into the DT would be a layering violation. It
> is analogous to why we don't have spidev DT bindings. This is an issue that
> needs to be solved at a higher level. In my opinion this level is a
> cooperation between kernel- and userspace. Kernelspace offering an interface
> to export a device for userspace access and userspace making use of that
> interface to request access to a device. In a similar way to how vfio is
> structured.

I'm not advocating using DT for policy, only for hardware description.

We have means (bindings) to describe GPIOs connected to LEDs and switches
(incl. their labels), while you can control LEDs through plain GPIO sysfs
export or chardev, too. It's just more error prone to use the latter.

We do not have bindings to describe GPIOs connected to e.g. relays.

Switching external devices (the internals of those devices not described
itself in DT, like in an industrial context), sounds more like something to
be handled by IIO, doesn't it?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
