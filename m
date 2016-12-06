From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Tue, 6 Dec 2016 14:02:24 +0100
Message-ID: <CAMpxmJUDyZmokJsf=RdP1DwzA_4Xc+Oh3SuSg_OenQOO5mqLvw@mail.gmail.com>
References: <1480420624-23544-1-git-send-email-bgolaszewski@baylibre.com>
 <1480420624-23544-2-git-send-email-bgolaszewski@baylibre.com> <a2159347-1cd7-18b1-626a-fe6a272ba85c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a2159347-1cd7-18b1-626a-fe6a272ba85c-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-12-05 13:49 GMT+01:00 Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>:
> On 29/11/16 13:57, Bartosz Golaszewski wrote:
>> Add the dumb-vga-dac node to the board DT together with corresponding
>> ports and vga connector. This allows to retrieve the edid info from
>> the display automatically.
>>
>
> It's a bit difficult to follow this as there's been so many patches
> going around. But I take the above is the LCDC node in the base da850
> dtsi file? In that case, what is the display_in supposed to present?
> It's the first node in the "display chain", so it has no input.
>
> Also, don't touch da850.dtsi here, just add the "ports" node in the
> da850-lcdk.dts file.
>
> If the da850.dtsi has not been merged yet, I'd change the name of the
> lcdc node to something else than "display". It's rather vague. If it's
> named "lcdc", reading da850-lcdk.dts becomes much easier, as you'll
> refer to "lcdc".
>

The node is already in Sekhar's branch.

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
