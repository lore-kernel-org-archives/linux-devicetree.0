From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] dt-bindings: Add vendor prefix for elgin
Date: Thu,  3 Jan 2019 23:40:22 -0200
Message-ID: <20190104014023.17973-3-otavio@ossystems.com.br>
References: <20190104014023.17973-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190104014023.17973-1-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Jason Zhu <jason.zhu@rock-chips.com>, Vicent Chi <vicent.chi@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Philipp Tomsic <philipp.tomsich@theobroma-systems.com>, Otavio Salvador <otavio@ossystems.com.br>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add elgin vendor definition as 'Elgin S/A.'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 3bbe3b87a1ff..b2c3d7ca1722 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -113,6 +113,7 @@ eckelmann	Eckelmann AG
 edt	Emerging Display Technologies
 eeti	eGalax_eMPIA Technology Inc
 elan	Elan Microelectronic Corp.
+elgin	Elgin S/A.
 embest	Shenzhen Embest Technology Co., Ltd.
 emlid	Emlid, Ltd.
 emmicro	EM Microelectronic
-- 
2.20.1
