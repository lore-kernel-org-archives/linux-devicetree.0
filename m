From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [RESEND][PATCH 0/3] DMA dts changes for hi3660
Date: Mon, 15 Apr 2019 17:02:27 +0100
Message-ID: <5420f497-1316-c4ba-5b8a-1116f680cb01@hisilicon.com>
References: <1554365788-25610-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554365788-25610-1-git-send-email-john.stultz@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Tanglei Han <hantanglei@huawei.com>, Zhuangluan Su <suzhuangluan@hisilicon.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, xuwei5@hisilicon.com
List-Id: devicetree@vger.kernel.org

Hi John,

On 4/4/2019 9:16 AM, John Stultz wrote:
> Here are a few dts changes which didn't get picked up
> for the last merge window to enable support for code
> changes that did land in v5.1.
> 
> Let me know if you have any objecitons or feedback!
> 
> thanks
> -john
> 
> Cc: Tanglei Han <hantanglei@huawei.com>
> Cc: Zhuangluan Su <suzhuangluan@hisilicon.com>
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> 
> 
> John Stultz (2):
>   arm64: dts: hi3660: Add dma to uart nodes
>   arm64: dts: hi3660: Fixup unofficial dma-min-chan to dma-channel-mask
> 
> Youlin Wang (1):
>   arm64: dts: hi3660: Add hisi asp dma device
> 
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 

Thanks!
Applied the series to the hisilicon dts tree.

Best Regards,
Wei
