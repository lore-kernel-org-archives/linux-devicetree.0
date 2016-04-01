From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 08/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Peach Pit
Date: Fri, 1 Apr 2016 13:27:24 -0400
Message-ID: <56FEAF7C.9000502@osg.samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
 <1459493874-2366-8-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1459493874-2366-8-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

On 04/01/2016 02:57 AM, Krzysztof Kozlowski wrote:
> Fix following DTC warnings in Exynos5420 Peach Pit:
> 
> Warning (unit_address_vs_reg): Node /dp-controller@145B0000/ports/port@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@0 has a unit name, but no reg property
> Warning (unit_address_vs_reg): Node /i2c@12CD0000/lvds-bridge@48/ports/port@1 has a unit name, but no reg property
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
