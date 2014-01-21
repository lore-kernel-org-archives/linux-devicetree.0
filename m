From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 03/15] watchdog: orion: Use atomic access for shared registers
Date: Tue, 21 Jan 2014 10:54:37 +0100
Message-ID: <3381968.dYvuFs4ZXV@wuerfel>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com> <1390295561-3466-4-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390295561-3466-4-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 21 January 2014 06:12:29 Ezequiel Garcia wrote:
>         writel(~WDT_INT_REQ, BRIDGE_CAUSE);
>  
>         /* Enable watchdog timer */
> -       reg = readl(wdt_reg + TIMER_CTRL);
> -       reg |= WDT_EN;
> -       writel(reg, wdt_reg + TIMER_CTRL);
> +       atomic_io_modify(wdt_reg + TIMER_CTRL, WDT_EN, WDT_EN);

As mentioned in my comment for patch 2, it seems that the exported
orion_timer_ctrl_clrset() function would be more appropriate for this.

>         /* Enable reset on watchdog */
> -       reg = readl(RSTOUTn_MASK);
> -       reg |= WDT_RESET_OUT_EN;
> -       writel(reg, RSTOUTn_MASK);
> +       atomic_io_modify(RSTOUTn_MASK, WDT_RESET_OUT_EN, WDT_RESET_OUT_EN);

And this register already has an abstraction in
arch/arm/mach-mvebu/system-controller.c. I would prefer to find a way
to generalize that. I can see multiple ways to do that:

* Turn the "marvell,armada-370-xp-system-controller" device into a "syscon"
  device that can be used through regmap from other parts of the kernel.

* Move arch/arm/mach-mvebu/system-controller.c into drivers/soc (we don't
  have this directory yet, but have discussed it in the past) to export
  soc-specific functions from there.

* Move all of the system-controller implementation into the wdt driver
  and require that this driver be enabled in order to do regular system
  reset. The system-controller can register itself as a reboot hook,
  so you can remove the ".restart = mvebu_restart" part from mach-mvebu.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
