From: Valentin Rothberg <valentinrothberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: h8300: device tree: undefined CONFIG_EDOSK2674
Date: Wed, 13 May 2015 10:33:13 +0200
Message-ID: <CAD3Xx4+4E_ueLzP9Jn+ZcxkbBbAEby=gyH-bUVKo_5WKpB-K-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org
Cc: dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, uclinux-h8-devel-5NWGOfrQmneRv+LV9MX5uooqe+aC9MnS@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Andreas Ruprecht <andreas.ruprecht-d40JDW7QUjc@public.gmane.org>, hengelein Stefan <stefan.hengelein-d40JDW7QUjc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yoshinori,

your commit 5befaa907481 ("h8300: devicetree source") is in today's
linux-next tree (i.e., next-20150513) and adds the following line:

+dtb-$(CONFIG_EDOSK2674) := edosk2674.dtb

EDOSK2674 is not defined in Kconfig so that the device tree source
won't be touched.  Some grepping indicates that it's just a typo and
'H8S_EDOSK2674' may be the correct option.  Is that right?

I detected this issue with scripts/checkkconfigsymbols.py by diffing
yesterday's and today's linux-next tree.

Kind regards,
 Valentin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
