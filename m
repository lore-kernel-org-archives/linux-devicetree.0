From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH] of overlay callbacks
Date: Tue, 16 Feb 2016 12:37:40 -0600
Message-ID: <1455647861-31973-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adding functionality for registering callbacks with the
of overlay code.  

When DT overlays are being added, some drivers/subsystems
will want to know about the changes before they go into the
live tree.  Similarly there is a need for post-remove
callbacks.
    
Each handler is registered with a of_device_id.  When
an overlay target matches a handler's id, the handler
gets called.
    
The following 4 cases are handled: pre-apply, post-apply,
pre-remove, and post-remove.

This is useful for me as I can apply an FPGA overlay that
contains the file name that I want to program the FPGA with
and the child device information.  My FPGA code gets the
pre-apply callback and attempts to program the FPGA.  If
the programming failed, the callback can return an error
and prevent the overlay from being applied.

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
