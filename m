From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/2] Add and document the i.MX8MQ OTP controller
Date: Sat,  2 Feb 2019 15:06:36 +0000
Message-ID: <20190202150638.13672-1-ccaione@baylibre.com>
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

Add a new node to enable the On-Chip OTP controller and add the new 
binding in the documentation.

Carlo Caione (2):
  arm64: dts: imx8mq: Add on-chip OTP controller node
  dt-bindings: imx-ocotp: Add i.MX8MQ compatible

 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 1 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.19.1
