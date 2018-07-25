From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v10 00/10] drivers: Introduce firmware dnd clock river for
 ZynqMP core
Date: Wed, 25 Jul 2018 11:51:14 +0200
Message-ID: <19376df2-fdd4-12e3-da4c-37106fffed19@xilinx.com>
References: <1531857547-16652-1-git-send-email-jollys@xilinx.com>
 <2c3aad45-37ce-2446-4b90-bddb477286ed@xilinx.com>
 <CY1PR02MB2138E21A3FFBD5FEEAA7D6D4B8550@CY1PR02MB2138.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY1PR02MB2138E21A3FFBD5FEEAA7D6D4B8550@CY1PR02MB2138.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <JOLLYS@xilinx.com>, "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Rajan Vaja <RAJANV@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 24.7.2018 20:14, Jolly Shah wrote:
> Hi Michal,
> 
>> -----Original Message-----
>> From: Michal Simek [mailto:michal.simek@xilinx.com]
>> Sent: Thursday, July 19, 2018 3:33 AM
>> To: Jolly Shah <JOLLYS@xilinx.com>; ard.biesheuvel@linaro.org;
>> mingo@kernel.org; gregkh@linuxfoundation.org; matt@codeblueprint.co.uk;
>> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
>> dmitry.torokhov@gmail.com; mturquette@baylibre.com;
>> sboyd@codeaurora.org; Michal Simek <michals@xilinx.com>;
>> robh+dt@kernel.org; mark.rutland@arm.com; linux-clk@vger.kernel.org
>> Cc: Rajan Vaja <RAJANV@xilinx.com>; linux-arm-kernel@lists.infradead.org;
>> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Jolly Shah
>> <JOLLYS@xilinx.com>
>> Subject: Re: [PATCH v10 00/10] drivers: Introduce firmware dnd clock river for
>> ZynqMP core
>>
>> On 17.7.2018 21:58, Jolly Shah wrote:
>>> This patchset is adding communication layer with firmware and clock
>>> driver who uses those APIs to communicate with PMU.
>>> Firmware driver provides an interface to firmware APIs.Interface APIs
>>> can be used by any driver to communicate to PMUFW(Platform Management
>> Unit). All requests go through ATF.
>>> This patchset adds CCF compliant clock driver for ZynqMP.Clock driver
>>> queries supported clock information from firmware and regiters pll and output
>> clocks with CCF.
>>> v10:
>>>  - Incorporated code review comments from v9 patch series. Discussed below:
>>> 	https://patchwork.kernel.org/patch/10478575/
>>> 	https://patchwork.kernel.org/patch/10478457/
>>> 	https://patchwork.kernel.org/patch/10478461/
>>> 	https://patchwork.kernel.org/patch/10478463/
>>>
>>> v9:
>>>  - Fixed minor typo comments
>>>
>>> v8:
>>>  - Corrected typo in clk Kconfig
>>>
>>> v7:
>>>  - Removed xilinx specific clock debugfs API support
>>>  - Added reviewed-by tags for FW and clock bindings
>>>  - Updated clock node name to clock-controller
>>>
>>> v6:
>>>  - Broke patch series to have base FW driver and Clock driver user
>>>  - Incorporated code review comments from last FW and Clock driver patch
>> series. Discussed below:
>>> 	https://patchwork.kernel.org/patch/10230759/
>>> 	https://patchwork.kernel.org/patch/10250047/
>>>
>>> v5:
>>>  - Added ATF version check support
>>>  - Updated some functions to be static
>>>  - Minor function name corrections
>>>
>>> v4:
>>>  - Changed clock setrate/getrate API prototype to support 64 bit rate
>>>  - Defined macros for get_node_status return values
>>>  - Moved DT node as a child of firmware
>>>  - Changed debugfs APIs to return data to debugfs buffer instead of
>>> dumping to kernel log
>>>  - Minor changes to incorporate other review comments from v3 patch
>>> series
>>>
>>> v3:
>>>  - added some fixes to firmware-ggs.c
>>>  - updated pinmux get/set function argument names to specify function
>>> id instead of node id
>>>  - added new pinctrl query macros
>>>  - incorporated review comments from v2 patch series
>>>
>>> v2:
>>>  - change SPDX-License-Identifier license text style
>>>  - split patch into multiple patches
>>>  - Updated copyrights
>>>  - Added ABI documentation
>>>  - incorporated logical review comments from previuos patch. Discussed
>> below:
>>> 	https://patchwork.kernel.org/patch/10150665/
>>>
>>> Jolly Shah (1):
>>>   drivers: clk: Add ZynqMP clock driver
>>>
>>> Rajan Vaja (9):
>>>   dt-bindings: firmware: Add bindings for ZynqMP firmware
>>>   firmware: xilinx: Add Zynqmp firmware driver
>>>   firmware: xilinx: Add zynqmp IOCTL API for device control
>>>   firmware: xilinx: Add query data API
>>>   firmware: xilinx: Add clock APIs
>>>   firmware: xilinx: Add debugfs interface
>>>   firmware: xilinx: Add debugfs for IOCTL API
>>>   firmware: xilinx: Add debugfs for query data API
>>>   dt-bindings: clock: Add bindings for ZynqMP clock driver
>>>
>>>  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       |  82 +++
>>>  arch/arm64/Kconfig.platforms                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/zynqmp/Kconfig                         |  10 +
>>>  drivers/clk/zynqmp/Makefile                        |   4 +
>>>  drivers/clk/zynqmp/clk-gate-zynqmp.c               | 144 +++++
>>>  drivers/clk/zynqmp/clk-mux-zynqmp.c                | 141 ++++
>>>  drivers/clk/zynqmp/clk-zynqmp.h                    |  68 ++
>>>  drivers/clk/zynqmp/clkc.c                          | 719 +++++++++++++++++++++
>>>  drivers/clk/zynqmp/divider.c                       | 217 +++++++
>>>  drivers/clk/zynqmp/pll.c                           | 335 ++++++++++
>>>  drivers/firmware/Kconfig                           |   1 +
>>>  drivers/firmware/Makefile                          |   1 +
>>>  drivers/firmware/xilinx/Kconfig                    |  23 +
>>>  drivers/firmware/xilinx/Makefile                   |   5 +
>>>  drivers/firmware/xilinx/zynqmp-debug.c             | 249 +++++++
>>>  drivers/firmware/xilinx/zynqmp-debug.h             |  22 +
>>>  drivers/firmware/xilinx/zynqmp.c                   | 562 ++++++++++++++++
>>>  include/dt-bindings/clock/xlnx,zynqmp-clk.h        | 116 ++++
>>>  include/linux/firmware/xlnx-zynqmp.h               | 116 ++++
>>>  21 files changed, 2818 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware
>>> .txt  create mode 100644 drivers/clk/zynqmp/Kconfig  create mode
>>> 100644 drivers/clk/zynqmp/Makefile  create mode 100644
>>> drivers/clk/zynqmp/clk-gate-zynqmp.c
>>>  create mode 100644 drivers/clk/zynqmp/clk-mux-zynqmp.c
>>>  create mode 100644 drivers/clk/zynqmp/clk-zynqmp.h  create mode
>>> 100644 drivers/clk/zynqmp/clkc.c  create mode 100644
>>> drivers/clk/zynqmp/divider.c  create mode 100644
>>> drivers/clk/zynqmp/pll.c  create mode 100644
>>> drivers/firmware/xilinx/Kconfig  create mode 100644
>>> drivers/firmware/xilinx/Makefile  create mode 100644
>>> drivers/firmware/xilinx/zynqmp-debug.c
>>>  create mode 100644 drivers/firmware/xilinx/zynqmp-debug.h
>>>  create mode 100644 drivers/firmware/xilinx/zynqmp.c  create mode
>>> 100644 include/dt-bindings/clock/xlnx,zynqmp-clk.h
>>>  create mode 100644 include/linux/firmware/xlnx-zynqmp.h
>>>
>>
>> It looks pretty calm over the last several series that's why when I get an answer
>> from Stephen or Mike I will take this series via my tree and arm-soc tree.
>>
>> I have applied 01-08 here
>>  https://github.com/Xilinx/linux-xlnx/commits/zynqmp/soc
>>
>> Thanks,
>> Michal
> 
> 
> Thanks for merging the patches. 
> By mistake I added “Reviewed-by: Stephen Boyd sboyd@kernel.org” for firmware bindings (Patch01).  Stephen had reviewed clock bindings only.  Please suggest if I should send a new version with that fix.

I have fixed that in my branch and I have asked Shephen to look at clk
over chat.

Thanks,
Michal
