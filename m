From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] Add 96Boards Meerkat96 board support
Date: Thu, 13 Jun 2019 18:57:03 +0530
Message-ID: <20190613132705.5150-1-manivannan.sadhasivam@linaro.org>
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
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, festevam@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yossi@novtech.com, pbrobinson@gmail.com, kernel@pengutronix.de, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds board support for 96Boards Meerkat96 board from
Novtech. This board is one of the Consumer Edition boards of the 96Boards
family based on i.MX7D SoC. Following are the currently supported
features of the board:

* uSD
* WiFi/BT
* USB

More information about this board can be found in 96Boards product page:
https://www.96boards.org/product/imx7-96/

Thanks,
Mani

Changes in v2:

* Addressed the comments from Shawn on board dts.

Manivannan Sadhasivam (2):
  dt-bindings: arm: Document 96Boards Meerkat96 devicetree binding
  ARM: dts: Add support for 96Boards Meerkat96 board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/imx7d-meerkat96.dts         | 389 ++++++++++++++++++
 3 files changed, 391 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-meerkat96.dts

-- 
2.17.1
