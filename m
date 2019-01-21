From: Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Catalyst Semiconductor
Date: Mon, 21 Jan 2019 09:57:04 +0000
Message-ID: <20190121095705.27452-1-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Christian Hemp <c.hemp@phytec.de>, =?UTF-8?q?Stefan=20Riedm=C3=BCller?= <s.riedmueller@phytec.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Martyn Welch <martyn.welch@collabora.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Add vendor prefix "catalyst" for Catalyst Semiconductor which is
already in use but undocumented.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes in v3:
- Add full stop to denote abbreviation.

Changes in v2: None

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..a81de3134724 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -65,6 +65,7 @@ bticino Bticino International
 calxeda	Calxeda
 capella	Capella Microsystems, Inc
 cascoda	Cascoda, Ltd.
+catalyst	Catalyst Semiconductor, Inc.
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
 cdtech	CDTech(H.K.) Electronics Limited
-- 
2.20.1
