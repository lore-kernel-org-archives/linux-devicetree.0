From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] dts: ARM: add Kobo Clara HD eBook reader
Date: Mon, 30 Sep 2019 21:43:29 +0200
Message-ID: <20190930194332.12246-1-andreas@kemnade.info>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Marco Felsch <m.felsch@pengutronix.de>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This adds a device tree for the Kobo Clara HD eBook reader.
Name on mainboard is: 37NB-E60K00+4A4
Serials start with: E60K02 (a number also seen in
vendor kernel sources)
These boards are also found in the Tolino Shine 3 reader
but equipped with a i.MX6SL processor. Support for that
device is planned to be added in a later patch series.
To prepare for that the device tree is split up into
a board file containing SoC-independent stuff and a
file containing the SoC-dependent stuff.

Work is based on code from the vendor kernel at
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
but things need to be heavily reworked due to
incompatible bindings and to prepare for Tolino Shine 3

Changes in v2:
- reordered patches
- various cleanups as suggested by Marco Felsch

Andreas Kemnade (3):
  dt-bindings: arm: fsl: add compatible string for Kobo Clara HD
  ARM: dts: add Netronix E60K02 board common file
  ARM: dts: imx: add devicetree for Kobo Clara HD

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/e60k02.dtsi                 | 323 ++++++++++++++++++
 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts    | 279 +++++++++++++++
 4 files changed, 605 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/e60k02.dtsi
 create mode 100644 arch/arm/boot/dts/imx6sll-kobo-clarahd.dts

-- 
2.20.1
