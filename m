From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v18 11/12] dt-bindings: Add documentation for rockchip dw hdmi
Date: Fri,  5 Dec 2014 14:33:33 +0800
Message-ID: <1417761213-17382-1-git-send-email-andy.yan@rock-chips.com>
References: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417760564-16858-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: airlied@linux.ie, Philipp Zabel <p.zabel@pengutronix.de>, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Andy Yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v18:
- correct some spelling mistakes in dw_hdmi-rockchip bindings doc

Changes in v17: None
Changes in v16:
- modify clocks bindings
- descrbie ddc-i2c-bus as optional

Changes in v15: None
Changes in v14: None
Changes in v13: None
Changes in v12: None
Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8:
- Add documentation for rockchip dw hdmi

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None

 .../devicetree/bindings/video/dw_hdmi-rockchip.txt | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt

diff --git a/Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt b/Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
new file mode 100644
index 0000000..668091f
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
@@ -0,0 +1,46 @@
+Rockchip specific extensions to the Synopsys Designware HDMI
+================================
+
+Required properties:
+- compatible: "rockchip,rk3288-dw-hdmi";
+- reg: Physical base address and length of the controller's registers.
+- clocks: phandle to hdmi iahb and isfr clocks.
+- clock-names: should be "iahb" "isfr"
+- rockchip,grf: this soc should set GRF regs to mux vopl/vopb.
+- interrupts: HDMI interrupt number
+- ports: contain a port node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt. For
+  vopb,set the reg = <0> and set the reg = <1> for vopl.
+- reg-io-width: the width of the reg:1,4, the value should be 4 on
+  rk3288 platform
+
+Optional properties
+- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
+- clocks, clock-names: phandle to the HDMI CEC clock, name should be "cec"
+
+Example:
+hdmi: hdmi@ff980000 {
+	compatible = "rockchip,rk3288-dw-hdmi";
+	reg = <0xff980000 0x20000>;
+	reg-io-width = <4>;
+	ddc-i2c-bus = <&i2c5>;
+	rockchip,grf = <&grf>;
+	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&cru  PCLK_HDMI_CTRL>, <&cru SCLK_HDMI_HDCP>;
+	clock-names = "iahb", "isfr";
+	status = "disabled";
+	ports {
+		hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_in_vopb: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&vopb_out_hdmi>;
+			};
+			hdmi_in_vopl: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&vopl_out_hdmi>;
+			};
+		};
+	};
+};
-- 
1.9.1
