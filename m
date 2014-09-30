From: Ankit Jindal <ankit.jindal@linaro.org>
Subject: [PATCH v2 6/6] MAINTAINERS: Add entry for APM X-Gene QMTM UIO driver
Date: Tue, 30 Sep 2014 09:56:09 +0530
Message-ID: <1412051169-9142-7-git-send-email-ankit.jindal@linaro.org>
References: <1412051169-9142-1-git-send-email-ankit.jindal@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412051169-9142-1-git-send-email-ankit.jindal@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@apm.com, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Tushar Jagad <tushar.jagad@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Ankit Jindal <ankit.jindal@linaro.org>
List-Id: devicetree@vger.kernel.org

Add entry to maintainer list for APM X-Gene QMTM UIO driver.

Signed-off-by: Ankit Jindal <ankit.jindal@linaro.org>
Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
---
 MAINTAINERS |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e7866a..138663f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -727,6 +727,13 @@ S:	Supported
 F:	drivers/net/ethernet/apm/xgene/
 F:	Documentation/devicetree/bindings/net/apm-xgene-enet.txt
 
+APPLIED MICRO (APM) X-GENE QMTM UIO DRIVER
+M:	Ankit Jindal <ankit.jindal@linaro.org>
+M:	Tushar Jagad <tushar.jagad@linaro.org>
+S:	Supported
+F:	drivers/uio/uio_xgene_qmtm.c
+F:	Documentation/devicetree/bindings/uio/uio_xgene_qmtm.txt
+
 APTINA CAMERA SENSOR PLL
 M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
-- 
1.7.9.5
