Return-Path: <SRS0=qoK5=SH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56471 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729641AbfDEGDt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Apr 2019 02:03:49 -0400
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 01/13] dt-bindings: connector: analog: add tv norms property
Date: Fri,  5 Apr 2019 08:03:05 +0200
Message-Id: <20190405060317.11240-2-m.felsch@pengutronix.de>
In-Reply-To: <20190405060317.11240-1-m.felsch@pengutronix.de>
References: <20190405060317.11240-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, javierm@redhat.co, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Rob Herring <robh@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Some connectors no matter if in- or output supports only a limited
range of tv norms. It doesn't matter if the hardware behind that
connector supports more than the listed formats since the users are
restriced by a label e.g. to plug only a camera into this connector
which uses the PAL format.

This patch adds the capability to describe such limitation within the
firmware. There are no format restrictions if the property isn't
present, so it's completely backward compatible.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/connector/analog-tv-connector.txt |  4 ++
 include/dt-bindings/media/tvnorms.h           | 42 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/media/tvnorms.h

diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
index 0c0970c210ab..346f8937a0b7 100644
--- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
+++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
@@ -6,6 +6,9 @@ Required properties:
 
 Optional properties:
 - label: a symbolic name for the connector
+- tvnorms: limit the supported tv norms on a connector to the given ones else
+           all tv norms are allowed. Possible video standards are defined in
+           include/dt-bindings/media/tvnorms.h.
 
 Required nodes:
 - Video port for TV input
@@ -16,6 +19,7 @@ Example
 tv: connector {
 	compatible = "composite-video-connector";
 	label = "tv";
+	tvnorms = <(TVNORM_PAL_M | TVNORM_NTSC_M)>;
 
 	port {
 		tv_connector_in: endpoint {
diff --git a/include/dt-bindings/media/tvnorms.h b/include/dt-bindings/media/tvnorms.h
new file mode 100644
index 000000000000..ec3b414a7a00
--- /dev/null
+++ b/include/dt-bindings/media/tvnorms.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only or X11 */
+/*
+ * Copyright 2019 Pengutronix, Marco Felsch <kernel@pengutronix.de>
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_TVNORMS_H
+#define _DT_BINDINGS_MEDIA_TVNORMS_H
+
+/* one bit for each */
+#define TVNORM_PAL_B          0x00000001
+#define TVNORM_PAL_B1         0x00000002
+#define TVNORM_PAL_G          0x00000004
+#define TVNORM_PAL_H          0x00000008
+#define TVNORM_PAL_I          0x00000010
+#define TVNORM_PAL_D          0x00000020
+#define TVNORM_PAL_D1         0x00000040
+#define TVNORM_PAL_K          0x00000080
+
+#define TVNORM_PAL_M          0x00000100
+#define TVNORM_PAL_N          0x00000200
+#define TVNORM_PAL_Nc         0x00000400
+#define TVNORM_PAL_60         0x00000800
+
+#define TVNORM_NTSC_M         0x00001000	/* BTSC */
+#define TVNORM_NTSC_M_JP      0x00002000	/* EIA-J */
+#define TVNORM_NTSC_443       0x00004000
+#define TVNORM_NTSC_M_KR      0x00008000	/* FM A2 */
+
+#define TVNORM_SECAM_B        0x00010000
+#define TVNORM_SECAM_D        0x00020000
+#define TVNORM_SECAM_G        0x00040000
+#define TVNORM_SECAM_H        0x00080000
+#define TVNORM_SECAM_K        0x00100000
+#define TVNORM_SECAM_K1       0x00200000
+#define TVNORM_SECAM_L        0x00400000
+#define TVNORM_SECAM_LC       0x00800000
+
+/* ATSC/HDTV */
+#define TVNORM_ATSC_8_VSB     0x01000000
+#define TVNORM_ATSC_16_VSB    0x02000000
+
+#endif /* _DT_BINDINGS_MEDIA_TVNORMS_H */
-- 
2.20.1
