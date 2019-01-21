Return-Path: <SRS0=3v29=P5=partner.samsung.com=k.konieczny@kernel.org>
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Message-ID: <3ca730b9-3cad-4e98-1e3b-19aca71863d5@partner.samsung.com>
Date: Mon, 21 Jan 2019 09:08:30 +0100
MIME-Version: 1.0
In-Reply-To: <20181213211009.GA5444@kozik-lap>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
	<CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
	<20181204165248.17572-5-k.konieczny@partner.samsung.com>
	<20181213211009.GA5444@kozik-lap>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On 13.12.2018 22:10, Krzysztof Kozlowski wrote:
> On Tue, Dec 04, 2018 at 05:52:47PM +0100, Kamil Konieczny wrote:
>> Add description for imem clock in the Samsung Exynos5433. The users can use
>> compatibility "samsung,exynos5433-cmu-imem".
> 
> Thanks, applied but the commit message above is not matching contents at all.
> You did not add the description. Mentioning some users and compatibility
> also seems unrelated. Instead:
> 1. You added DT node for IMEM clock controller on Exynos5433.
> 2. Because it is necessary for SSS to work (beside obvious reasons: for
>    DTS completeness and allowing to gate them when not used).
> Also, please use SoC name in commit title (for example at the end) to
> differentiate from Exynos7 or any other future SoCs.

Thank you for your work and insightfull comments, I hope to improve my
commit messages.

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
