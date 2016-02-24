From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 1/2] clk: add lpc18xx creg clk driver
Date: Wed, 24 Feb 2016 13:05:53 -0800
Message-ID: <20160224210553.2278.56679@quark.deferred.io>
References: <1455994417-4471-1-git-send-email-manabian@gmail.com>
 <1455994417-4471-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1455994417-4471-2-git-send-email-manabian@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Joachim Eastwood (2016-02-20 10:53:36)
> +static const struct clk_ops clk_creg_32k = {
> +       .enable         = clk_creg_enable,
> +       .disable        = clk_creg_disable,

There should be a .is_enabled here.

> +       .prepare        = clk_creg_32k_prepare,
> +       .unprepare      = clk_creg_32k_unprepare,
> +       .is_prepared    = clk_creg_32k_is_prepared,
> +};
> +
> +static const struct clk_ops clk_creg_1k = {
> +       .enable         = clk_creg_enable,
> +       .disable        = clk_creg_disable,

Ditto.

Otherwise patch looks good to me. Thanks a lot for all of the rework.

Regards,
Mike
