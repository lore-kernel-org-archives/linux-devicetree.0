From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v2 1/5] dt-bindings: Add vendor prefix for Zidoo
Date: Thu, 23 Feb 2017 17:45:48 +0100
Message-ID: <20170223164553.3715-2-afaerber@suse.de>
References: <20170223164553.3715-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170223164553.3715-1-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Roc He <hepeng@zidoo.tv>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Zidoo is a Chinese manufacturer of TV boxes.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Roc He <hepeng@zidoo.tv>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 v1 -> v2:
 * Changed subject
 * Extended commit message
 
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index a76b981..2776651 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -343,6 +343,7 @@ xlnx	Xilinx
 xunlong	Shenzhen Xunlong Software CO.,Limited
 zarlink	Zarlink Semiconductor
 zeitec	ZEITEC Semiconductor Co., LTD.
+zidoo	Shenzhen Zidoo Technology Co., Ltd.
 zii	Zodiac Inflight Innovations
 zte	ZTE Corp.
 zyxel	ZyXEL Communications Corp.
-- 
2.10.2
