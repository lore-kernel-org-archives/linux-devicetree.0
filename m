From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: exynos: Add dts file for
 Exynos5433-based TM2 board
Date: Fri, 26 Aug 2016 14:35:20 -0400
Message-ID: <f6b8a04e-0bb0-59d8-55c7-7aa04d284e48@osg.samsung.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-7-git-send-email-cw00.choi@samsung.com>
 <0a6dffe0-8508-724e-c831-d14c32f8cd64@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <0a6dffe0-8508-724e-c831-d14c32f8cd64@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, k.kozlowski@samsung.com, kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krzk@kernel.org, jh80.chung@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, inki.dae@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@samsung.com, ideal.song@samsung.com, ingi2.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com, s.nawrocki@samsung.com, chanwoo@kernel.org
List-Id: devicetree@vger.kernel.org

On 08/26/2016 02:30 PM, Javier Martinez Canillas wrote:

[snip]

>> +
>> +			buck3_reg: BUCK3 {
>> +				regulator-name = "VDD_KFC_1.0V_AP";
> 
> Same, maybe using "VDD_APL_1.0V_AP" since the big cluster is Apollo?
> 

I meant s/big/LITTLE here of course, sorry for the typo.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
