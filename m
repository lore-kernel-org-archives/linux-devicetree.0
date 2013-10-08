From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCHv7 20/36] CLK: TI: DRA7: Add APLL support
Date: Mon, 07 Oct 2013 22:16:24 -0700
Message-ID: <20131008051624.7445.56807@quantum>
References: <1380098922-30340-1-git-send-email-t-kristo@ti.com>
 <1380098922-30340-21-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1380098922-30340-21-git-send-email-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org, paul@pwsan.com, tony@atomide.com, nm@ti.com, rnayak@ti.com, bcousson@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Keerthy <j-keerthy@ti.com>
List-Id: devicetree@vger.kernel.org

Quoting Tero Kristo (2013-09-25 01:48:26)
> +
> +static const struct clk_ops apll_ck_ops = {
> +       .enable         = &dra7_apll_enable,
> +       .disable        = &dra7_apll_disable,

Looks like .is_enabled is missing?

Also have you thought about using .prepare or .unprepare for these PLLs
which might take some time to lock? The code there doesn't sleep or
schedule, but it does poll for some time while under a spinlock.
Something to think about for a future patch.

Regards,
Mike
