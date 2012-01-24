From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v5 07/18] fdt: Add tegra-usb bindings file from linux
Date: Tue, 24 Jan 2012 15:21:01 -0800
Message-ID: <1327447272-30182-8-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This file is taken from the Linux mailing list.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 doc/device-tree-bindings/usb/tegra-usb.txt |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/usb/tegra-usb.txt

diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
new file mode 100644
index 0000000..035d63d
--- /dev/null
+++ b/doc/device-tree-bindings/usb/tegra-usb.txt
@@ -0,0 +1,13 @@
+Tegra SOC USB controllers
+
+The device node for a USB controller that is part of a Tegra
+SOC is as described in the document "Open Firmware Recommended
+Practice : Universal Serial Bus" with the following modifications
+and additions :
+
+Required properties :
+ - compatible : Should be "nvidia,tegra20-ehci" for USB controllers
+   used in host mode.
+ - phy_type : Should be one of "ulpi" or "utmi".
+ - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
+   activated for the bus to be powered.
-- 
1.7.7.3
