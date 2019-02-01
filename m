From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey: Revert "Enable HS200 mode on eMMC"
Date: Fri, 1 Feb 2019 16:36:39 +0000
Message-ID: <5be6f6d5-83e7-7225-914f-f61205ce6e7f@hisilicon.com>
References: <1548273966-5889-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1548273966-5889-1-git-send-email-john.stultz@linaro.org>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Alistair Strachan <astrachan@google.com>, Ryan Grachek <ryan@edited.us>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, "stable #4 . 17+" <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi John,

On 1/23/2019 8:06 PM, John Stultz wrote:
> From: Alistair Strachan <astrachan@google.com>
> 
> This reverts commit abd7d0972a192ee653efc7b151a6af69db58f2bb. This
> change was already partially reverted by John Stultz in commit
> 9c6d26df1fae ("arm64: dts: hikey: Fix eMMC corruption regression").
> 
> This change appears to cause controller resets and block read failures
> which prevents successful booting on some hikey boards.
> 
> Cc: Ryan Grachek <ryan@edited.us>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: stable <stable@vger.kernel.org> #4.17+
> Signed-off-by: Alistair Strachan <astrachan@google.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Applied to the hisilicon soc dt tree.
Thanks!

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index 6102350..7092460 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -300,7 +300,6 @@
>  
>  		dwmmc_0: dwmmc0@f723d000 {
>  			cap-mmc-highspeed;
> -			mmc-hs200-1_8v;
>  			non-removable;
>  			bus-width = <0x8>;
>  			vmmc-supply = <&ldo19>;
> 
