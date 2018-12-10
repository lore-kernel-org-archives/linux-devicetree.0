Return-Path: <robherring2@gmail.com>
Date: Mon, 10 Dec 2018 16:29:37 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] clk: samsung: exynos5433: fix name typo in sssx
Message-ID: <20181210222937.GA9739@bogus>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165316eucas1p2ba063b96e83d2d2be93ca067d32d7926@eucas1p2.samsung.com>
 <20181204165248.17572-3-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-3-k.konieczny@partner.samsung.com>
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 04, 2018 at 05:52:45PM +0100, Kamil Konieczny wrote:
> Fix typo in sssx name, there should be three letters 's'.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c   | 2 +-
>  include/dt-bindings/clock/exynos5433.h | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 2 insertions(+), 2 deletions(-)
