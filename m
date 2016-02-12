From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [RFC v5 01/15] WIP: clk: add Atheros AR933X SoCs clock driver
Date: Thu, 11 Feb 2016 18:21:24 -0800
Message-ID: <20160212022124.3210.30707@quark.deferred.io>
References: <1455005641-7079-1-git-send-email-antonynpavlov@gmail.com>
 <1455005641-7079-2-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455005641-7079-2-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Antony Pavlov <antonynpavlov@gmail.com>, linux-mips@linux-mips.org
Cc: Marek Vasut <marex@denx.de>, Wills Wang <wills.wang@live.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, Alban Bedel <albeu@free.fr>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Paul Burton <paul.burton@imgtec.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Antony Pavlov (2016-02-09 00:13:47)
> +static void __init ar9130_init(struct device_node *np)
> +{
> +       int retval;
> +       struct ath79_cblk *cblk;
> +
> +       cblk = ath79_cblk_new(ar9331_clocks, ARRAY_SIZE(ar9331_clocks), np);
> +       if (!cblk) {
> +               pr_err("%s: failed to initialise clk block\n", __func__);
> +               return;
> +       }
> +
> +       retval = ath79_cblk_register_clocks(cblk);
> +       if (retval)
> +               pr_err("%s: failed to register clocks\n", __func__);
> +}
> +CLK_OF_DECLARE(ar933x_clk, "qca,ar9330-pll", ar9130_init);

Is there any reason this isn't a platform_driver?

Thanks,
Mike
