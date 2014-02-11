From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when
 CONFIG_OF isn't set
Date: Tue, 11 Feb 2014 19:29:19 +0100
Message-ID: <CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
	<1596542.hkJp71u3OJ@avalon>
	<20140211164825.GC841@joshc.qualcomm.com>
	<6446980.WMjvBYStRY@avalon>
	<20140211180845.GG841@joshc.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140211180845.GG841-OP5zVEFNDbfdOxZ39nK119BPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 7:08 PM, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> It sure would be convenient if platform_device had a 'const struct
> of_device_id *of_id_entry' member similar to the existing struct
> platform_device_id one, that was set up during platform device matching.
> Most platform_driver users of of_match_node() would simply go away.

Can't the entry be shared for both platform_device_id and of_device_id?
Only one of them can be valid at the same time, right?

Ideally, all xxx_device_id look like

    struct xxx_device_id {
            ... /* bus-specific ID information */
            kernel_ulong_t driver_data;
    };

This may be formalized in some way, using a base class, but thay may
require reordering the fields, like:

    struct base_device_id {
            kernel_ulong_t driver_data;
            long id[0];
    };

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
