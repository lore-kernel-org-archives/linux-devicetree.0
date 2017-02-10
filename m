From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/6] arm64: dts: Add symlinks for cros-ec-keyboard and
 cros-ec-sbs
Date: Thu,  9 Feb 2017 17:05:16 -0800
Message-ID: <20170210010521.78872-2-briannorris@chromium.org>
References: <20170210010521.78872-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170210010521.78872-1-briannorris@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Chris Zhong <zyw@rock-chips.com>, Stephen Barber <smbarber@chromium.org>, linux-arm-kernel@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

We'd like to be able to use the cros-ec-keyboard.dtsi and
cros-ec-sbs.dtsi snippets for arm64 devices.  Currently those files live
in the arm/boot/dts directory.

Let's follow the convention set by commit 8ee57b8182c4 ("ARM64: dts:
vexpress: Use a symlink to vexpress-v2m-rs1.dtsi from arch=arm") and use
a symlink.  Note that in this case we put the files in a new
"include/common" directory since these snippets may need to be
referenced by dts files in many different subdirectories.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Heiko Stueber <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi | 1 +
 arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi      | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
 create mode 120000 arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi

diff --git a/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi b/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
new file mode 120000
index 000000000000..1c1889f0a791
--- /dev/null
+++ b/arch/arm64/boot/dts/include/common/cros-ec-keyboard.dtsi
@@ -0,0 +1 @@
+../../../../../arm/boot/dts/cros-ec-keyboard.dtsi
\ No newline at end of file
diff --git a/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi b/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi
new file mode 120000
index 000000000000..3d7ae9c88bcd
--- /dev/null
+++ b/arch/arm64/boot/dts/include/common/cros-ec-sbs.dtsi
@@ -0,0 +1 @@
+../../../../../arm/boot/dts/cros-ec-sbs.dtsi
\ No newline at end of file
-- 
2.11.0.483.g087da7b7c-goog
