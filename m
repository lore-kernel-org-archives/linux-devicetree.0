From: <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: Add entry for Beckhoff CX9020
Date: Fri, 21 Jul 2017 06:06:39 +0200
Message-ID: <20170721040640.31424-2-linux-kernel-dev@beckhoff.com>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
 <20170721040640.31424-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170721040640.31424-1-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rask Ingemann Lambertsen <ccc94453-1EA3ORoCGBhoJ7GROcy7lA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

- add vendor prefix bhf for Beckhoff
- add new board binding bhf,cx9020

Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bhf.txt         | 6 ++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 MAINTAINERS                                           | 5 +++++
 3 files changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bhf.txt

diff --git a/Documentation/devicetree/bindings/arm/bhf.txt b/Documentation/devicetree/bindings/arm/bhf.txt
new file mode 100644
index 000000000000..886b503caf9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bhf.txt
@@ -0,0 +1,6 @@
+Beckhoff Automation Platforms Device Tree Bindings
+--------------------------------------------------
+
+CX9020 Embedded PC
+Required root node properties:
+    - compatible = "bhf,cx9020", "fsl,imx53";
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index daf465bef758..20c2cf57ebc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -47,6 +47,7 @@ avic	Shanghai AVIC Optoelectronics Co., Ltd.
 axentia	Axentia Technologies AB
 axis	Axis Communications AB
 bananapi BIPAI KEJI LIMITED
+bhf	Beckhoff Automation GmbH & Co. KG
 boe	BOE Technology Group Co., Ltd.
 bosch	Bosch Sensortec GmbH
 boundary	Boundary Devices Inc.
diff --git a/MAINTAINERS b/MAINTAINERS
index 205d3977ac46..1bf282843dc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1172,6 +1172,11 @@ M:	Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
 S:	Maintained
 F:	drivers/clk/at91
 
+ARM/BECKHOFF SUPPORT
+M:	Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/bhf.txt
+
 ARM/CALXEDA HIGHBANK ARCHITECTURE
 M:	Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
 L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
