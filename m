From: Nicolas Saenz Julienne <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: 74x164: add dt support for nxp's 74x594
Date: Tue, 22 Mar 2016 23:16:02 +0000
Message-ID: <20160322231558.GA2611@vian>
References: <1457998330-8070-1-git-send-email-nicolassaenzj@gmail.com>
 <CAMuHMdW5Owzv06wnV34W3cYp=ibrONcfBVV6WST5VyvQ1ENjsA@mail.gmail.com>
 <20160322104207.GA2842@marie-Aspire-5600>
 <CAMuHMdWTteucxUgBU=d6=bckaZrn0vmr8LYW08UdULEtQYFzpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTteucxUgBU=d6=bckaZrn0vmr8LYW08UdULEtQYFzpg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert, thanks for your reply.

On Tue, Mar 22, 2016 at 11:56:51AM +0100, Geert Uytterhoeven wrote:
[..]
> For DT bindings, it doesn't matter who manufactured the part, or which
> technology was used (TTL, HC, LVC, ...).
> 
> Logically, the shiny new parts are compatible with the old ones, from as early
> as the 1960s.
> 
> Especially for standard logic glue, where you can source parts from several
> manufacturers, and which are available in many different technologies, it
> doesn't make much sense to have all combinations in the DT bindings.
> 
> https://en.wikipedia.org/wiki/7400_series
That did the trick.

> 
> Now, which one to pick?
> Given the precedence set by the existing compatible value "fairchild,74hc595",
> perhaps the most logical one to add is "fairchild,74hc594"?
> 
> Or can we just drop the manufacturer?
Well as you say DT doesn't care for technology nor manufacturer. I'd go for
dropping the manufacturer and adding an "x" for the technology (i.e. 74x595).
I saw that the binding is being used on some boards is there any rule against
changing bindings that are already being used?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
I'll happily do a new version of the patch if the idea is worth it.

	Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
