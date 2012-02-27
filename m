From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 08/20] fdt: Add tegra-usb bindings file from
	linux
Date: Mon, 27 Feb 2012 12:52:41 -0800
Message-ID: <1330375973-10681-9-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

This file is taken from the Linux mailing list.

Signed-off-by: Simon Glass <sjg@chromium.org>
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
