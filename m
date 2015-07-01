From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH/RFC 3/3] of/dynamic: Update list of aliases on aliases changes
Date: Wed, 1 Jul 2015 08:53:39 +0200
Message-ID: <CAMuHMdWF22K0R+0sRzp3PYhTXceQMY9NUO3Z1nk8WPvWdMtxZA@mail.gmail.com>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
	<1435675876-2159-4-git-send-email-geert+renesas@glider.be>
	<20150630172131.D4E6CC4041A@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150630172131.D4E6CC4041A-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Tue, Jun 30, 2015 at 7:21 PM, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, 30 Jun 2015 16:51:16 +0200
> , Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>  wrote:
>> Currently the list of aliases is not updated when an overlay that
>> modifies /aliases is added or removed. This breaks drivers (e.g. serial)
>> that rely on of_alias_get_id().
>>
>> Update the list of aliases when a property of the /aliases node is
>> added, removed, or updated.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

>>   - Is it safe to deallocate struct alias_prop using kfree()? It may
>>     have been allocated using early_init_dt_alloc_memory_arch() /
>>     memblock_alloc(). What's the alternative? Leaking memory?
>
> Properties are not refcounted, so yes we leak memory. The memory remains
> owned by the aliases node, but because the aliases node is never freed,
> neither are any of the properties. Solving this isn't easy because it
> would require adding refcounting *everywhere* that properties are
> accessed. I think we have to just live with it until someone clever can
> some up with a solution.

Please note that struct alias_prop is not a property, but a list_head.
Hence it's not added to the deadprops of a node, and it isn't owned by
anyone after removal from the aliases_lookup list.
I can create a new dead_aliases list for that, if that's what needed...

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
