From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH v4 0/2] add qixis driver
Date: Tue, 5 Feb 2019 10:14:39 +0000
Message-ID: <20190205153924.7204-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
Content-ID: <7F4E9F77F385CF47BE8D769A11A9B993@eurprd04.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "open list : OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Varun Sethi <V.Sethi@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

FPGA on LX2160AQDS/LX2160ARDB connected on I2C bus, so add qixis driver which is basically an i2c client driver to control FPGA.

Also added platform driver for MMIO based FPGA, like the one available on LS2088ARDB/LS2088AQDS.

This driver is essential to control MDIO mux multiplexing.

This driver is dependent on below patches:
https://www.mail-archive.com/netdev@vger.kernel.org/msg281274.html

Cc: Varun Sethi <V.Sethi@nxp.com>

---
Notes:
	V3:
	- https://patchwork.kernel.org/cover/10795195/
	V2:
	- https://patchwork.kernel.org/cover/10788341/
	V1:
	- https://patchwork.kernel.org/cover/10627297/

Pankaj Bansal (2):
  dt-bindings: soc: fsl: Document Qixis FPGA usage
  drivers: soc: fsl: add qixis driver

 .../bindings/soc/fsl/qixis_ctrl.txt           |  53 +++++
 drivers/soc/fsl/Kconfig                       |  11 +
 drivers/soc/fsl/Makefile                      |   1 +
 drivers/soc/fsl/qixis_ctrl.c                  | 222 ++++++++++++++++++
 4 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/qixis_ctrl.txt
 create mode 100644 drivers/soc/fsl/qixis_ctrl.c

-- 
2.17.1
