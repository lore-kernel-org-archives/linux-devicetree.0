From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V3 6/7] ARM: dts: Add FIMD output property for smdk5420
Date: Fri, 27 Jun 2014 16:48:09 +0530
Message-ID: <CAEC9eQM63P+cmVe=JXtAF3BQNe4CTD+KE1MK6W_5UoC+JthjTg@mail.gmail.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
	<1403863946-15492-7-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1403863946-15492-7-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, Sean Paul <seanpaul@google.com>, Jingoo Han <jg1.han@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>
List-Id: devicetree@vger.kernel.org

+DT mailing list

On Fri, Jun 27, 2014 at 3:42 PM, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Set FIMD output type for smdk5420 as DP.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420-smdk5420.dts |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> index 6052aa9..5f05a19 100644
> --- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
> +++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
> @@ -120,6 +120,7 @@
>
>         fimd@14400000 {
>                 status = "okay";
> +               samsung,output-type = <2>;
>                 display-timings {
>                         native-mode = <&timing0>;
>                         timing0: timing@0 {
> --
> 1.7.9.5
>
