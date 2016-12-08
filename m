From: Christopher Bostic <christopher.lee.bostic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/16] drivers/fsi: Add crc4 helpers
Date: Thu, 8 Dec 2016 13:43:33 -0600
Message-ID: <CAA0LjjVuHoggi+vMHMo6OFRfVxY7im5pEAYPGUefrci7NjPncg@mail.gmail.com>
References: <1481076574-54711-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1481076574-54711-2-git-send-email-christopher.lee.bostic@gmail.com>
 <20161207090219.GA14742@kroah.com> <81146f25-05fa-70f9-e8ff-49c17aede8f2@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <81146f25-05fa-70f9-e8ff-49c17aede8f2-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, Open List OF Flattened dev tree bindings <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Moderated list: ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linux open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Alistair Popple <alistair-Y4h6yKqj69EXC2x5gXVKYQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Chris Bostic <cbostic-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 7, 2016 at 5:33 PM, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org> wrote:
> Hi Greg,
>
>> Why not just create lib/crc4.c with these functions, like the other crc
>> functions in the kernel?
>
> Two (bad) reasons:
>
>  - The crc4 implementation here is pretty specific to the FSI
>    usage (only supporting 4-bit-sized chunks), to keep the math & lookup
>    table simple
>
>  - I'm lazy
>
> So yes, we should spend the effort now to make this generic enough for
> a lib/crc4.c. Would we want to support different values for the
> polynomial?
>
> Chris: do you want me to to that, or will you?

Hi Jeremy,

I'll take this one.  Will implement as per Greg's suggestions.

Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
