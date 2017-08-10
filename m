From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
Date: Wed, 9 Aug 2017 18:14:43 -0700
Message-ID: <CAFd5g47LA0jyhvnRb4i6GXsQOdPbJJrn+uCsQgnMRQgah6gKfA@mail.gmail.com>
References: <20170804231854.19730-1-brendanhiggins@google.com> <57021502276176@webcorp01h.yandex-team.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57021502276176-OEmCjAEqX0ITMcy66jKROkXOewmhPV1Zh13vi7wywA4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Anton D. Kachalov" <mouse-XoJtRXgx1JseBXzfvpsJ4g@public.gmane.org>
Cc: "corbet-T1hC0tSOHrs@public.gmane.org" <corbet-T1hC0tSOHrs@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "minyard-HInyCGIudOg@public.gmane.org" <minyard-HInyCGIudOg@public.gmane.org>, "joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org" <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, "benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org" <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <openipmi-developer-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 9, 2017 at 3:56 AM, Anton D. Kachalov <mouse-XoJtRXgx1JseBXzfvpsJ4g@public.gmane.org> wrote:
> Hello,
>
> I would like to mention one of the our related work for IPMI and I2C.
>
> We use OpenIPMI stack to connect to the computing nodes through the I2C
> using IPMB (BT is not supported by nodes):
>
> https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/ipmi_i2c.c
>
> It lacks complete slave support (slave part is only for receiving known
> packets with query results due to OpenIPMI implementation in kernel) and use
> one local slave to communicate with a number of target systems on the same
> bus (currently supported only 1-to-1 schema).
>
> With this stuff we able to use ipmitool across different /dev/ipmiX devices
> to communicate with nodes.

Cool, I met someone else who had a similar use case which is part of why
I decided to share this (not sure if should say who).

So it sounds like we are probably not going to go with the approach I proposed;
if you indeed find this useful, I would suggest that we put this in our OpenBMC
repository and switch it out with the suggested method at some point.

Let me know what you think
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
