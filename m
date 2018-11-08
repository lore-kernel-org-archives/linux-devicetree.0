From: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Smartlabs
Date: Thu,  8 Nov 2018 19:33:20 +0400
Message-ID: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: christianshewitt@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Smartlabs are a professional integrator of Interactive TV solutions
and IPTV/VOD devices.

[1] (https://www.smartlabs.tv/en/about/)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 4b1a2a8..4e087f9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -357,6 +357,7 @@ sirf	SiRF Technology, Inc.
 sis	Silicon Integrated Systems Corp.
 sitronix	Sitronix Technology Corporation
 skyworks	Skyworks Solutions, Inc.
+smartlabs	Smartlabs
 smsc	Standard Microsystems Corporation
 snps	Synopsys, Inc.
 socionext	Socionext Inc.
-- 
2.7.4
