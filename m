From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2] clk: Move vendor's Kconfig into CCF menu section
Date: Tue, 16 Feb 2016 13:59:14 +0900
Message-ID: <CAJKOXPdA1VeGUmgAtObueXbY5S_X0acrF5m_QnEygzaMOeWPUw@mail.gmail.com>
References: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1453971537-5510-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-clk-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

2016-01-28 17:58 GMT+09:00 James Liao <jamesjj.liao@mediatek.com>:
> Move all vendor's Kconfig into CCF menu section to prevent
> new drivers putting their Kconfig files in a wrong place.
>
> Some Kconigs need to modify at the same time to avoid build
> warnings.
>
> Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> ---
> This patch is based on v4.5-rc1.
>
> changes since v1:
> - Modify s3c24xx and samsung's Kconfig to avoid build warngings.
>
>  arch/arm/mach-s3c24xx/Kconfig | 1 +
>  drivers/clk/Kconfig           | 8 +++-----
>  drivers/clk/samsung/Kconfig   | 1 -
>  3 files changed, 4 insertions(+), 6 deletions(-)
>

I wish you had used scripts/get_maintainer.pl to get list of people to CC...
Kukjin Kim <kgene@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
Krzysztof Kozlowski <k.kozlowski@samsung.com> (maintainer:ARM/SAMSUNG
EXYNOS ARM ARCHITECTURES)
linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG EXYNOS
ARM ARCHITECTURES)

Beside the fact that it is just nice and welcomed... it would help me
to avoid some of duplicated work...

Best regards,
Krzysztof
