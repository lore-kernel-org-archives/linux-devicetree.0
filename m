From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH 06/21] of/platform: Add of_platform_device_ensure()
Date: Wed, 27 May 2015 10:04:35 +0200
Message-ID: <CAAObsKBbh3cG5MqMGEXp3heoJPHGLmpEefmRxdx_pXEFkDT5eQ@mail.gmail.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
 <1432565608-26036-7-git-send-email-tomeu.vizoso@collabora.com> <20150526185654.GE10571@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150526185654.GE10571@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26 May 2015 at 20:56, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Tomeu,
>
> On Mon, May 25, 2015 at 04:53:10PM +0200, Tomeu Vizoso wrote:
>> This function ensures that the device that encloses the passed device
>> node is registered, and thus probed if the corresponding driver has been
>> registered already.
>
> Even if the driver has already been registered this code will not
> guarantee that the device has been probed if driver enabled asynchronous
> probing (async probing should appear in 4.2 and the end goal is to have
> async probing enabled by default for most drivers).

Ok, I will look at that. Do you know if there's any board plugged into
kernelci.org in which most drivers have async probing enabled already
in linux-next?

> Also, why are we concentrating on platform drivers only? What about
> other devices, for example a gpio expander behind i2c bus?

The current code will register the i2c master device when a device
requests one of those gpios, and the gpio master device will be
registered when the i2c master is probed.

> I am also concerned about adding OF-specific hooks into every subsystem
> out there.

Well, those hooks are in the OF-specific code that we already added in
every subsystem out there. But yeah, it would be great if we didn't
had to add them.

> Can we make process of instantiating OF devices iterative
> instead and add them only if their parent has been already probed and

This is what happens today when the mach code calls
of_platform_populate on the root node, right? Or are you thinking of
something different?

> also devices corresponding to all phandles they reference have also been
> probed? We could repeat scanning of the device tree every time we bind
> a driver and bulk-add leftovers at late_initcall time.

Yeah, this possibility was discussed in the thread linked from the
cover letter. The main problem is that the knowledge required to infer
from the phandles what devices are dependencies is in the DT bindings
documentation.

That knowledge is already codified in both each driver's probe
function (for example when regulator_get_optional(dev, "phy") is
called) and the functions that resolve dependencies when a device
requests them (of_get_regulator(dev, "phy") in this example).

That's why I thought of this approach, the main advantage of which is
that it makes use of all that existing code without having to modify
each driver and subsystem core.

There's several ways to address this problem but require substantial
refactoring. I just wanted to propose this alternative because it
hadn't been discussed before and because I think it brings an
interesting cost/benefit ratio.

> This would
> mean that we could keep all logic in OF code (and maybe ACPI will add
> their own implementation) and keep other subsystems unaware.

Yeah, that would be cool to have, but TBH I don't know if it's worth it.

Regards,

Tomeu

> Thanks.
>
> --
> Dmitry
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
