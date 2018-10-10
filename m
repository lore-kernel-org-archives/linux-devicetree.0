From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v3 0/4] drivers: soc: xilinx: Add support for ZynqMP power
 domain driver
Date: Wed, 10 Oct 2018 18:41:44 +0000
Message-ID: <BL2PR02MB2130719D4A82F429745DDBEEB8E00@BL2PR02MB2130.namprd02.prod.outlook.com>
References: <1538688221-9823-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1538688221-9823-1-git-send-email-jollys@xilinx.com>
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
To: Jolly Shah <JOLLYS@xilinx.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Ping for comments

Thanks,
Jolly Shah

> -----Original Message-----
> From: Jolly Shah [mailto:jolly.shah@xilinx.com]
> Sent: Thursday, October 04, 2018 2:24 PM
> To: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> <michals@xilinx.com>; robh+dt@kernel.org; mark.rutland@arm.com
> Cc: Rajan Vaja <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>
> Subject: [PATCH v3 0/4] drivers: soc: xilinx: Add support for ZynqMP power
> domain driver
> 
> The zynqmp power domain driver communicates the usage requirements for
> logical power domains / devices to the platform FW.
> FW is responsible for choosing appropriate power states, taking Linux' usage
> information into account.
> 
> This patch series is based on top of Xilinx firmware patch set:
> https://patchwork.kernel.org/cover/10555405/
> 
> v3:
>  - Changed binding to have FW node as a power controller as suggested by Rob
>  - Updated FW driver to register it as mfd child devices from firmware probe
>  - Move bindings location as suggested
> 
> v2:
>  - Rebased on top of latest firmware driver patch series
>  - Updated driver name from zynqmp-genpd to zynqmp-power-controller
>  - Updated device tree bindings to move power controller node under firmware
> node
> 
> Jolly Shah (1):
>   drivers: soc: xilinx: Add ZynqMP power domain driver
> 
> Rajan Vaja (3):
>   dt-bindings: power: Add ZynqMP power domain bindings
>   firmware: xilinx: Add APIs to control node status/power
>   firmware: xilinx: Add node IDs for zynqmp firmware
> 
>  .../bindings/power/xlnx,zynqmp-genpd.txt           |  34 ++
>  drivers/firmware/xilinx/Kconfig                    |   1 +
>  drivers/firmware/xilinx/zynqmp.c                   |  73 ++++
>  drivers/soc/xilinx/Kconfig                         |   9 +
>  drivers/soc/xilinx/Makefile                        |   2 +
>  drivers/soc/xilinx/zynqmp_pm_domains.c             | 403
> +++++++++++++++++++++
>  include/dt-bindings/power/xlnx-zynqmp-power.h      |  39 ++
>  include/linux/firmware/xlnx-zynqmp.h               |  98 +++++
>  8 files changed, 659 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/xlnx,zynqmp-
> genpd.txt
>  create mode 100644 drivers/soc/xilinx/zynqmp_pm_domains.c
>  create mode 100644 include/dt-bindings/power/xlnx-zynqmp-power.h
> 
> --
> 2.7.4
