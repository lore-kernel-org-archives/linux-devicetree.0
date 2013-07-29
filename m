From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: Update FIMD DT node for Exynos5 SoCs
Date: Mon, 29 Jul 2013 14:34:53 -0700 (PDT)
Message-ID: <4058541.XvOrGlbWoB@thinkpad>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org> <1375105771-8106-3-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1375105771-8106-3-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Hi Vikas,

Please see my comment inline.

On Monday 29 of July 2013 19:19:26 Vikas Sajjan wrote:
> Moves the properties of FIMD DT node which are common across Exynos5 based
> SoCs like Exynos5250 and Exxynos5420 to exynos5.dtsi
> 
> Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> ---
>  arch/arm/boot/dts/exynos5.dtsi    |   10 ++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi |    6 +-----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index f65e124..80a4630 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -108,4 +108,14 @@
>  		interrupts = <0 42 0>;
>  		status = "disabled";
>  	};
> +
> +	fimd {

I don't know why this node was named incorrectly in original file (probably the 
patch adding it did not have enough review), but if you are modifying it 
anyway, could you fix it to be conformant to DT conventions?

Whenever there is a reg property inside a node, the node should be named 
whatever@addr, where addr is comma separated list of addresses specified in reg 
property, in hex, without "0x" prefix.

So in this case this should be at least

	fimd@14400000

but ideally

	display-controller@14400000

as nodes should have generic names (see ePAPR, paragraph 2.2.2).

Best regards,
Tomasz
