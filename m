From: Andrew Bresticker <abrestic@google.com>
Subject: Re: [PATCH V3 11/11] MIPS: Add multiplatform BMIPS target
Date: Mon, 24 Nov 2014 11:29:40 -0800
Message-ID: <CAL1qeaG+cmQDW3ceqq4kGgWBsf4RgfFpQ76OG0dg3SJy6nitgw@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
	<1416796846-28149-12-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416796846-28149-12-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Florian Fainelli <f.fainelli@gmail.com>, jfraser@broadcom.com, Dmitry Torokhov <dtor@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Jonas Gorski <jogo@openwrt.org>, Arnd Bergmann <arnd@arndb.de>, computersforpeace@gmail.com, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c

> +void __init plat_time_init(void)
> +{
> +       struct device_node *np;
> +       u32 freq;
> +
> +       np = of_find_node_by_name(NULL, "cpus");
> +       if (!np)
> +               panic("missing 'cpus' DT node");
> +       if (of_property_read_u32(np, "mips-hpt-frequency", &freq) < 0)
> +               panic("missing 'mips-hpt-frequency' property");
> +       of_node_put(np);
> +
> +       mips_hpt_frequency = freq;
> +}

Could you use common clock framework for this?  Isn't the HPT just a
fixed factor of the CPU clock?  I'm planning on doing something very
similar for ImgTec MIPS SoCs, so perhaps this could go in a common
place, like the r4k clocksource driver?
