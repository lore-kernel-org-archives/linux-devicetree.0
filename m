From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 04/15] clk: sunxi-ng: Add fixed factor clock support
Date: Mon, 20 Jun 2016 18:15:37 -0700
Message-ID: <20160621011537.GP1521@codeaurora.org>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-5-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160607204154.31967-5-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/07, Maxime Ripard wrote:
> +
> +#include <linux/clk-provider.h>
> +
> +#include "ccu_common.h"
> +
> +struct ccu_fixed_factor {
> +	u16			div;
> +	u16			mult;
> +
> +	struct ccu_common	common;

Does this use the common structure although we have no usage for
the members of struct ccu_common except struct clk_hw? I suppose
this is done so registering a bunch of clks is easy?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
