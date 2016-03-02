From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v4 1/2] clk: add lpc18xx creg clk driver
Date: Wed, 02 Mar 2016 15:01:59 -0800
Message-ID: <20160302230159.12762.59247@quark.deferred.io>
References: <1456351460-15483-1-git-send-email-manabian@gmail.com>
 <1456351460-15483-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1456351460-15483-2-git-send-email-manabian@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Joachim,

Quoting Joachim Eastwood (2016-02-24 14:04:19)
> +static struct clk *clk_register_creg_clk(struct clk_creg_data *creg_clk,
> +                                        const char **parent_name,
> +                                        struct regmap *syscon)
> +{
> +       struct clk_init_data init;
> +
> +       init.ops = creg_clk->ops;
> +       init.name = creg_clk->name;
> +       init.parent_names = parent_name;
> +       init.num_parents = 1;
> +
> +       creg_clk->reg = syscon;
> +       creg_clk->hw.init = &init;
> +
> +       return clk_register(NULL, &creg_clk->hw);

This should be devm_clk_register with your struct device *dev passed
into it.

Otherwise this patch looks good for merge.

Regards,
Mike
