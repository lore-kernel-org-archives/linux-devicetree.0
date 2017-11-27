From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: exynos: Switch to dedicated Odroid-XU3
 sound card binding
Date: Mon, 27 Nov 2017 19:12:13 +0100
Message-ID: <20171127181213.lxtbbiw75wbz2dbz@kozik-lap>
References: <20171103165446.15438-1-s.nawrocki@samsung.com>
 <CGME20171103165539epcas1p48cc87811574dace9dfe91d8e9ec6f7ca@epcas1p4.samsung.com>
 <20171103165446.15438-2-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171103165446.15438-2-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, mihailescu2m@gmail.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 03, 2017 at 05:54:45PM +0100, Sylwester Nawrocki wrote:
> The new sound card DT binding is used for Odroid XU3 in order
> to properly support the HDMI audio path.
> Clocks configuration is changed so the I2S controller is now the bit
> and the frame clock master with EPLL as the root clock source.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi                    |  1 +
>  arch/arm/boot/dts/exynos5420.dtsi                 |  1 +
>  arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 60 ++++++++++++++---------
>  3 files changed, 40 insertions(+), 22 deletions(-)
> 

Thanks, applied both.

Best regards,
Krzysztof
