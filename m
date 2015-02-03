From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 0/3] ARM: dts: Regulator changes and fuel gauge for
 exynos4412-trats2
Date: Tue, 03 Feb 2015 12:26:55 +0900
Message-ID: <059b01d03f61$4263d1c0$c72b7540$@kernel.org>
References: <1421311295-18960-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1421311295-18960-1-git-send-email-k.kozlowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Krzysztof Kozlowski' <k.kozlowski@samsung.com>, 'Kukjin Kim' <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Krzysztof Kozlowski wrote:
> 
> Hi Kukjin,
> 
Hi,

> 
> I grouped into one patchset already posted patches for Trats2 board:
> 1. Fuel gauge:
>    https://lkml.org/lkml/2015/1/7/167
> 2. Suspend configuration for max77686 regulators:
>    https://lkml.org/lkml/2014/10/29/262
> 3. GPIO control for max77686 regulators:
>    https://lkml.org/lkml/2015/1/5/230
> 
> 
> The necessary changes in max77686 regulator driver were already
> applied by Mark Brown.
> 
Sounds good.

> Best regards,
> Krzysztof
> 
> 
> Krzysztof Kozlowski (3):
>   ARM: dts: exynos4412-trats2: Add Maxim 77693 fuel gauge node
>   ARM: dts: exynos4412-trats2: Add suspend configuration for max77686
>     regulators
>   ARM: dts: exynos4412-trats: Switch max77686 regulators to GPIO control
> 
>  arch/arm/boot/dts/exynos4412-trats2.dts | 115 ++++++++++++++++++--------------
>  1 file changed, 65 insertions(+), 50 deletions(-)
> 
> --

OK, looks good to me, applied this series.

Thanks,
Kukjin
