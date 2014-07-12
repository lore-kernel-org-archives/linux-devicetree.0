From: James Cameron <quozl-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: unflatten_dt_node allocl is out by one?
Date: Sat, 12 Jul 2014 16:11:41 +1000
Message-ID: <20140712061141.GL20892@us.netrek.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

G'day,

OLPC XO-4 on 3.16-rc4 was not resolving aliases.

of_alias_get_id was returning -ENODEV, because of_alias_scan was not
finding an /aliases node.

unflatten_device_tree did process an /aliases node.

But the name of the aliases node was missing a terminating NUL,
because in unflatten_dt_node the node allocation length was off by
one, in turn because the length was set from a post-decrement:

        allocl = l++;

And is solved by pre-decrement:

        allocl = ++l;

The triggering change may have been from "of/fdt: Convert FDT
functions to use libfdt" e6a6928c3ea1d0195ed75a091e345696b916c09b.

It is also quite possible that I misunderstand something, and welcome
any correction.

-- 
James Cameron
http://quozl.linux.org.au/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
