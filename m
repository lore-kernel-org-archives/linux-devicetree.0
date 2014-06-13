From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] firmware: Add device tree binding for coreboot
Date: Fri, 13 Jun 2014 14:58:51 -0700
Message-ID: <CAODwPW9tRM8kxBVg3apkec2K1rahuENk_b_BD_0jvXON7JzeaA@mail.gmail.com>
References: <1402689965-19397-1-git-send-email-jwerner@chromium.org>
	<CAL_JsqL-K4i54ysugCKSw-aO-9pvnYgZfJ=NdBAot=mwffxmyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL-K4i54ysugCKSw-aO-9pvnYgZfJ=NdBAot=mwffxmyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <stephen.r.warren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> This is just to export a fixed log to userspace (like a DMI table) or
> the kernel will actually use the data in some way? Based on the link,
> it looks like the former to me.

I could imagine both. The link is an in-kernel driver that exposes a
log through a sysfs node (in a way that has already been established
on x86 systems, which find the location through EBDA or ACPI entries
instead). We are also using a user-space tool that reads the address
from /proc/device-tree and accesses it through /dev/mem. The areas can
contain many interesting entries (like the location of an early
framebuffer set up by the firmware), so I could also imagine use cases
where the kernel makes use of it directly.

> Don't you need need to keep the kernel from allocating this memory by
> using one of the reserved memory mechanisms? The recently added one
> should be able to specific what the memory is reserved for IIRC.

Our bootloader is carving the location out of the /memory node and
adding it to the device tree reserve map. As far as I know, that only
contains a list of raw start and size entries. At any rate, I think
it's useful (and in line with other bindings) to add a more explicit
node like this (if only to make it easier accessible through
/proc/device-tree).

> /firmware is already used IIRC. What if you have other firmware such
> as Trustzone?

I'm not quite sure how Trusted Foundations works and whether it would
even make sense to use it in parallel to coreboot, but it seems to be
using the /firmware/trusted-foundations subnode so that should be
fine. "firmware" seems to be used by other firmware implementations
(like "samsung,secure-firmware") which are similar in nature to and
mutually exclusive with coreboot, so I thought the node makes sense.
(The kernel should use the compatible string to find it anyway, so a
future name clash would not be world-ending.)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
