From: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Subject: [PATCH v4 2/3] devicetree: Add vendor prefix for Shenzhen Sunchip
 Technology Co., Ltd
Date: Wed, 17 Aug 2016 23:32:22 +0200
Message-ID: <a4e01da87f9439f2a1e97f6281ab6d9b545191df.1471637309.git.ccc94453@vip.cybercity.dk>
References: <9f39145aa6a46a1e130c4b91bd120eabeb7c8929.1471637309.git.ccc94453@vip.cybercity.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f39145aa6a46a1e130c4b91bd120eabeb7c8929.1471637309.git.ccc94453@vip.cybercity.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Shenzhen Sunchip Technology Co., Ltd produces TV boxes and TV dongles,
some of which are sold under other brands. Website:
<URL:http://www.sunchip-tech.com/>

Signed-off-by: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
---

Changes in v4:
None.

Changes in v3:
None.

Changes in v2:
No patch changes, but added CC to the ARM kernel mailing list.

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 69b0576..f7fc187 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -254,6 +254,7 @@ starry	Starry Electronic Technology (ShenZhen) Co., LTD
 startek	Startek
 ste	ST-Ericsson
 stericsson	ST-Ericsson
+sunchip	Shenzhen Sunchip Technology Co., Ltd
 SUNW	Sun Microsystems, Inc
 syna	Synaptics Inc.
 synology	Synology, Inc.
-- 
2.8.1
