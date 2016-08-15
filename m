From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH V3 2/4] clk: Combine DT binding doc for max77686 and
 max77802
Date: Mon, 15 Aug 2016 15:40:22 -0700
Message-ID: <20160815224022.GP361@codeaurora.org>
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
 <1466160667-28451-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466160667-28451-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>
List-Id: devicetree@vger.kernel.org

On 06/17, Laxman Dewangan wrote:
> The clock IP used on the Maxim PMICs max77686 and max77802 are
> same. The configuration of clock register is also same except
> the number of clocks.
> 
> Define the common DT binding file for the clocks of Maxim PMICs
> MAX77686 and MAX77802. For this, remove the separate DT binding
> document file for maxim,max77802 and move all information to
> maxim,max77686 DT binding document.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
