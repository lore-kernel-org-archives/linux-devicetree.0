From: Peter Senna Tschudin <peter.senna@collabora.com>
Subject: [PATCH V2 2/5] dts/imx6q-b850v3: Configure IPU assignment order
Date: Thu,  9 Jun 2016 18:25:02 +0200
Message-ID: <b42202e66ab3a82ad134924c12c50ba64b2d92d1.1465486875.git.peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
 <cover.1465486875.git.peter.senna@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1465486875.git.peter.senna@collabora.com>
In-Reply-To: <cover.1465486875.git.peter.senna@collabora.com>
References: <cover.1465486875.git.peter.senna@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: airlied@linux.ie, akpm@linux-foundation.org, davem@davemloft.net, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, enric.balletbo@collabora.com, eballetbo@gmail.com, galak@codeaurora.org, gregkh@linuxfoundation.org, heiko@sntech.de, ijc+devicetree@hellion.org.uk, jslaby@suse.cz, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux@roeck-us.net, mark.rutland@arm.com, martin.donnelly@ge.com, martyn.welch@collabora.co.uk, mchehab@osg.samsung.com, pawel.moll@arm.com, peter.senna@collabora.com, peter.senna@gmail.com, p.zabel@pengutronix.de, thierry.reding@gmail.com, rmk+kernel@armlinux.org.uk, robh+dt@kernel.org, shawnguo@kernel.org, tiwai@suse.com, treding@nvidia.com, ykk@rock-chips.com
Cc: Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

As the IPU has combined limitations across multiple crtcs, and as that
can't be communicated to userspace at the moment, reorder the crtcs to
allow support to two Full-HD monitors by avoiding assigning two
monitors to a single IPU.

Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
---
Changes from V1:
 - New commit message

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
