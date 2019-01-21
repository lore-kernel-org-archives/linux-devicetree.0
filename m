Return-Path: <robherring2@gmail.com>
Date: Mon, 21 Jan 2019 08:51:32 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Message-ID: <20190121145132.GA19195@bogus>
References: <CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
 <20190118131639.17578-1-k.konieczny@partner.samsung.com>
 <20190118131639.17578-5-k.konieczny@partner.samsung.com>
 <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGTfZH1K-f9kxVourd_-hfDoLXsjyrCL+5FLDycsR4kRG9mpGg@mail.gmail.com>
To: Chanwoo Choi <cwchoi00@gmail.com>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree <devicetree@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Jan 19, 2019 at 09:40:10PM +0900, Chanwoo Choi wrote:
> Hi Kamil,
> 
> This version only adds following two clocks without that other clocks
> be included in imem block.
> - CLK_ACLK_SLIMSSS
> - CLK_PCLK_SLIMSSS
> 
> Usually, the users only refer to
> 'include/dt-bindings/clock/exynos5433.h' in order to get the supported
> clocks. It means that if there are different between the clock list in
> 'include/dt-bindings/clock/exynos5433.h' and the supported clock list
> of drivers/clock/', it make the confusion for users. So,
> 'include/dt-bindings/clock/exynos5433.h' have to define the only
> supported clock ids.
> 
> Please remove other clock ids except for CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS.

And add clocks 1-by-1 instead? The binding headers are a pain to merge 
because they are a dts and driver dependency. Having a complete header 
is preferred unless there is doubt in the correctness of it.

The driver can warn users about unsupported IDs.

Rob
