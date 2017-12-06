From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RESEND PATCH 1/4] dt-bindings: display: amlogic,meson-vpu: Add optional power domain property
Date: Wed,  6 Dec 2017 12:54:25 +0100
Message-ID: <1512561268-29806-2-git-send-email-narmstrong@baylibre.com>
References: <1512561268-29806-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512561268-29806-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Video Processing Unit power domain was setup by the Vendor U-Boot,
add support for an optional Power Domain phandle to setup it from the kernel.

Acked-by: Rob Herring <robh@kernel.org> 
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
index 00f74ba..057b813 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
@@ -64,6 +64,10 @@ Required properties:
 - reg-names: should contain the names of the previous memory regions
 - interrupts: should contain the VENC Vsync interrupt number
 
+Optional properties:
+- power-domains: Optional phandle to associated power domain as described in
+	the file ../power/power_domain.txt
+
 Required nodes:
 
 The connections to the VPU output video ports are modeled using the OF graph
-- 
2.7.4
