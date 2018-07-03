From: richard.gong@linux.intel.com
Subject: [PATCHv6 5/8] arm64: dts: stratix10: add fpga manager and region
Date: Tue,  3 Jul 2018 09:46:52 -0500
Message-ID: <1530629215-26990-6-git-send-email-richard.gong@linux.intel.com>
References: <1530629215-26990-1-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530629215-26990-1-git-send-email-richard.gong@linux.intel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: catalin.marinas@arm.com, will.deacon@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, atull@kernel.org, mdf@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, corbet@lwn.net
Cc: devicetree@vger.kernel.org, yves.vandervennet@linux.intel.com, richard.gong@intel.com, linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, richard.gong@linux.intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull@kernel.org>

Add the Stratix10 FPGA manager and a FPGA region to the
device tree.

Signed-off-by: Alan Tull <atull@kernel.org>
Signed-off-by: Richard Gong <richard.gong@intel.com>
---
v2: this patch is added in patch set version 2
v3: change to put fpga_mgr node under firmware/svc node
v4: s/fpga-mgr@0/fpga-mgr/ to remove unit_address
    add Richard's signed-off-by
v5: no change
v6: no change
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 1ba9a1c..5431c8a 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -106,6 +106,14 @@
 		interrupt-parent = <&intc>;
 		ranges = <0 0 0 0xffffffff>;
 
+		base_fpga_region {
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+
+			compatible = "fpga-region";
+			fpga-mgr = <&fpga_mgr>;
+		};
+
 		clkmgr: clock-controller@ffd10000 {
 			compatible = "intel,stratix10-clkmgr";
 			reg = <0xffd10000 0x1000>;
@@ -500,6 +508,10 @@
 				compatible = "intel,stratix10-svc";
 				method = "smc";
 				memory-region = <&service_reserved>;
+
+				fpga_mgr: fpga-mgr {
+					compatible = "intel,stratix10-soc-fpga-mgr";
+				};
 			};
 		};
 	};
-- 
2.7.4
