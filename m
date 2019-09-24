From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 2/3] bindings: rename links to mason USB2/USB3 DT files
Date: Tue, 24 Sep 2019 10:01:29 -0300
Message-ID: <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Those files got renamed, but another DT file still points to the older
places.

Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
index b9f04e617eb7..6ffb09be7a76 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -85,8 +85,8 @@ A child node must exist to represent the core DWC2 IP block. The name of
 the node is not important. The content of the node is defined in dwc2.txt.
 
 PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
+- Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
+- Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
 
 Example device nodes:
 	usb: usb@ffe09000 {
-- 
2.21.0
