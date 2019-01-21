Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 08:52:06 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Message-ID: <20190121145206.GA7197@bogus>
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
 <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
 <20190118131639.17578-5-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118131639.17578-5-k.konieczny@partner.samsung.com>
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, 18 Jan 2019 14:16:38 +0100, Kamil Konieczny wrote:
> Add DT bindings to describe imem clocks for SSS (Security SubSystem) and
> SlimSSS in Exynos5433.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5433.h | 55 ++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
