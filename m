From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: exynos: Fix spelling mistake of EXYNOS5420
Date: Mon, 25 Mar 2019 17:52:33 +0100
Message-ID: <20190325165233.GA16322@kozik-lap>
References: <bb0903e066484e02f5dcd0e9cbe94a491a179fba.camel@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bb0903e066484e02f5dcd0e9cbe94a491a179fba.camel@posteo.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Drung <bdrung@posteo.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 03, 2019 at 09:13:30PM +0100, Benjamin Drung wrote:
> The SoC name EXYNOS5420 was misspelled.
> 
> Signed-off-by: Benjamin Drung <bdrung@posteo.de>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 2 +-

Sorry for late apply but you never sent it to samsung-soc maling list so
it was not present on Patchwork (and somehow slipped through my filters).

The easiest way is to use scripts/get_maintainers.pl - it will print all
necessary Cc-addresses.

Thanks, applied now.

Best regards,
Krzysztof
