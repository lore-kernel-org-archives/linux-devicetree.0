From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v12 05/11] dt-bindings: add document for dw_hdmi
Date: Mon, 17 Nov 2014 18:56:34 +0800
Message-ID: <1416221794-13031-1-git-send-email-andy.yan@rock-chips.com>
References: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415793593-5075-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, mark.yao@rock-chips.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Andy yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v12: None
Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8:
- correct some spelling mistake
- modify ddc-i2c-bus and interrupt description

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/drm/bridge/dw_hdmi.txt     | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
new file mode 100644
index 0000000..107c1ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
@@ -0,0 +1,40 @@
+DesignWare HDMI bridge bindings
+
+Required properities:
+- compatible: platform specific such as:
+   * "fsl,imx6q-hdmi"
+   * "fsl,imx6dl-hdmi"
+   * "rockchip,rk3288-dw-hdmi"
+- reg: Physical base address and length of the controller's registers.
+- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
+- interrupts: The HDMI interrupt number
+
+Optional properties
+- reg-io-width: the width of the reg:1,4, default set to 1 if not present
+
+Example:
+	hdmi: hdmi@0120000 {
+		compatible = "fsl,imx6q-hdmi";
+		reg = <0x00120000 0x9000>;
+		interrupts = <0 115 0x04>;
+		gpr = <&gpr>;
+		clocks = <&clks 123>, <&clks 124>;
+		clock-names = "iahb", "isfr";
+		ddc-i2c-bus = <&i2c2>;
+
+		port@0 {
+			reg = <0>;
+
+			hdmi_mux_0: endpoint {
+				remote-endpoint = <&ipu1_di0_hdmi>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			hdmi_mux_1: endpoint {
+				remote-endpoint = <&ipu1_di1_hdmi>;
+			};
+		};
+	};
-- 
1.9.1
