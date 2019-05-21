Return-Path: <SRS0=epcn=TV=google.com=bhelgaas@kernel.org>
MIME-Version: 1.0
References: <20190521130357.20803-1-miquel.raynal@bootlin.com> <20190521130357.20803-3-miquel.raynal@bootlin.com>
In-Reply-To: <20190521130357.20803-3-miquel.raynal@bootlin.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 21 May 2019 17:43:05 -0500
Message-ID: <CAErSpo5i3y4CxZXV7E4tUR66uXaUa3B_-YT2+zfzZUGMmge7Ow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: mvebu: armada-37xx-periph: change
 suspend/resume time
Content-Type: text/plain; charset="UTF-8"
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Linux PM list <linux-pm@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, May 21, 2019 at 8:04 AM
To: Michael Turquette, Stephen Boyd, Rob Herring, Mark Rutland
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>, Thomas
Petazzoni, Antoine Tenart, Gregory Clement, Maxime Chevallier, Nadav
Haklai, Bjorn Helgaas, Rafael J . Wysocki, <linux-pm@vger.kernel.org>,
Miquel Raynal

> Armada 3700 PCIe IP relies on the PCIe clock managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().

"For reasons related to the PCI core's organization" manages to
suggest that this change wouldn't be needed if only the PCI core did
something differently, without actually being specific about what it
would need to do differently.

Is there something the PCI core could do better to make this easier?
Or is it just something like "the PCI core needs to access registers
after suspend_late()"?  You mention the host controller, but of course
that's not itself a PCI device, so the PCI core doesn't have much to
do with it directly.

s/register/registers/ ?

> Device link support in the clock framework enforce that the clock
> driver's resume() callback will be called before the PCIe
> driver's. But, any resume_noirq() callback will be called before all
> the registered resume() callbacks.
>
> The solution to support PCIe resume operation is to change the
> "priority" of this clock driver PM callbacks to "_noirq()".
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/mvebu/armada-37xx-periph.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index 1e18c5a875bd..bee45e43a85f 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -715,8 +715,8 @@ static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
>  }
>
>  static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
> -                               armada_3700_periph_clock_resume)
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
> +                                     armada_3700_periph_clock_resume)
>  };
>
>  static int armada_3700_periph_clock_probe(struct platform_device *pdev)
> --
> 2.19.1
>
