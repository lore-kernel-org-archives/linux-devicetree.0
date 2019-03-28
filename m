From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/12] dt-bindings: phy: Add support for HiSilicon's
 hi3660 USB PHY
Date: Thu, 28 Mar 2019 12:11:01 -0500
Message-ID: <20190328171101.GA25451@bogus>
References: <20190316035342.77998-1-chenyu56@huawei.com>
 <20190316035342.77998-2-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190316035342.77998-2-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Sat, 16 Mar 2019 11:53:31 +0800, Yu Chen wrote:
> This patch adds binding documentation for supporting the hi3660 usb
> phy on boards like the HiKey960.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> ---
> v1:
> * Fix some format error as suggested by Rob.
> v2:
> * Change hi3660 usb PHY to hi3660 USB PHY
> v3:
> * Make device node a subnode of usb3_otg_bc register.
> v4:
> * Remove "hisilicon,usb3-otg-bc-syscon" property
> ---
> ---
>  .../devicetree/bindings/phy/phy-hi3660-usb3.txt    | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
