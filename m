From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH v5 1/3] dt-bindings: Add vendor prefix for ROCKTECH DISPLAYS LIMITED
Date: Mon,  1 Apr 2019 12:35:33 +0200
Message-ID: <b8db03faa344c834e6cc81eef1eca154e1a1bd90.1554114302.git.agx@sigxcpu.org>
References: <cover.1554114302.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1554114302.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
List-Id: devicetree@vger.kernel.org

Add ROCKTECH DISPLAYS LIMITED (https://rocktech.com.hk) LCD panel
supplier.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index fae55f50b2d3..326a4b278186 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -346,6 +346,7 @@ ricoh	Ricoh Co. Ltd.
 rikomagic	Rikomagic Tech Corp. Ltd
 riscv	RISC-V Foundation
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
+rocktech	ROCKTECH DISPLAYS LIMITED
 rohm	ROHM Semiconductor Co., Ltd
 ronbo   Ronbo Electronics
 roofull	Shenzhen Roofull Technology Co, Ltd
-- 
2.20.1
