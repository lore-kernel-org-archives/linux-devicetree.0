From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 6/6] ARM: dts: exynos: No need to enable TMU nodes on
 Odroid XU3 family
Date: Tue, 31 May 2016 15:37:28 -0400
Message-ID: <c3222e0a-51a9-a93f-97e4-9a12e17167de@osg.samsung.com>
References: <1464719945-3417-1-git-send-email-krzk@kernel.org>
 <1464719945-3417-6-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1464719945-3417-6-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

On 05/31/2016 02:39 PM, Krzysztof Kozlowski wrote:
> The thermal nodes are not disabled in exynos5420.dtsi so there is no
> need to manually enable them on Odroid XU3/XU3-Lite/XU4 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
