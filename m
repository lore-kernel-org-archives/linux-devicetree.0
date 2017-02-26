From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] ARM: dts: add arm/arm64 include symlinks
Date: Sun, 26 Feb 2017 07:00:57 +0100
Message-ID: <20170226060058.5841-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, arnd@arndb.de, briannorris@chromium.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

Allow including of dtsi files in an architecture-independent manner.
Some dtsi files may be shared between architectures and one suggestion
was to have symlinks and let these includes get accessed via a
    #include <arm64/foo.dtsi>
So add the necessary symlinks for arm32.

Suggested-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
Suggested by Olof in response to the patch adding direct symlinks
for cros-ec includes.

 arch/arm/boot/dts/include/arm   | 1 +
 arch/arm/boot/dts/include/arm64 | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 arch/arm/boot/dts/include/arm
 create mode 120000 arch/arm/boot/dts/include/arm64

diff --git a/arch/arm/boot/dts/include/arm b/arch/arm/boot/dts/include/arm
new file mode 120000
index 000000000000..a96aa0ea9d8c
--- /dev/null
+++ b/arch/arm/boot/dts/include/arm
@@ -0,0 +1 @@
+..
\ No newline at end of file
diff --git a/arch/arm/boot/dts/include/arm64 b/arch/arm/boot/dts/include/arm64
new file mode 120000
index 000000000000..074a835fca3e
--- /dev/null
+++ b/arch/arm/boot/dts/include/arm64
@@ -0,0 +1 @@
+../../../../arm64/boot/dts
\ No newline at end of file
-- 
2.11.0
