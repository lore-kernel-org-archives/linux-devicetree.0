From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/6] ARM: dts: Add MFC codec support to SMDKV310 DT
Date: Tue, 29 Jan 2013 14:40:55 +0100
Message-ID: <5107D167.4050209@samsung.com>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
 <1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

On 01/29/2013 05:13 AM, Sachin Kamat wrote:
> Added MFC codec support to SMDKV310 DT file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/boot/dts/exynos4210-smdkv310.dts |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> index f634907..8481f8f 100644
> --- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
> +++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
> @@ -189,4 +189,9 @@
>  			};
>  		};
>  	};
> +
> +	codec@13400000 {
> +		samsung,mfc-r = <0x43000000 0x800000>;
> +		samsung,mfc-l = <0x51000000 0x800000>;

With the change as I proposed in patch 2/6 you need to add:

		status = "okay";

in this node and for all other boards in the further patches
in this series.

--

Thanks,
Sylwester
