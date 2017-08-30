From: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Status of drivers/of/configfs.c
Date: Tue, 29 Aug 2017 20:13:40 -0500
Message-ID: <CAOCHtYiifaWwRQJ8frZRtz=V6WeRnxE1AYLXwpZ9FJ7Am1vB-A@mail.gmail.com>
References: <CAFD1m3FQ6vNF9sUU67g_VE5nKsHWk-MfmHiVqyjpZmoq544AxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFD1m3FQ6vNF9sUU67g_VE5nKsHWk-MfmHiVqyjpZmoq544AxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Carter <john.carter-U313QQUz4dygSpxsJD1C4w@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi John,

On Tue, Aug 29, 2017 at 5:37 PM, John Carter <john.carter-U313QQUz4dygSpxsJD1C4w@public.gmane.org> wrote:
> In 2014 Pantelis Antoniou sent a patch...
>     https://lkml.org/lkml/2014/3/18/625
> ...creating an interface between the config filesystem and devicetree overlays.
>
> As far as I can see it is used in a couple of "off the mainstream
> kernel" like the beaglebone black.
>
> Alas, at this stage it doesn't seem to have made it into the upstream
> kernel.....
>
> 1) What is the status of this patch? Is it still being maintained? If so where?
>
> 2) My interest in it is for an nasty bit of oddball hardware.
>
> I have to change a pin from being an gpio input at boot time to being
> a uart output sometime after boot.
>
> Would the of / configfs be the best way of doing that or is there a better way?

I think most of us have given up on making it work in the kernel, just
too many race conditions.

I'd say for the last half year we (beagleboard) have been focusing on
moving to u-boot overlays.  Just less issues when you have the
device-tree-binary setup in a proper state at kernel boot.

Regards,

-- 
Robert Nelson
https://rcn-ee.com/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
