From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v5 00/13] Add support for usb on Hikey960
Date: Mon, 1 Apr 2019 15:57:03 +0100
Message-ID: <867b3cd6-85d5-e87c-0973-ac48d13fb18b@arm.com>
References: <20190329041409.70138-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329041409.70138-1-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

On 29/03/2019 04:13, Yu Chen wrote:
> The patchset adds support for usb functionality of Hikey960, includes:
> - usb phy driver for Hisilicon Kirin Soc hi3660
> - usb driver for HiKey960 board
> - some adjustment in dwc3 and usb role driver
> - dts for support usb of HiKey960
> 
> ---
> v5:
> * Split modification of usb role into two patches, the first one introduces
> stubs for the exiting functions, and the second adds notifier functions.
> ---
> 

Ran the usual tests, still works fine for me.

Tested-by: Valentin Schneider <valentin.schneider@arm.com>

Thanks,
Valentin

> Yu Chen (13):
>   dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
>   dt-bindings: misc: Add bindings for HiSilicon usb hub and data role
>     switch functionality on HiKey960
>   usb: dwc3: dwc3-of-simple: Add support for dwc3 of Hisilicon Soc
>     Platform
>   usb: dwc3: Add splitdisable quirk for Hisilicon Kirin Soc
>   usb: dwc3: Execute GCTL Core Soft Reset while switch mdoe for
>     Hisilicon Kirin Soc
>   usb: dwc3: Increase timeout for CmdAct cleared by device controller
>   phy: Add usb phy support for hi3660 Soc of Hisilicon
>   usb: roles: Introduce stubs for the exiting functions in role.h.
>   usb: roles: Add usb role switch notifier.
>   usb: dwc3: Registering a role switch in the DRD code.
>   hikey960: Support usb functionality of Hikey960
>   usb: gadget: Add configfs attribuite for controling
>     match_existing_only
>   dts: hi3660: Add support for usb on Hikey960
> 
>  .../bindings/misc/hisilicon-hikey-usb.txt          |  52 +++++
>  .../devicetree/bindings/phy/phy-hi3660-usb3.txt    |  26 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  53 +++++
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  73 +++++++
>  drivers/misc/Kconfig                               |   6 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/hisi_hikey_usb.c                      | 162 ++++++++++++++
>  drivers/phy/hisilicon/Kconfig                      |  10 +
>  drivers/phy/hisilicon/Makefile                     |   1 +
>  drivers/phy/hisilicon/phy-hi3660-usb3.c            | 233 +++++++++++++++++++++
>  drivers/usb/dwc3/Kconfig                           |   1 +
>  drivers/usb/dwc3/core.c                            |  45 ++++
>  drivers/usb/dwc3/core.h                            |  15 ++
>  drivers/usb/dwc3/drd.c                             |  63 +++++-
>  drivers/usb/dwc3/dwc3-of-simple.c                  |   4 +-
>  drivers/usb/dwc3/gadget.c                          |   2 +-
>  drivers/usb/gadget/configfs.c                      |  32 +++
>  drivers/usb/roles/class.c                          |  20 +-
>  include/linux/usb/role.h                           |  46 ++++
>  20 files changed, 849 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
>  create mode 100644 drivers/misc/hisi_hikey_usb.c
>  create mode 100644 drivers/phy/hisilicon/phy-hi3660-usb3.c
> 
