From: Yu Chen <chenyu56@huawei.com>
Subject: [RFC 1/3] USB: Add document for usb of Hikey960
Date: Tue, 24 Oct 2017 14:06:08 +0800
Message-ID: <20171024060610.10712-2-chenyu56@huawei.com>
References: <20171024060610.10712-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171024060610.10712-1-chenyu56@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: chenyu56@huawei.com, xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, arnd@arndb.de, olof@lixom.net, timur@codeaurora.org, khilman@baylibre.com, gregory.clement@free-electrons.com, narmstrong@baylibre.com, yamada.masahiro@socionext.com, robh@kernel.org, heiko@sntech.de, damm+renesas@opensource.se, krzk@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, wangbinghui@hisilicon.com
List-Id: devicetree@vger.kernel.org

DT bindings for usb of Hikey960.

Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: Ning Fan <fanning4@hisilicon.com>
Signed-off-by: Di Yang <yangdi10@hisilicon.com>
Signed-off-by: Rui Li <lirui39@hisilicon.com>

---
 .../devicetree/bindings/usb/hisilicon-usb.txt      | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/hisilicon-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/hisilicon-usb.txt b/Documentation/devicetree/bindings/usb/hisilicon-usb.txt
new file mode 100644
index 000000000000..dc4c460885d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/hisilicon-usb.txt
@@ -0,0 +1,38 @@
+* HISILICON USB HUB
+
+Required properties:
+- compatible: One of the specific types :"hisilicon,hi3660-dwc3",
+			"hisilicon,gpio_hubv1","hisilicon,gpio_hubv2"
+
+Optional properties of devices using ISP1301:
+- transceiver: phandle of isp1301 - this helps the ISP1301 driver to find the
+               ISP1301 instance associated with the respective USB driver
+
+Example:
+
+	hisi_usb@ff200000 {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "hisilicon,hi3660-dwc3";
+		reg = <0x0 0xff200000 0x0 0x1000
+			 0x0 0xff100000 0x0 0x100000>;
+		ranges;
+		bc_again_flag = <0>;
+
+		clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
+			 <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
+		clock-names = "clk_usb3phy_ref", "aclk_usb3otg";
+		eye_diagram_param = <0x1c466e3>;
+		eye_diagram_host_param = <0x1c466e3>;
+		usb3_phy_cr_param = <0xb80>;
+		usb3_phy_host_cr_param = <0x980>;
+		usb3_phy_tx_vboost_lvl = <0x5>;
+
+		dwc3@ff100000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0xff100000 0x0 0x100000>;
+			interrupts = <0 159 4>, <0 161 4>;
+			dr_mode = "otg";
+			maximum-speed = "super-speed";
+		};
+	};
\ No newline at end of file
-- 
2.11.GIT
