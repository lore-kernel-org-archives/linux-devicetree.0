From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 4/7] ARM: dts: exynos: Use human-friendly symbols for
 interrupt properties in exynos5
Date: Sun, 18 Sep 2016 11:20:43 -0400
Message-ID: <f16ace70-f391-39fb-c8ee-ffbacb52f1ea@osg.samsung.com>
References: <1474062122-22720-1-git-send-email-krzk@kernel.org>
 <1474062122-22720-5-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1474062122-22720-5-git-send-email-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

On 09/16/2016 05:41 PM, Krzysztof Kozlowski wrote:
> Replace hard-coded values of type of GIC interrupt and its flags with
> respective macros from header to increase code readability
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

On an Exynos5800 Peach Pi Chromebook and an Exynos5422 Odroid XU4 board:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
