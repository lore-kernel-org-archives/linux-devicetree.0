From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v6 0/3] drivers: soc: xilinx: Add support for ZynqMP PM
 driver
Date: Tue, 12 Feb 2019 13:44:03 +0100
Message-ID: <be838b02-1fc1-ae9b-9a7b-d63e11d7068e@xilinx.com>
References: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548794301-30483-1-git-send-email-jollys@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>, matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On 29. 01. 19 21:38, Jolly Shah wrote:
> Add ZynqMP PM driver. PM driver provides power management
> support for ZynqMP.
> 
> v6:
>  - Rebased on top of 
> 	https://github.com/Xilinx/linux-xlnx/commits/zynqmp/soc
> v5:
>  - Added Reviewed tag for dt bindings
> 
> v4:
>  - Minor fixes to address v3 review comments
>  
> v3:
>  - Updated DT bindings as per v2 review comments
>  
> v2:
>  - Rebased on top of latest firmware driver patch series
>  - Updated driver to use shared interrupt instead of mailbox
> 
> Jolly Shah (1):
>   firmware: xilinx: Implement ZynqMP power management APIs
> 
> Rajan Vaja (2):
>   dt-bindings: soc: Add ZynqMP PM bindings
>   drivers: soc: xilinx: Add ZynqMP PM driver
> 
>  .../bindings/power/reset/xlnx,zynqmp-power.txt     |  25 +++
>  drivers/firmware/xilinx/zynqmp.c                   |  29 ++++
>  drivers/soc/xilinx/Kconfig                         |  11 ++
>  drivers/soc/xilinx/Makefile                        |   1 +
>  drivers/soc/xilinx/zynqmp_power.c                  | 178 +++++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h               |  20 +++
>  6 files changed, 264 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.txt
>  create mode 100644 drivers/soc/xilinx/zynqmp_power.c
> 

Applied.

Thanks,
Michal
