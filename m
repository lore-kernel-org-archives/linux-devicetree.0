From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V3 4/4] clocksource: mips-gic: Add device-tree support
Date: Wed, 29 Oct 2014 17:51:42 +0000
Message-ID: <20141029175142.GC26471@leverpostej>
References: <1414541562-10076-1-git-send-email-abrestic@chromium.org>
 <1414541562-10076-5-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1414541562-10076-5-git-send-email-abrestic@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Qais Yousef <qais.yousef@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 29, 2014 at 12:12:42AM +0000, Andrew Bresticker wrote:
> Parse the GIC timer frequency and interrupt from the device-tree.
> 
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> ---
> New for v3.
> ---
>  drivers/clocksource/Kconfig          |  1 +
>  drivers/clocksource/mips-gic-timer.c | 37 +++++++++++++++++++++++++++++-------
>  2 files changed, 31 insertions(+), 7 deletions(-)
> 

[...]

> +static void __init gic_clocksource_of_init(struct device_node *node)
> +{
> +	if (of_property_read_u32(node, "clock-frequency", &gic_frequency)) {
> +		pr_err("GIC frequency not specified.\n");
> +		return;
> +	}
> +	gic_timer_irq = irq_of_parse_and_map(node, 0);
> +	if (!gic_timer_irq) {
> +		pr_err("GIC timer IRQ not specified.\n");
> +		return;
> +	}
> +
> +	__gic_clocksource_init();
> +}
> +CLOCKSOURCE_OF_DECLARE(mips_gic_timer, "mti,interaptiv-gic-timer",
> +		       gic_clocksource_of_init);

Your binding document expected the timer node under the GIC node, and it
looks like this relies on GIC internals. Hwoever, this allows for people
to put the timer node anywhere (and it turns out people are _really_ bad
at putting things together as the binding author expected).

It might be better if the GIC driver detected the sub node and probed
the clocksource driver (or registered a platform device that the
clocksource driver gets registered from). that could prevent some
horrible issues with probe ordering and/or bad dts.

Mark.
