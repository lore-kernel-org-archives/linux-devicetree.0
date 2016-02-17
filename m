From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/1] of overlay callbacks
Date: Wed, 17 Feb 2016 11:41:24 -0600
Message-ID: <1455730885-1514-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Resend as patch/cover letter got separated yesterday]

Adding functionality for registering callbacks with the
of overlay code.  

This will be useful for drivers responding to overlays
and will allow their implementations to not use reconfig
notifiers.  Also the reconfig notifiers are too late as
they go out after the overlay has been added to the live
tree.

My use of the overlay callback is to control FPGA
programming from a DT overlay.  The overlay would contain
the FPGA image file name and the child device information.
My FPGA code gets the pre-apply callback and attempts to
program the FPGA.  If the programming failed, the callback
can return an error and prevent the overlay from being
applied.  If FPGA programming succeeds, the overlay will
continue and be added to the live tree.  The child devices
in the overlay will get populated and probed.

I've tested this with code that uses pre-apply and post-remove
handlers.  Tested on next-20160216 and Pantelis' current
bbb-overlays branch.


Alan Tull (1):
  of/overlay: of overlay callbacks

 drivers/of/overlay.c |   90 +++++++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/of.h   |   31 +++++++++++++++++
 2 files changed, 120 insertions(+), 1 deletion(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
