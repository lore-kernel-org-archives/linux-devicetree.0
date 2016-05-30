From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH 2/5] arm/dts/imx6q-b850v3: Configure IPU assignment order
Date: Mon, 30 May 2016 18:39:42 +0200
Message-ID: <1464626385-19253-3-git-send-email-peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, akpm@linux-foundation.org, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, p.zabel@pengutronix.de, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
List-Id: devicetree@vger.kernel.org

Configure the IPU assignment order to assign one IPU per external
display. A single IPU can drive multiple external displays but there are
resolution restrictions. After this patch the GPU is capalbe of driving two
Full-HD monitors.

Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
 arch/arm/boot/dts/imx6q-b850v3.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 167f744..88a70de 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -51,6 +51,11 @@
 	chosen {
 		stdout-path = &uart3;
 	};
+
+	display-subsystem {
+		compatible = "fsl,imx-display-subsystem";
+		ports = <&ipu1_di0>, <&ipu2_di0>, <&ipu1_di1>, <&ipu2_di1>;
+	};
 };
 
 &clks {
-- 
2.5.5
