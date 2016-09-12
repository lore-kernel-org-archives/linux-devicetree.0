From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: ARM, SoC: About the use DT-defined properties by 3rd-party drivers
Date: Mon, 12 Sep 2016 08:26:53 -0600
Message-ID: <CANCZdfri+T59FA4XTaH5JbW0BaJHt3w5eaSkpD8NrJn6nZrZbA@mail.gmail.com>
References: <57BDAF2E.10502@laposte.net> <CAOZdJXVjsR3NTWiJX33yT3jYk=FU65raWoMooTLD7OMN3sqP-A@mail.gmail.com>
 <57D69FB1.2020801@laposte.net> <20160912123809.GB13741@leverpostej>
 <57D6AA54.6000208@laposte.net> <20160912135549.GA14165@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160912135549.GA14165@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sebastian Frias <sf84-QFKgK+z4sOrR7s880joybQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mason <slash.tmp-GANU6spQydw@public.gmane.org>, Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 12, 2016 at 8:01 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>> Since the question seems understood, do you have an example of other SoC's
>> doing something similar?
>
> I do not have an example. I know that others are using DT for data
> beyond what Linux or another OS requires, but it's my understanding that
> that is typically in a separate DTB.

Just to clarify: FreeBSD uses, for the most part, the DTB's that the
'vendor' ships, which is quite often the same ones included in Linux.
There's some exceptions where the bindings weren't really hardware
independent, or where the abstraction model was really Linux specific
(for things like the HDMI stack).

However, with the advent of overlays, one would think that a vendor
could easily include an overlay with the DTB data for the devices they
don't wish to, or cannot for other reasons release. It seems like the
perfect mechanism to comply with the rules about inclusion of nodes in
the DTS. Vendors are free to document these nodes and don't require
the Linux kernel include them in the Documents directory to do so.
There have been recent efforts to move this documentation to a third
party to maintain.

Warner
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
