From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 5/8] mfd: exynos-lpass: Remove pad retention control
Date: Thu, 26 Jan 2017 10:36:30 +0100
Message-ID: <087a0ddf-75b2-b5a9-4bd5-374ac2901676@samsung.com>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083403eucas1p2328ed884334b453ffb1faac3c745cec3@eucas1p2.samsung.com>
 <1485419634-28331-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1485419634-28331-6-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On 01/26/2017 09:33 AM, Marek Szyprowski wrote:
> Pad retention should be controlled from pin control driver, so remove it
> from Exynos LPASS driver. After this change, no more access to PMU regmap
> is needed, so remove also the code for handling PMU regmap.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Patches 5/8...8/8:

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
