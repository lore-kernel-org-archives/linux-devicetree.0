From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v4 2/3] clk: samsung: Don't build ARMv8 clock drivers on
 ARMv7
Date: Thu, 28 Jan 2016 16:15:34 -0300
Message-ID: <56AA68D6.50500@osg.samsung.com>
References: <1453941324-15742-1-git-send-email-k.kozlowski@samsung.com>
 <1453941324-15742-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1453941324-15742-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

On 01/27/2016 09:35 PM, Krzysztof Kozlowski wrote:
> Currently the Exynos5433 (ARMv8 SoC) clock driver depends on ARCH_EXYNOS
> so it is built also on ARMv7. This does not bring any kind of benefit.
> There won't be a single kernel image for ARMv7 and ARMv8 SoCs (like
> multi_v7 for ARMv7).
>
> Instead build clock drivers only for respective SoC's architecture.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Also checked that for example clk-exynos5433 is not built anymore for
exynos_defconfig but it is built for allyesconfig.

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
