From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] .gitattributes: Use 'dts' diff driver for dts files
Date: Fri, 4 Oct 2019 15:08:08 -0700
Message-ID: <256a1ad3-6a0c-b4bd-e12c-9ab35db2939a@infradead.org>
References: <20191004212311.141538-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004212311.141538-1-swboyd@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/4/19 2:23 PM, Stephen Boyd wrote:
> Git is gaining support to display the closest node to the diff in the
> hunk header via the 'dts' diff driver. Use that driver for all dts and
> dtsi files so we can gain some more context on where the diff is. Taking
> a recent commit in the kernel dts files you can see the difference.
> 
> With this patch and an updated git
> 
>  diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  index 62e07e1197cc..4c38426a6969 100644
>  --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  @@ -289,5 +289,29 @@ vdd_hdmi: regulator@1 {
>                          gpio = <&gpio TEGRA194_MAIN_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
>                          enable-active-high;
>                  };
>  +
>  +               vdd_3v3_pcie: regulator@2 {
>  +                       compatible = "regulator-fixed";
> 
> vs. without this patch
> 
>  diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  index 62e07e1197cc..4c38426a6969 100644
>  --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
>  @@ -289,5 +289,29 @@
>                          gpio = <&gpio TEGRA194_MAIN_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
>                          enable-active-high;
>                  };
>  +
>  +               vdd_3v3_pcie: regulator@2 {
>  +                       compatible = "regulator-fixed";
> 
> You can see that we don't know what the context node is because it isn't shown
> after the '@@'.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: <devicetree@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> Sending to Andrew but I suppose it can go through dt tree too.
> 
>  .gitattributes | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.gitattributes b/.gitattributes
> index 89c411b5ce6b..4b32eaa9571e 100644
> --- a/.gitattributes
> +++ b/.gitattributes
> @@ -1,2 +1,4 @@
>  *.c   diff=cpp
>  *.h   diff=cpp
> +*.dtsi diff=dts
> +*.dts  diff=dts
> 

Hm, I have a "cpp" installed but not a "dts".
Where would I find this "dts" so that I can install it?

Thanks.
-- 
~Randy
