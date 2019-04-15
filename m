From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 0/2] Add Reset controller support for HI3670 SoC
Date: Mon, 15 Apr 2019 16:53:36 +0100
Message-ID: <fa2bf251-56f4-fe2c-b645-4b634a87940f@hisilicon.com>
References: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215054955.788-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org, john.stultz@linaro.org, xuwei5@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi Manivannan,

On 2/15/2019 5:49 AM, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds Reset controller support for HiSilicon HI3670 SoC.
> HI3670 SoC is architecturally same as HI3660 SoC, hence the same driver
> is reused.
> 
> This patchset has been tested on HiKey970 board.
> 
> Thanks,
> Mani
> 
> Changes in v2:
> 
> * Used the DT compatible fallback approach instead of adding a new one
>   for HI3670
> 
> Manivannan Sadhasivam (2):
>   dt-bindings: reset: Add HI3670 reset controller binding
>   arm64: dts: hisilicon: hi3670: Add reset controller support
> 
>  .../devicetree/bindings/reset/hisilicon,hi3660-reset.txt   | 7 ++++---
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi                  | 6 ++++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 

Thanks!
Applied the series to the hisilicon dts tree.

Best Regards,
Wei
