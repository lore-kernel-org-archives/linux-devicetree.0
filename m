From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3 v2] clk: versatile add DT bindings for the ICST CM
 variants
Date: Thu, 25 Aug 2016 13:06:37 -0700
Message-ID: <20160825200637.GR19826@codeaurora.org>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

On 08/22, Linus Walleij wrote:
> The Integrator/AP and Integrator/CP core modules have special
> versions of the ICST525 interface hardcoding some bits. Create
> special compatible strings to identify these variants, also
> explain a bit what is going on.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
