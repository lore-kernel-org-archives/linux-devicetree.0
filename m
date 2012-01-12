From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Wed, 11 Jan 2012 20:32:59 -0800
Message-ID: <1326342789-5781-11-git-send-email-sjg@chromium.org>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326342789-5781-1-git-send-email-sjg@chromium.org>
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

This adds a property to indicate a port which can switch between host and device
mode.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 doc/device-tree-bindings/usb/tegra-usb.txt |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
index 035d63d..96fd022 100644
--- a/doc/device-tree-bindings/usb/tegra-usb.txt
+++ b/doc/device-tree-bindings/usb/tegra-usb.txt
@@ -11,3 +11,7 @@ Required properties :
  - phy_type : Should be one of "ulpi" or "utmi".
  - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
    activated for the bus to be powered.
+
+Optional properties:
+ - support-host-mode : If present then this peripheral can switch between
+   host and device mode
-- 
1.7.7.3
