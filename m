From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v4 0/3] drivers: soc: xilinx: Add support for ZynqMP PM
 driver
Date: Wed, 10 Oct 2018 18:40:03 +0000
Message-ID: <BL2PR02MB21301ABF94BB130154868CE8B8E00@BL2PR02MB2130.namprd02.prod.outlook.com>
References: <1536953990-12755-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536953990-12755-1-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Ping for comments


> -----Original Message-----
> From: linux-kernel-owner@vger.kernel.org [mailto:linux-kernel-
> owner@vger.kernel.org] On Behalf Of Jolly Shah
> Sent: Friday, September 14, 2018 12:40 PM
> To: matthias.bgg@gmail.com; andy.gross@linaro.org; shawnguo@kernel.org;
> geert+renesas@glider.be; bjorn.andersson@linaro.org;
> sean.wang@mediatek.com; m.szyprowski@samsung.com; Michal Simek
> <michals@xilinx.com>; robh+dt@kernel.org; mark.rutland@arm.com
> Cc: Rajan Vaja <RAJANV@xilinx.com>; devicetree@vger.kernel.org; linux-arm=
-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>
> Subject: [PATCH v4 0/3] drivers: soc: xilinx: Add support for ZynqMP PM d=
river
>=20
> Add ZynqMP PM driver. PM driver provides power management support for
> ZynqMP.
>=20
> This patch series is based on top of Xilinx firmware patch set:
> https://patchwork.kernel.org/cover/10598195/
>=20
> v4:
>  - Minor fixes to address v3 review comments
>=20
> v3:
>  - Updated DT bindings as per v2 review comments
>=20
> v2:
>  - Rebased on top of latest firmware driver patch series
>  - Updated driver to use shared interrupt instead of mailbox
>=20
> Rajan Vaja (3):
>   dt-bindings: soc: Add ZynqMP PM bindings
>   firmware: xilinx: Implement ZynqMP power management APIs
>   drivers: soc: xilinx: Add ZynqMP PM driver
>=20
>  .../bindings/power/reset/xlnx,zynqmp-power.txt     |  22 +++
>  drivers/firmware/xilinx/zynqmp.c                   |  29 ++++
>  drivers/soc/xilinx/Kconfig                         |  11 ++
>  drivers/soc/xilinx/Makefile                        |   1 +
>  drivers/soc/xilinx/zynqmp_power.c                  | 178 +++++++++++++++=
++++++
>  include/linux/firmware/xlnx-zynqmp.h               |  20 +++
>  6 files changed, 261 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.txt
>  create mode 100644 drivers/soc/xilinx/zynqmp_power.c
>=20
> --
> 2.7.4
