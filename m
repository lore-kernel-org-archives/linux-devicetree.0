From: Martyn Welch <martyn.welch@collabora.com>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix for Catalyst Semiconductor
Date: Tue, 11 Dec 2018 19:42:50 +0000
Message-ID: <20181211194251.12988-1-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Martyn Welch <martyn.welch@collabora.com>, Thierry Reding <treding@nvidia.com>, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>, Lukasz Majewski <lukma@denx.de>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Add vendor prefix "catalyst" for Catalyst Semiconductor which is
already in use but undocumented.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8fcc16..bbc41483e81b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -65,6 +65,7 @@ bticino Bticino International
 calxeda	Calxeda
 capella	Capella Microsystems, Inc
 cascoda	Cascoda, Ltd.
+catalyst	Catalyst Semiconductor, Inc
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
 ceva	Ceva, Inc.
-- 
2.19.2
