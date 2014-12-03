From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 06/12] ARM: imx: add support for MSCM interrupt router
Date: Wed, 03 Dec 2014 11:51:09 +0100
Message-ID: <2336832.xq32rHipj9@wuerfel>
References: <1417565531-4507-1-git-send-email-stefan@agner.ch> <1417565531-4507-7-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417565531-4507-7-git-send-email-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Stefan Agner <stefan@agner.ch>, shawn.guo@linaro.org, kernel@pengutronix.de, linux@arm.linux.org.uk, u.kleine-koenig@pengutronix.de, jason@lakedaemon.net, olof@lixom.net, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 03 December 2014 01:12:05 Stefan Agner wrote:
> +
> +static int vf610_mscm_domain_xlate(struct irq_domain *d,
> +				struct device_node *controller,
> +				const u32 *intspec, unsigned int intsize,
> +				unsigned long *out_hwirq,
> +				unsigned int *out_type)
> +{
> +#ifdef CONFIG_ARM_GIC
> +	*out_hwirq += 16;
> +#endif
> +	return 0;
> +}

I don't see how the hwirq should in any way depend on whether the
kernel also supports an ARM_GIC. This number should only be meaningful
inside of your irqchip driver.

	Arnd
