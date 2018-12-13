Return-Path: <SRS0=AqIb=OW=gmail.com=k.kozlowski.k@kernel.org>
Date: Thu, 13 Dec 2018 22:10:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
Message-ID: <20181213211009.GA5444@kozik-lap>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
 <CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
 <20181204165248.17572-5-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181204165248.17572-5-k.konieczny@partner.samsung.com>
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 04, 2018 at 05:52:47PM +0100, Kamil Konieczny wrote:
> Add description for imem clock in the Samsung Exynos5433. The users can use
> compatibility "samsung,exynos5433-cmu-imem".

Thanks, applied but the commit message above is not matching contents at all.
You did not add the description. Mentioning some users and compatibility
also seems unrelated. Instead:
1. You added DT node for IMEM clock controller on Exynos5433.
2. Because it is necessary for SSS to work (beside obvious reasons: for
   DTS completeness and allowing to gate them when not used).
Also, please use SoC name in commit title (for example at the end) to
differentiate from Exynos7 or any other future SoCs.

Best regards,
Krzysztof
