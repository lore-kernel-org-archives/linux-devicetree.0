From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH 2/4] dt-bindings: display: amlogic,meson-dw-hdmi: Add optional HDMI 5V regulator
Date: Wed,  6 Dec 2017 12:54:26 +0100
Message-ID: <1512561268-29806-3-git-send-email-narmstrong@baylibre.com>
References: <1512561268-29806-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512561268-29806-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On reference boards and derivatives, the HDMI Logic is powered by an external
5V regulator.
This regulator was set by the Vendor U-Boot, add optional support for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
index 7f040ed..bf4a180 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.txt
@@ -48,6 +48,10 @@ Required properties:
   Documentation/devicetree/bindings/reset/reset.txt,
   the reset-names should be "hdmitx_apb", "hdmitx", "hdmitx_phy"
 
+Optional properties:
+- hdmi-supply: Optional phandle to an external 5V regulator to power the HDMI
+  logic, as described in the file ../regulator/regulator.txt
+
 Required nodes:
 
 The connections to the HDMI ports are modeled using the OF graph
-- 
2.7.4
