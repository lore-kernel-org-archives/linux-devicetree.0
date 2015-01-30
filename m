From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [1/3] powerpc/pmac: Fix DT refcount imbalance in pmac_pic_probe_oldstyle
Date: Fri, 30 Jan 2015 15:09:04 +1100 (AEDT)
Message-ID: <20150130040904.8F89D1402A7@ozlabs.org>
References: <1421243519-6257-2-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421243519-6257-2-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-14-01 at 13:51:57 UTC, Geert Uytterhoeven wrote:
> of_find_node_by_name() calls of_node_put() on its "from" parameter,
> which must not be done on "master", as it's still in use, and will be
> released manually later.  This may cause a zero kref refcount.
> Use of_get_child_by_name() instead to fix this.

But of_find_node_by_name() searches *all* nodes, not just the children of the
parameter.

So this is a logic change AFAICS, and I have no idea what machines we'd need to
test on to check it.

So I think an of_node_get(master) would be safer and also fix the refcounting.

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
