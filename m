From: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Subject: [PATCH 1/2] devicetree: Add vendor prefix for Shenzhen Sunchip
 Technology Co., Ltd
Date: Sat, 13 Aug 2016 01:53:12 +0200
Message-ID: <20160812235312.GB10557@vip.cybercity.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Shenzhen Sunchip Technology Co., Ltd produces TV boxes and TV dongles,
some of which are sold under other brands. Website:
<URL:http://www.sunchip-tech.com/>

Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 1992aa9..fbad2cea 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -256,6 +256,7 @@ ste	ST-Ericsson
 stericsson	ST-Ericsson
 syna	Synaptics Inc.
 synology	Synology, Inc.
+sunchip	Shenzhen Sunchip Technology Co., Ltd
 SUNW	Sun Microsystems, Inc
 tbs	TBS Technologies
 tcg	Trusted Computing Group
-- 
2.8.1



-- 
Rask Ingemann Lambertsen
