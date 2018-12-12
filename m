From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH 0/3] dts: fsl: lsch2: dts modifications for chassis 2 devices
Date: Wed, 12 Dec 2018 07:09:49 +0000
Message-ID: <20181212123505.32415-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>, Varun Sethi <V.Sethi@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series fixes some issues with the chassis 2 bases dts/dtsi
files.

The reference for patches is as follows:
patch 1 : https://elinux.org/Device_Tree_Linux#disabled_nodes
patch 2 : https://elixir.bootlin.com/linux/v4.19.8/source/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts#L121
patch 3 : https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/common-properties.txt

Cc: Varun Sethi <V.Sethi@nxp.com>

Pankaj Bansal (3):
  dts: arm64: fsl: lsch2: fix status field of serdes controlled devices
  dts: arm64: fsl: lsch2: fix the rgmii phy type
  dts: arm64: fsl: lsch2: Fix the endianness property in nodes

 .../boot/dts/freescale/fsl-ls1043a-qds.dts    | 18 ++++++++++++
 .../boot/dts/freescale/fsl-ls1043a-rdb.dts    | 17 +++++++++++
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  4 +++
 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 18 ++++++++++++
 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 28 +++++++++++++++++--
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  6 ++--
 .../dts/freescale/qoriq-fman3-0-10g-0.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-10g-1.dtsi    |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-0.dtsi     |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-1.dtsi     |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-2.dtsi     |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-3.dtsi     |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-4.dtsi     |  1 +
 .../dts/freescale/qoriq-fman3-0-1g-5.dtsi     |  1 +
 14 files changed, 95 insertions(+), 4 deletions(-)

-- 
2.17.1
