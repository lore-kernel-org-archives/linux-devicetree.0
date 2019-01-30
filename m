From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v3 0/3] imx8mq: Add QuadSPI controller
Date: Wed, 30 Jan 2019 12:05:08 +0000
Message-ID: <20190130120511.11555-1-ccaione@baylibre.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Enable the QuadSPI controller in the DTS and document it.

Carlo Caione (3):
  arm64: dts: imx8mq: Add QuadSPI controller
  arm64: dts: imx8mq-evk: Enable the QuadSPI controller
  dt-bindings: spi: Document imx8mq binding

 .../devicetree/bindings/spi/spi-fsl-qspi.txt  |  2 ++
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  | 26 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 17 +++++++++++-
 3 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.19.1
