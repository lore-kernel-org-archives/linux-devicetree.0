From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: Add basic PM domains for EXYNOS5420
Date: Mon, 29 Jul 2013 23:37:29 +0200
Message-ID: <1493568.OBNYHLtNGp@thinkpad>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org> <1375105771-8106-4-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1375105771-8106-4-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Hi Vikas, Yadwinder,

Please see my comments inline.

On Monday 29 of July 2013 19:19:27 Vikas Sajjan wrote:
> From: Yadwinder Singh Brar <yadi.brar@samsung.com>
> 
> Add DT nodes for gsc, isp, mfc, disp, mau, g2d and msc PM domains.
> 
> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi |   35
> +++++++++++++++++++++++++++++++++++ 1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi
> b/arch/arm/boot/dts/exynos5420.dtsi index 8c54c4b..bd6b310 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -90,6 +90,41 @@
>  		};
>  	};
> 
> +	gsc_pd: pd@10044000 {

Please use power-domain for node names. We might have "pd" for other Exynos 
SoCs, but this needs to be fixed.

Best regards,
Tomasz
