From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 2/4] MAINTAINERS: Add entry for megachips-stdpxxxx-ge-b850v3-fw
Date: Sat, 28 Jan 2017 15:21:31 +0100
Message-ID: <b61e3ca48ac8c305bd401055caf363a005226f14.1485611969.git.peter.senna@collabora.com>
References: <cover.1485611969.git.peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1485611969.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <cover.1485611969.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
References: <cover.1485611969.git.peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add MAINTAINERS entry for the second video output of the GE B850v3:
       STDP4028-ge-b850v3-fw bridges (LVDS-DP)
       STDP2690-ge-b850v3-fw bridges (DP-DP++)

Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
CC: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
CC: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
CC: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1b346b..b9e9bd3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8061,6 +8061,14 @@ L:	linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
 S:	Maintained
 F:	drivers/net/wireless/mediatek/mt7601u/
 
+MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
+M:	Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
+M:	Martin Donnelly <martin.donnelly-JJi787mZWgc@public.gmane.org>
+M:	Martyn Welch <martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
+S:	Maintained
+F:	drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+F:	Documentation/devicetree/bindings/video/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+
 MEGARAID SCSI/SAS DRIVERS
 M:	Kashyap Desai <kashyap.desai-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
 M:	Sumit Saxena <sumit.saxena-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
