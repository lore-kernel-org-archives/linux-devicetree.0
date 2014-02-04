From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Tue, 4 Feb 2014 17:24:37 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1402041715220.24986@ionos.tec.linutronix.de>
References: <1391513453-21140-1-git-send-email-ivan.khoronzhuk@ti.com> <1391513453-21140-2-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1391513453-21140-2-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: santosh.shilimkar@ti.com, rob@landley.net, linux@arm.linux.org.uk, galak@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, 4 Feb 2014, Ivan Khoronzhuk wrote:
> +	keystone_timer_writel(off, TCR);
> +	/* here we have to be sure the timer has been disabled */
> +	wmb();

We have explicit writew_relaxed and writew. Why open coding the
barriers?

Thanks,

	tglx
