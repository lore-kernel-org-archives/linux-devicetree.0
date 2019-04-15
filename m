From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH 0/3] Add MMC controller support for HI3670 SoC
Date: Mon, 15 Apr 2019 16:57:53 +0100
Message-ID: <49d86dbb-2d88-a1f3-53f7-eda90e961cbb@hisilicon.com>
References: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228154511.17566-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, amit.kucheria@linaro.org, guodong.xu@linaro.org, xuwei5@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On 2/28/2019 3:45 PM, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds MMC controller support for HI3670 SoC. Since HI3670
> SoC is architecturally same as the HI3660 SoC, HI3660 DWMMC driver is
> reused here with DT compatible fallback approach. Also, SD and WiFi
> supports are added for the HiKey970 board.
> 
> Wei:
> 
> Please apply this patchset along with the reset and UFS patches in the
> following order:
> 
> 1. Reset support patches
> 2. MMC support patches
> 3. UFS support patches
> 
> PS: Since there is no PMIC support available yet, fixed-regulator nodes
> are used to get the driver working (regulators are enabled by bootloader).
> 
> Thanks,
> Mani
> 
> Manivannan Sadhasivam (3):
>   dt-bindings: mmc: Add HI3670 MMC controller binding
>   arm64: dts: hisilicon: hi3670: Add MMC controller support
>   arm64: dts: hisilicon: hikey970: Add SD and WiFi support
> 
>  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |   2 +
>  .../boot/dts/hisilicon/hi3670-hikey970.dts    |  75 ++++++++++++
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  37 ++++++
>  .../boot/dts/hisilicon/hikey970-pinctrl.dtsi  | 115 ++++++++++++++++++
>  4 files changed, 229 insertions(+)
> 

Thanks!
Applied the series to the hisilicon dts tree with the order.

Best Regards,
Wei
