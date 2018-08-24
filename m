From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v11 00/11] drivers: Introduce firmware dnd clock river for
 ZynqMP core
Date: Fri, 24 Aug 2018 22:04:24 +0000
Message-ID: <CY1PR02MB213840050AB61B70F3C2CC6FB8360@CY1PR02MB2138.namprd02.prod.outlook.com>
References: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533318808-10781-1-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, Michal Simek <michals@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Please review below patch series. It addresses all your pending comments fo=
r clock driver.

Thanks,
Jolly Shah

> -----Original Message-----
> From: Jolly Shah [mailto:jolly.shah@xilinx.com]
> Sent: Friday, August 03, 2018 10:53 AM
> To: ard.biesheuvel@linaro.org; mingo@kernel.org;
> gregkh@linuxfoundation.org; matt@codeblueprint.co.uk;
> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
> dmitry.torokhov@gmail.com; mturquette@baylibre.com;
> sboyd@codeaurora.org; Michal Simek <michals@xilinx.com>;
> robh+dt@kernel.org; mark.rutland@arm.com; linux-clk@vger.kernel.org
> Cc: Rajan Vaja <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
> <JOLLYS@xilinx.com>
> Subject: [PATCH v11 00/11] drivers: Introduce firmware dnd clock river fo=
r
> ZynqMP core
>=20
> This patchset is adding communication layer with firmware and clock drive=
r who
> uses those APIs to communicate with PMU.
> Firmware driver provides an interface to firmware APIs.Interface APIs can=
 be
> used by any driver to communicate to PMUFW(Platform Management Unit). All
> requests go through ATF.
> This patchset adds CCF compliant clock driver for ZynqMP.Clock driver que=
ries
> supported clock information from firmware and regiters pll and output clo=
cks
> with CCF.
>=20
> v11:
>  - Removed "Reveiwed-by:Stephen Boyd" tag from firmware binding
>  - Updated clock and firmware driver to use probe method instead of init
>  - Marked PMU payload arguments with __le32 for proper endienness code
>=20
> v10:
>  - Incorporated code review comments from v9 patch series. Discussed belo=
w:
> 	https://patchwork.kernel.org/patch/10478575/
> 	https://patchwork.kernel.org/patch/10478457/
> 	https://patchwork.kernel.org/patch/10478461/
> 	https://patchwork.kernel.org/patch/10478463/
>=20
> v9:
>  - Fixed minor typo comments
>=20
> v8:
>  - Corrected typo in clk Kconfig
>=20
> v7:
>  - Removed xilinx specific clock debugfs API support
>  - Added reviewed-by tags for FW and clock bindings
>  - Updated clock node name to clock-controller
>=20
> v6:
>  - Broke patch series to have base FW driver and Clock driver user
>  - Incorporated code review comments from last FW and Clock driver patch
> series. Discussed below:
> 	https://patchwork.kernel.org/patch/10230759/
> 	https://patchwork.kernel.org/patch/10250047/
>=20
> v5:
>  - Added ATF version check support
>  - Updated some functions to be static
>  - Minor function name corrections
>=20
> v4:
>  - Changed clock setrate/getrate API prototype to support 64 bit rate
>  - Defined macros for get_node_status return values
>  - Moved DT node as a child of firmware
>  - Changed debugfs APIs to return data to debugfs buffer instead of dumpi=
ng to
> kernel log
>  - Minor changes to incorporate other review comments from v3 patch serie=
s
>=20
> v3:
>  - added some fixes to firmware-ggs.c
>  - updated pinmux get/set function argument names to specify function id
> instead of node id
>  - added new pinctrl query macros
>  - incorporated review comments from v2 patch series
>=20
> v2:
>  - change SPDX-License-Identifier license text style
>  - split patch into multiple patches
>  - Updated copyrights
>  - Added ABI documentation
>  - incorporated logical review comments from previuos patch. Discussed be=
low:
> 	https://patchwork.kernel.org/patch/10150665/
>=20
> Jolly Shah (1):
>   drivers: clk: Add ZynqMP clock driver
>=20
> Rajan Vaja (10):
>   dt-bindings: firmware: Add bindings for ZynqMP firmware
>   firmware: xilinx: Add Zynqmp firmware driver
>   firmware: xilinx: Add zynqmp IOCTL API for device control
>   firmware: xilinx: Add query data API
>   firmware: xilinx: Add clock APIs
>   firmware: xilinx: Add debugfs interface
>   firmware: xilinx: Add debugfs for IOCTL API
>   firmware: xilinx: Add debugfs for query data API
>   dt-bindings: clock: Add bindings for ZynqMP clock driver
>   firmware: xilinx: Replace init call with probe method
>=20
>  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |  82 +++
>  arch/arm64/Kconfig.platforms                       |   1 +
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/zynqmp/Kconfig                         |  10 +
>  drivers/clk/zynqmp/Makefile                        |   4 +
>  drivers/clk/zynqmp/clk-gate-zynqmp.c               | 144 +++++
>  drivers/clk/zynqmp/clk-mux-zynqmp.c                | 141 ++++
>  drivers/clk/zynqmp/clk-zynqmp.h                    |  68 ++
>  drivers/clk/zynqmp/clkc.c                          | 716 +++++++++++++++=
++++++
>  drivers/clk/zynqmp/divider.c                       | 217 +++++++
>  drivers/clk/zynqmp/pll.c                           | 335 ++++++++++
>  drivers/firmware/Kconfig                           |   1 +
>  drivers/firmware/Makefile                          |   1 +
>  drivers/firmware/xilinx/Kconfig                    |  23 +
>  drivers/firmware/xilinx/Makefile                   |   5 +
>  drivers/firmware/xilinx/zynqmp-debug.c             | 249 +++++++
>  drivers/firmware/xilinx/zynqmp-debug.h             |  22 +
>  drivers/firmware/xilinx/zynqmp.c                   | 535 +++++++++++++++
>  include/dt-bindings/clock/xlnx,zynqmp-clk.h        | 116 ++++
>  include/linux/firmware/xlnx-zynqmp.h               | 116 ++++
>  21 files changed, 2788 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.tx=
t
>  create mode 100644 drivers/clk/zynqmp/Kconfig  create mode 100644
> drivers/clk/zynqmp/Makefile  create mode 100644 drivers/clk/zynqmp/clk-ga=
te-
> zynqmp.c
>  create mode 100644 drivers/clk/zynqmp/clk-mux-zynqmp.c
>  create mode 100644 drivers/clk/zynqmp/clk-zynqmp.h  create mode 100644
> drivers/clk/zynqmp/clkc.c  create mode 100644 drivers/clk/zynqmp/divider.=
c
> create mode 100644 drivers/clk/zynqmp/pll.c  create mode 100644
> drivers/firmware/xilinx/Kconfig  create mode 100644
> drivers/firmware/xilinx/Makefile  create mode 100644
> drivers/firmware/xilinx/zynqmp-debug.c
>  create mode 100644 drivers/firmware/xilinx/zynqmp-debug.h
>  create mode 100644 drivers/firmware/xilinx/zynqmp.c  create mode 100644
> include/dt-bindings/clock/xlnx,zynqmp-clk.h
>  create mode 100644 include/linux/firmware/xlnx-zynqmp.h
>=20
> --
> 2.7.4
