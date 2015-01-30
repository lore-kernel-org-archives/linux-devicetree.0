From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [1/3] powerpc/pmac: Fix DT refcount imbalance in pmac_pic_probe_oldstyle
Date: Fri, 30 Jan 2015 10:00:23 +0100
Message-ID: <CAMuHMdUwQ=K7SnFvpaHzL2dCyNXGR3w-_SzFOEWb3cYCiQJfHg@mail.gmail.com>
References: <1421243519-6257-2-git-send-email-geert+renesas@glider.be>
	<20150130040904.8F89D1402A7@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150130040904.8F89D1402A7-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Michael,

On Fri, Jan 30, 2015 at 5:09 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> On Wed, 2015-14-01 at 13:51:57 UTC, Geert Uytterhoeven wrote:
>> of_find_node_by_name() calls of_node_put() on its "from" parameter,
>> which must not be done on "master", as it's still in use, and will be
>> released manually later.  This may cause a zero kref refcount.
>> Use of_get_child_by_name() instead to fix this.
>
> But of_find_node_by_name() searches *all* nodes, not just the children of the
> parameter.

That's correct. However, I guess the second mac-io will just be a direct child.

> So this is a logic change AFAICS, and I have no idea what machines we'd need to
> test on to check it.

Originally it comes from arch/ppc/platforms/pmac_pic.c, added in 2002 in
full-history-linux commit 5ea3254844ae344a
("Import arch/ppc and include/asm-ppc changes from linuxppc_2_5 tree").

I've also checked my linuxppc mail archives from 1997-2002, but couldn't find
the actual patch and a description.

So I don't know on which machines it's needed.

> So I think an of_node_get(master) would be safer and also fix the refcounting.

If no one can confirm the above, that may indeed be the best solution.

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
