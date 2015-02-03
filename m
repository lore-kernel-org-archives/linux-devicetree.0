From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [1/3] powerpc/pmac: Fix DT refcount imbalance in
 pmac_pic_probe_oldstyle
Date: Tue, 03 Feb 2015 12:12:32 +1100
Message-ID: <1422925952.4625.3.camel@ellerman.id.au>
References: <1421243519-6257-2-git-send-email-geert+renesas@glider.be>
	 <20150130040904.8F89D1402A7@ozlabs.org>
	 <CAMuHMdUwQ=K7SnFvpaHzL2dCyNXGR3w-_SzFOEWb3cYCiQJfHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUwQ=K7SnFvpaHzL2dCyNXGR3w-_SzFOEWb3cYCiQJfHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-01-30 at 10:00 +0100, Geert Uytterhoeven wrote:
> Hi Michael,
> 
> On Fri, Jan 30, 2015 at 5:09 AM, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:
> > On Wed, 2015-14-01 at 13:51:57 UTC, Geert Uytterhoeven wrote:
> >> of_find_node_by_name() calls of_node_put() on its "from" parameter,
> >> which must not be done on "master", as it's still in use, and will be
> >> released manually later.  This may cause a zero kref refcount.
> >> Use of_get_child_by_name() instead to fix this.
> >
> > But of_find_node_by_name() searches *all* nodes, not just the children of the
> > parameter.
> 
> That's correct. However, I guess the second mac-io will just be a direct child.

Yeah OK, I don't have a system or an example device tree to check.

> > So this is a logic change AFAICS, and I have no idea what machines we'd need to
> > test on to check it.
> 
> Originally it comes from arch/ppc/platforms/pmac_pic.c, added in 2002 in
> full-history-linux commit 5ea3254844ae344a
> ("Import arch/ppc and include/asm-ppc changes from linuxppc_2_5 tree").
> 
> I've also checked my linuxppc mail archives from 1997-2002, but couldn't find
> the actual patch and a description.
> 
> So I don't know on which machines it's needed.

Yep. Ben or Paul might know, but even then their memory may not be perfect :)
 
> > So I think an of_node_get(master) would be safer and also fix the refcounting.
> 
> If no one can confirm the above, that may indeed be the best solution.

I think so. Given how few of these machines are around it's easy to break them
with an inadvertent change like this, so I think it's better to be safe.

Wanna send a patch for that?

cheers



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
