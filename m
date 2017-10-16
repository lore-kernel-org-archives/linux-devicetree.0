From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for MeLE
Date: Mon, 16 Oct 2017 05:01:51 +0200
Message-ID: <20171016030153.11078-2-afaerber@suse.de>
References: <20171016030153.11078-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016030153.11078-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Bizon <bizongod@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, meleservice@mele.cn, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

MeLE is a Chinese manufacturer of TV boxes and Mini PCs.

Cc: meleservice@mele.cn
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index dbbde903682b..bc7f7b4618b4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -199,6 +199,7 @@ mcube	mCube
 meas	Measurement Specialties
 mediatek	MediaTek Inc.
 megachips	MegaChips
+mele	Shenzhen MeLE Digital Technology Ltd.
 melexis	Melexis N.V.
 melfas	MELFAS Inc.
 mellanox	Mellanox Technologies
-- 
2.13.6
