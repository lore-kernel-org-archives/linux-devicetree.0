From: <Dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/8544ds: add partition table for norflash
Date: Wed, 29 Aug 2012 10:47:46 +0800
Message-ID: <1346208466-4569-1-git-send-email-Dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

create partition table for norflash.

Signed-off-by: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/mpc8544ds.dts  |    4 ++-
 arch/powerpc/boot/dts/mpc8544ds.dtsi |   38 ++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8544ds.dts b/arch/powerpc/boot/dts/mpc8544ds.dts
index e934987..ed38874 100644
--- a/arch/powerpc/boot/dts/mpc8544ds.dts
+++ b/arch/powerpc/boot/dts/mpc8544ds.dts
@@ -20,8 +20,10 @@
 		reg = <0 0 0 0>;	// Filled by U-Boot
 	};
 
-	lbc: localbus@e0005000 {
+	board_lbc: lbc: localbus@e0005000 {
 		reg = <0 0xe0005000 0 0x1000>;
+
+		ranges = <0x0 0x0 0x0 0xff800000 0x800000>;
 	};
 
 	board_soc: soc: soc8544@e0000000 {
diff --git a/arch/powerpc/boot/dts/mpc8544ds.dtsi b/arch/powerpc/boot/dts/mpc8544ds.dtsi
index 77ebc9f..8be5b31 100644
--- a/arch/powerpc/boot/dts/mpc8544ds.dtsi
+++ b/arch/powerpc/boot/dts/mpc8544ds.dtsi
@@ -32,6 +32,44 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
+&board_lbc {
+	nor@0,0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-flash";
+		reg = <0x0 0x0 0x800000>;
+		bank-width = <2>;
+		device-width = <1>;
+
+		partition@0 {
+			reg = <0x0 0x10000>;
+			label = "dtb-nor";
+		};
+
+		partition@20000 {
+			reg = <0x20000 0x30000>;
+			label = "diagnostic-nor";
+			read-only;
+		};
+
+		partition@200000 {
+			reg = <0x200000 0x200000>;
+			label = "dink-nor";
+			read-only;
+		};
+
+		partition@400000 {
+			reg = <0x400000 0x380000>;
+			label = "kernel-nor";
+		};
+
+		partition@780000 {
+			reg = <0x780000 0x80000>;
+			label = "u-boot-nor";
+		};
+	};
+};
+
 &board_soc {
 	enet0: ethernet@24000 {
 		phy-handle = <&phy0>;
-- 
1.7.5.1
