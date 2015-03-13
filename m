From: Peter Chen <peter.chen@freescale.com>
Subject: [PATCH v2 0/3] imx: add max7310 and usb support for imx6qdl sabreauto
Date: Fri, 13 Mar 2015 14:21:41 +0800
Message-ID: <1426227704-26294-1-git-send-email-peter.chen@freescale.com>
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
To: shawn.guo@linaro.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, robh+dt@kernel.org, Peter Chen <peter.chen@freescale.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Changes for v2:
- Delete reset-gpio binding at dts. [Patch 1/3]

Hi Shawn,

In this series, two functions are added for imx6qdl sabreauto board.

- In the 1st patch, the i2c interface gpio expendor max7310 is added
- In the 2nd patch, the USB support is added
- In the 3rd patch, the driver for max7310 is added

Peter Chen (3):
  ARM: imx6qdl-sabreauto.dtsi: add max7310 support
  ARM: imx6qdl-sabreauto.dtsi: enable USB support
  ARM: imx_v6_v7_defconfig: Add CONFIG_GPIO_PCA953X

 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi | 79 ++++++++++++++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig     |  1 +
 2 files changed, 80 insertions(+)

-- 
1.9.1
