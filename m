From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 0/2] Add display timing for Okaya RS800480T-7X0
Date: Tue,  9 Jun 2015 17:59:57 +0200
Message-ID: <1433865599-8167-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1432827466-8104-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432827466-8104-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch is the follow-up of a request from Philipp to add the Okaya display
to the simple panel driver.
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-May/346657.html

v2:
- split into 2 patches, adding Okaya to the vendor prefixes should be its own
patch as suggested by Thierry
https://patchwork.kernel.org/patch/6503261/

Regards,
Gary

Gary Bisson (2):
  of: add Okaya Electric America vendor prefix
  drm/panel: Add display timing for Okaya RS800480T-7X0GP

 .../bindings/panel/okaya,rs800480t_7x0gp.txt       |  7 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/okaya,rs800480t_7x0gp.txt

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
