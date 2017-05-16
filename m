From: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Subject: [PATCH RFC v2 0/2] Proposed device tree bindings for FSI bus
Date: Tue, 16 May 2017 12:51:23 +0800
Message-ID: <1494910285-20856-1-git-send-email-jk@ozlabs.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a binding specification and implementation for matching
device tree nodes to probed FSI busses.

Version 2 includes feedback from Brad Bishop, Eddie James and Rob
Herring, and introduces the implementation of the matching in the FSI
core.

Note that the FSI core (on which patch 2/2 is based) is still pending
upstream acceptance through lkml, so I'm mostly looking for a first-pass
review of DT changes at this stage. Once that's done (and the FSI core is
merged), I'll submit upstream via lkml.

Cheers,


Jeremy

---
Jeremy Kerr (2):
  Documentation/devicetree: Add specification for FSI busses
  fsi: Match fsi slaves & engines to available device tree nodes

 Documentation/devicetree/bindings/fsi/fsi.txt | 144 ++++++++++++++++++++++++++
 drivers/fsi/fsi-core.c                        |  99 ++++++++++++++++++
 drivers/fsi/fsi-master-gpio.c                 |   4 +
 drivers/fsi/fsi-master-hub.c                  |   4 +
 4 files changed, 251 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi.txt

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
