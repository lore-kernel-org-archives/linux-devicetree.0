From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v8 01/11] ARM: brcmstb: add infrastructure for
	ARM-based Broadcom STB SoCs
Date: Wed, 30 Jul 2014 10:26:35 +0100
Message-ID: <20140730092635.GI30282@n2100.arm.linux.org.uk>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com> <1405976886-27807-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405976886-27807-2-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Matt Porter <mporter@linaro.org>, Christian Daudt <bcm@fixthebug.org>, linux-arm-kernel@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Gregory Fong <gregory.0xf0@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Marc Carino <marc.ceeeee@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 21, 2014 at 02:07:56PM -0700, Brian Norris wrote:
> +static DEFINE_SPINLOCK(boot_lock);
> +
> +static void brcmstb_secondary_init(unsigned int cpu)
> +{
> +	/*
> +	 * Synchronise with the boot thread.
> +	 */
> +	spin_lock(&boot_lock);
> +	spin_unlock(&boot_lock);
> +}
> +
> +static int brcmstb_boot_secondary(unsigned int cpu, struct task_struct *idle)
> +{
> +	/*
> +	 * set synchronisation state between this boot processor
> +	 * and the secondary one
> +	 */
> +	spin_lock(&boot_lock);
> +
> +	/* Bring up power to the core if necessary */
> +	if (brcmstb_cpu_get_power_state(cpu) == 0)
> +		brcmstb_cpu_power_on(cpu);
> +
> +	brcmstb_cpu_boot(cpu);
> +
> +	/*
> +	 * now the secondary core is starting up let it run its
> +	 * calibrations, then wait for it to finish
> +	 */
> +	spin_unlock(&boot_lock);

I've just read through this code (because it caused my allmodconfig to
break) and spotted this.

What function does boot_lock perform here?  Please, don't quote the
comments (I know where the comments came from) but what I want to hear
is your comments about why you decided to retain this.

-- 
FTTC broadband for 0.8mile line: currently at 9.5Mbps down 400kbps up
according to speedtest.net.
