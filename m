From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] To remove non-ascii characters in of_selftest.txt
Date: Mon, 29 Sep 2014 10:07:51 +0200
Message-ID: <CAMuHMdUvr49-iWUwNDrC6iDkrY_rE2hpynzeFS47j1W-69OfNQ@mail.gmail.com>
References: <1411933087-4272-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411933087-4272-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Gaurav, Grant,

On Sun, Sep 28, 2014 at 9:38 PM, Gaurav Minocha
<gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch removes the non-ascii characters in
> Documentation/devicetree/of_selftest.txt

I was wondering against which tree this was, as this file was not in my
local copy of linux-next (which was still at next-20140925).

Perhaps the filename was wrong?

So I grepped for "of_fdt_unflatten_device_tree", as this looked like a good
search pattern, cfr.

>  Secondly, it calls of_fdt_unflatten_device_tree() to unflatten the flattened

Surprise! No occurrences of  "of_fdt_unflatten_device_tree" found!

[ more digging ]

Ah, found it, it went almost straight into Linus' tree, and thus appeared in
next-20140926 after the fact.

Still:

$ git grep of_fdt_unflatten_device_tree | cat
Documentation/devicetree/of_selftest.txt:Secondly, it calls
of_fdt_unflatten_device_tree() to unflatten the flattened
$

So this part of the documentation is not correct.

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
