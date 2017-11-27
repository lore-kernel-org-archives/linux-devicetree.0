From: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [RFC 0/2] of: Add whitelist
Date: Mon, 27 Nov 2017 14:58:02 -0600
Message-ID: <1511816284-12145-1-git-send-email-atull@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Here's a proposal for a whitelist to lock down the dynamic device tree.

For an overlay to be accepted, all of its targets are required to be
on a target node whitelist.

Currently the only way I have to get on the whitelist is calling a
function to add a node.  That works for fpga regions, but I think
other uses will need a way of having adding specific nodes from the
base device tree, such as by adding a property like 'allow-overlay;'
or 'allow-overlay = "okay";' If that is acceptable, I could use some
advice on where that particular code should go.

Alan

Alan Tull (2):
  of: overlay: add whitelist
  fpga: of region: add of-fpga-region to whitelist

 drivers/fpga/of-fpga-region.c |  9 ++++++
 drivers/of/overlay.c          | 73 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h            | 12 +++++++
 3 files changed, 94 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
