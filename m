From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 1/4] dt-bindings: power: reset: add document for
 reboot-mode driver
Date: Tue,  1 Mar 2016 20:11:22 +0800
Message-ID: <1456834282-5474-1-git-send-email-andy.yan@rock-chips.com>
References: <1456834172-5425-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456834172-5425-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

add device tree bindings document for reboot-mode driver

Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v4:
- remove mode-maskrom
- rename mode-fastboot to mode-bootloader to keep compatible with the exiting Android device

Changes in v3:
- descirbe all reboot mode as properity instead of subnode

Changes in v2: None
Changes in v1: None

 .../bindings/power/reset/reboot-mode.txt           | 24 +++++++++++++++
 .../bindings/power/reset/syscon-reboot-mode.txt    | 35 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/reset/reboot-mode.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.txt

diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.txt b/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
new file mode 100644
index 0000000..f131a11
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.txt
@@ -0,0 +1,24 @@
+Generic reboot mode core map driver
+
+This driver get reboot mode arguments and call the write
+interface to stores the magic value in special register
+or ram . Then the bootloader can read it and take different
+action according the argument stored.
+
+All mode properties are vendor specific, it is a indication to tell
+the bootloder what to do when the system reboot, and should be named
+as mode-xxx = <magic> (xxx is mode name).
+
+- mode-normal: Normal reboot mode, system reboot with command "reboot".
+- mode-recovery: Android Recovery mode, it is a mode to format the device or update a new image.
+- mode-bootloader: Android fastboot mode, it's a mode to re-flash partitions on the Android based device.
+- mode-loader: A bootloader mode, it's a mode used to download image on Rockchip platform,
+	       usually used in development.
+
+Example:
+	reboot-mode {
+		mode-normal = <BOOT_NORMAL>;
+		mode-recovery = <BOOT_RECOVERY>;
+		mode-bootloader = <BOOT_FASTBOOT>;
+		mode-loader = <BOOT_LOADER>;
+	}
diff --git a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.txt b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.txt
new file mode 100644
index 0000000..1908e54
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode.txt
@@ -0,0 +1,35 @@
+SYSCON reboot mode driver
+
+This driver get reboot mode magic value form reboot-mode driver
+and stores it in a SYSCON mapped register. Then the bootloader
+can read it and take different action according to the magic
+value stored.
+
+This DT node should be represented as a sub-node of a "syscon", "simple-mfd"
+node.
+
+Required properties:
+- compatible: should be "syscon-reboot-mode"
+- offset: offset in the register map for the storage register (in bytes)
+
+Optional properity:
+- mask: the mask bits of the mode magic value, default set to 0xffffffff if missing.
+
+The rest of the properties should follow the generic reboot-mode discription
+found in reboot-mode.txt
+
+Example:
+	pmu: pmu@20004000 {
+		compatible = "rockchip,rk3066-pmu", "syscon", "simple-mfd";
+		reg = <0x20004000 0x100>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x40>;
+			mode-normal = <BOOT_NORMAL>;
+			mode-recovery = <BOOT_RECOVERY>;
+			mode-fastboot = <BOOT_FASTBOOT>;
+			mode-loader = <BOOT_LOADER>;
+
+		};
+	};
-- 
1.9.1
