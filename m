From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v5 0/3] Add support for the Purism Librem5 devkit
Date: Wed, 17 Apr 2019 09:55:11 -0700
Message-ID: <20190417165514.18689-1-angus@akkea.ca>
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
To: angus.ainslie@puri.sm
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>, Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>, m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Sascha Hauer <s.hauer@pengutronix.de>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, "Angus Ainslie (Purism)" <angus@akkea.ca>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gma>
List-Id: devicetree@vger.kernel.org

The Librem5 devkit is based on the imx8mq from NXP. This is a default
devicetree to boot the board to a command prompt.

Changes since v4:

Compiled against linux-next next-20190415.
Added imx8mq to the arm yaml file.
Re-arrange regulator nodes to dropp undefined supplies.
Additional ordering for aesthetics.
Split some long lines.
Added lots of blank lines.
Moved pinctl muxes to where they are used.
Cleaned out reg defintions from regulator nodes.

Changes since v3:

Freshly sorted and pressed nodes.
Change the backlight to an interpolated scale.
Dropped i2c2.
Dropped devkit version number to match debian MR.

Changes since v2:

Fixed incorrect phy-supply for the fsl-fec.
Dropped unused regulator property.
Fixup Makefile for linux-next.

Changes since v1:

Dropped config file.
Updated the board compatible label.
Changed node names to follow naming conventions.
Added a more complete regulator hierachy.
Removed unused nodes.
Removed unknown devices.
Fixed comment style.
Dropped undocumented properties.


Angus Ainslie (Purism) (3):
  arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
  dt-bindings: Add an entry for Purism SPC
  dt-bindings: arm: fsl: Add the imx8mq boards

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 833 ++++++++++++++++++
 4 files changed, 842 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts

-- 
2.17.1
