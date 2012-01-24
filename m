From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 08/18] tegra: fdt: Add additional USB binding
Date: Tue, 24 Jan 2012 15:21:02 -0800
Message-ID: <1327447272-30182-9-git-send-email-sjg@chromium.org>
References: <1327447272-30182-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327447272-30182-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a property to indicate a port which can switch between host and device
mode.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Add dr_mode property to control host/device/otg mode
- Add nvidia,has-legacy-mode property per review comments

 doc/device-tree-bindings/usb/tegra-usb.txt |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
index 035d63d..b7174a3 100644
--- a/doc/device-tree-bindings/usb/tegra-usb.txt
+++ b/doc/device-tree-bindings/usb/tegra-usb.txt
@@ -11,3 +11,15 @@ Required properties :
  - phy_type : Should be one of "ulpi" or "utmi".
  - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
    activated for the bus to be powered.
+
+Optional properties:
+  - dr_mode : dual role mode. Indicates the working mode for
+   nvidia,tegra20-ehci compatible controllers.  Can be "host", "peripheral",
+   or "otg".  Default to "host" if not defined for backward compatibility.
+      host means this is a host controller
+      peripheral means it is device controller
+      otg means it can operate as either ("on the go")
+  - nvidia,has-legacy-mode : boolean indicates whether this controller can
+    operate in legacy mode (as APX 2500 / 2600). In legacy mode some
+    registers are accessed through the APB_MISC base address instead of
+    the USB controller.
-- 
1.7.7.3
