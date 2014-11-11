From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 7/7] dt-bindings: add document for dw-hdmi
Date: Tue, 11 Nov 2014 20:54:46 +0800
Message-ID: <1415710486-12263-1-git-send-email-andy.yan@rock-chips.com>
References: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415710229-11935-1-git-send-email-andy.yan@rock-chips.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ykk@rock-chips.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Grant Likely <grant.likely@linaro.org>, Andy yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/drm/bridge/dw-hdmi.txt     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt

diff --git a/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
new file mode 100644
index 0000000..aa7ed17
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/bridge/dw-hdmi.txt
@@ -0,0 +1,38 @@
+DesignWare HDMI bridge bindings
+
+Required properities:
+- compatibel: platform specific such as "fsl,imx6q-hdmi","fsl,imx6dl-hdmi"
+	      "rockchip,rk3288-dw-hdmi"
+- reg: physical base address of the controller and length
+- ddc-i2c-bus: the ddc i2c bus
+- interrupts: The interrupt number to the cpu
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
