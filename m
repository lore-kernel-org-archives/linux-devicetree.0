From: Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: Turn of_match_node into a static inline when
 CONFIG_OF isn't set
Date: Wed, 12 Feb 2014 19:01:56 -0600
Message-ID: <20140213010156.GL841@joshc.qualcomm.com>
References: <1392122211-11422-1-git-send-email-laurent.pinchart@ideasonboard.com>
 <20140211180845.GG841@joshc.qualcomm.com>
 <CAMuHMdVkPLe5986hYPApoQr7oJSb6U2P71=nP+9mtvtaskdHXg@mail.gmail.com>
 <3619654.tQqiI1EfTB@wuerfel>
 <CAMuHMdVOkUMxEkUK70Y=Y126XmqgKMpyqmGRG5us7vZPhP8WNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVOkUMxEkUK70Y=Y126XmqgKMpyqmGRG5us7vZPhP8WNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 10:54:37PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 11, 2014 at 9:06 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 11 February 2014 19:29:19 Geert Uytterhoeven wrote:
[..]
> > You can't reorder the fields because they are shared with user
> > space in form of the module-init-tools.
> 
> Sure, that's part of the ABI.
> 
> But that doesn't mean we can't change the ID as stored in the platform_device.
> Many drivers don't want to know the ID, only the driver_data part.
> Having that in a uniform way across the different ID types would help.

I think I convinced myself that the existing platform_device::id_entry
manipulation has the same issue as the device::of_match_ptr had before
it was reverted[1], it's just gone unnoticed.

The codepath in question is the platform_driver_register()/driver_attach(), and
as far as I can tell there is nothing in place to prevent the following
scenario:

  Thread 1                                      Thread 2
  platform_driver_register(pdrv1)
    driver_attach(drv1)
     driver_match_device(drv1, dev)
      platform_match(drv1, dev)
       platform_match_id(drv1->id_table, pdev)
        pdev->id_entry = id1;
                                                platform_driver_register(pdrv2)
                                                 driver_attach(drv2)
                                                  driver_match_device(drv2, dev)
                                                   platform_match(drv2, dev)
                                                    platform_match_id(drv2->id_table, pdev)
                                                     pdev->id_entry = id2;
     device_lock(dev)
     driver_probe_device(drv1, dev)
     device_unlock(dev)

So, in this scenario, it's possible that even though 'drv1' is bound to 'dev',
it's id_entry is pointing to somewhere pdrv2's id_table :(.

Fortunately, the chances we'd hit this are slim, as it would require at least
two drivers which match the same device, and at least one of those drivers
would have to make use of id_entry.  However, relying on this still seems
broken.

I suspect it's not generally advisable for a bus to be touching device state
during ->match().

[1]: Thanks to Rob for pointing me at b1608d69cb80 ("drivercore: revert
     addition of of_match to struct device")
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
