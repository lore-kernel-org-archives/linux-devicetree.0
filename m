From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: dts: Make CPU configuration more readable for
 exynos542x/5800
Date: Fri, 11 Dec 2015 15:24:55 +0900
Message-ID: <566A6C37.30603@samsung.com>
References: <1449814657-25685-1-git-send-email-k.kozlowski@samsung.com>
 <20151211062143.GT3612@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <20151211062143.GT3612@ubuntu>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chanho Park <parkch98@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On 11.12.2015 15:21, Viresh Kumar wrote:
> On 11-12-15, 15:17, Krzysztof Kozlowski wrote:
>> Exynos5420 and Exynos5800 boards boot from big core (A15) but
>> Exynos5420 boards choose otherwise: LITTLE core (A7) (on Exynos5422 this
> 
> s/Exynos5420/Exynos5422

Damn, one can get confused.

Thanks for review!
Krzysztof

> and then you can add
> 
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
