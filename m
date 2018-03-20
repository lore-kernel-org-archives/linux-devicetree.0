From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 13/42] clk: davinci: Add platform information for TI DM355 PSC
Date: Tue, 20 Mar 2018 09:58:07 -0700
Message-ID: <152156508760.183971.11983086334390852576@swboyd.mtv.corp.google.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-14-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521168778-27236-14-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

Quoting David Lechner (2018-03-15 19:52:29)
> +static int dm355_psc_init(struct device *dev, void __iomem *base)
> +{
> +       return davinci_psc_register_clocks(base, dm355_psc_info, 42, base);
> +}
> +

Should be dev for that first argument to davinci_psc_register_clocks()?

I squashed this in:

diff --git a/drivers/clk/davinci/psc-dm355.c b/drivers/clk/davinci/psc-dm355.c
index 249a05330457..6995ecea2677 100644
--- a/drivers/clk/davinci/psc-dm355.c
+++ b/drivers/clk/davinci/psc-dm355.c
@@ -70,7 +70,7 @@ static const struct davinci_lpsc_clk_info dm355_psc_info[] = {
 
 static int dm355_psc_init(struct device *dev, void __iomem *base)
 {
-	return davinci_psc_register_clocks(base, dm355_psc_info, 42, base);
+	return davinci_psc_register_clocks(dev, dm355_psc_info, 42, base);
 }
 
 static struct clk_bulk_data dm355_psc_parent_clks[] = {
