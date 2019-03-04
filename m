From: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v3 00/12] Add support for usb on Hikey960
Date: Mon, 4 Mar 2019 12:15:20 +0000
Message-ID: <14470535-0101-bdc9-17ca-52025c42fd4c@arm.com>
References: <20190302090505.65542-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190302090505.65542-1-chenyu56@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yu Chen <chenyu56@huawei.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi,

On 02/03/2019 09:04, Yu Chen wrote:
> The patchset adds support for usb functionality of Hikey960, includes:
> - dwc3 driver for Hisilicon Kirin Soc hi3660
> - usb driver for HiKey960 board
> - some adjustment in dwc3, usb gadget and typec driver
> - dts for support usb of HiKey960
> 
> This patchset based on patchset https://lkml.org/lkml/2019/1/25/344
> of Heikki Krogerus
> 

Works fine on my board, thanks for keeping this up.

Tested-by: Valentin Schneider <valentin.schneider@arm.com>

> Yu Chen (12):
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
>   usb: roles: Add usb role switch notifier.
>   usb: dwc3: Registering a role switch in the DRD code.
>   hikey960: Support usb functionality of Hikey960
>   usb: gadget: Add configfs attribuite for controling
>     match_existing_only
>   dts: hi3660: Add support for usb on Hikey960
> 
>  .../bindings/misc/hisilicon-hikey-usb.txt          |  52 +++++
>  .../devicetree/bindings/phy/phy-hi3660-usb3.txt    |  28 +++
>  MAINTAINERS                                        |   8 +
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts  |  53 +++++
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  74 +++++++
>  drivers/misc/Kconfig                               |   6 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/hisi_hikey_usb.c                      | 167 +++++++++++++++
>  drivers/phy/hisilicon/Kconfig                      |  10 +
>  drivers/phy/hisilicon/Makefile                     |   1 +
>  drivers/phy/hisilicon/phy-hi3660-usb3.c            | 232 +++++++++++++++++++++
>  drivers/usb/dwc3/Kconfig                           |   1 +
>  drivers/usb/dwc3/core.c                            |  43 ++++
>  drivers/usb/dwc3/core.h                            |  10 +
>  drivers/usb/dwc3/drd.c                             |  58 +++++-
>  drivers/usb/dwc3/dwc3-of-simple.c                  |   4 +-
>  drivers/usb/dwc3/gadget.c                          |   2 +-
>  drivers/usb/gadget/configfs.c                      |  32 +++
>  drivers/usb/roles/class.c                          |  20 +-
>  include/linux/usb/role.h                           |  46 ++++
>  20 files changed, 844 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
>  create mode 100644 drivers/misc/hisi_hikey_usb.c
>  create mode 100644 drivers/phy/hisilicon/phy-hi3660-usb3.c
> 
