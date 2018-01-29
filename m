From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 1/2] of: change overlay apply input data from EDT to FDT
Date: Mon, 29 Jan 2018 16:05:49 +0100
Message-ID: <CAMuHMdVz05Ygk34y-DiBGraf3xSh8deRoKGDfHv92-WYCu4HfQ@mail.gmail.com>
References: <1517194414-19932-1-git-send-email-frowand.list@gmail.com>
 <1517194414-19932-2-git-send-email-frowand.list@gmail.com> <CABGGisyx_aXCxKO5x-5M5mEM7s=jMYZDaQZ9jdL6hapMCOyM=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABGGisyx_aXCxKO5x-5M5mEM7s=jMYZDaQZ9jdL6hapMCOyM=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 29, 2018 at 3:42 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Jan 28, 2018 at 8:53 PM,  <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Move duplicating and unflattening of an overlay flattened devicetree
>> (FDT) into the overlay application code.  To accomplish this,
>> of_overlay_apply() is replaced by of_overlay_fdt_apply().
>>
>> The copy of the FDT (aka "duplicate FDT") now belongs to devicetree
>> code, which is thus responsible for freeing the duplicate FDT.  The
>> caller of of_overlay_fdt_apply() remains responsible for freeing the
>> original FDT.
>>
>> The unflattened device tree (aka expanded device tree, EDT) now
>
> Not really a fan of a new acronym.

FWIW, it has already sneaked in:

$ git grep -w EDT -- drivers/of
drivers/of/unittest.c:   * will create pointers to the passed in FDT in the EDT.

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
