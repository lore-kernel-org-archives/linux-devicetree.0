From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] ARM: pxa: add pxa25x device-tree support
Date: Sun, 17 Apr 2016 17:24:12 +0200
Message-ID: <5954693.SgGqqDgWJO@wuerfel>
References: <1460316600-15978-1-git-send-email-robert.jarzmik@free.fr> <1460316600-15978-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460316600-15978-2-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sunday 10 April 2016 21:29:59 Robert Jarzmik wrote:
> +
> +DT_MACHINE_START(PXA_DT, "Marvell PXA3xx (Device Tree Support)")
> +       .map_io         = pxa3xx_map_io,
> +       .init_irq       = pxa3xx_dt_init_irq,
> +       .handle_irq     = pxa3xx_handle_irq,
> +       .restart        = pxa_restart,
> +       .dt_compat      = pxa3xx_dt_board_compat,
> +MACHINE_END
> 

Nothing wrong with your series, it's a straightforward continuation of what
you have for the other platforms, but I have a few comments on the method
overall, and it might be good if you could work on improving those next,
basically eliminating most of the machine descriptor contents in the long
run:

- It would be nice not to call map_io() at all and instead ensure that all
  drivers that have DT bindings use ioremap. The main reason for this is
  that relying on the hardwired mapping makes it easy to get things wrong
  in the bindings, by leaving out required memory ranges.

- The init_irq()/handle_irq() callbacks can probably be replaced with
  a IRQCHIP_DECLARE() statement per irqchip variant, which then goes
  on to initialize the controller and set the handler.

- The restart method is the least important here, but I guess we can
  convert that into a driver, or use an existing one from DT, like
  drivers/power/reset/gpio-restart.c

	Arnd
