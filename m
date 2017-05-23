From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/12] arm64: dts: hikey960: pinctrl: add more pinmux and
 pinconfig
Date: Mon, 22 May 2017 19:49:34 -0500
Message-ID: <20170523004934.mgdy7d6tktytdbqj@rob-hp-laptop>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-4-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170517083745.24479-4-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, wangkefeng.wang@huawei.com, puck.chen@hisilicon.com, xuejiancheng@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>, Chen Jun <chenjun14@huawei.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 04:37:36PM +0800, Guodong Xu wrote:
> From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> 
> This commit adds more pinmux and pinctrl information for devices
> on HiKey960, including i2c, spi, cam, uart, ufs, pcie, csi, pwr_key,
> isp, sd/sdio, i2s, and usb.
> 
> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> Signed-off-by: Chen Jun <chenjun14@huawei.com>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  .../arm64/boot/dts/hisilicon/hikey960-pinctrl.dtsi | 779 +++++++++++++++++++--
>  1 file changed, 719 insertions(+), 60 deletions(-)

Acked-by: Rob Herring <robh@kernel.org> 
