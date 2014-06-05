From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC 0/3] of: Refactor device tree linked lists
Date: Thu,  5 Jun 2014 16:43:38 +0100
Message-ID: <1401983021-13829-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

I threw these patches together as part of getting the device_node
lifecycle issues sorted out so that the overlay patches can be merged.
It makes it possible to add and remove nodes without jumping through
crazy hoops.

I haven't yet decided if it is a good idea. It does increase the size of
deviec_node by 2 pointers which increases the footprint, but it
simplifies a lot of the code.  Although, if I was really concerned about
footprint I would be trying to get rid of the ->full_name string and
just use the path component instead. The primary user of full_name is
various printk format strings around the kernel and we could get the
same behaviour using a %p variant.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
