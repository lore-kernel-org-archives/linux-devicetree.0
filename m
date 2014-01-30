From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [U-Boot] recommended action for bootloaders regarding modifying
 device-tree nodes
Date: Thu, 30 Jan 2014 10:22:00 +0100
Message-ID: <CAOMqctSYBmbox9VifYHn9ej+onp2JVhMNXjns=uMMHgmWoTjDA@mail.gmail.com>
References: <CAJ+vNU366GiY4k_rnh1Jf0kra+PU99w4tDdM2sNioUAJCiZqOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJ+vNU366GiY4k_rnh1Jf0kra+PU99w4tDdM2sNioUAJCiZqOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, uboot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On 30 January 2014 10:11, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org> wrote:
> Greetings,
>
>
> Is it more appropriate for the bootloader to 'remove' nodes for
> devices that are not physically present or should I be setting their
> status property to 'disabled' instead?  I'm not clear if either option
> really has any pros or cons.
>

I am not a DT or u-boot developer but I observe these things:

1) DT include for a SoC has all supported devices. Some which require
external parts (eg. physical connectors, extra PHY, ...) are listed as
disabled and particular board DT enables them.

2) there is code for setting mac address on ethernet nodes with a
specific alias so you could perhaps reuse this code to set disabled
option on particular nodes.

Thanks

Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
