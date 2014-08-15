From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/5] ARM: BCM63XX: add basic support for the Broadcom BCM63138 DSL SoC
Date: Fri, 15 Aug 2014 09:01:50 +0200
Message-ID: <3533813.fmr1R5OBqN@wuerfel>
References: <1408061487-20984-1-git-send-email-f.fainelli@gmail.com> <1408061487-20984-2-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408061487-20984-2-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 August 2014 17:11:23 Florian Fainelli wrote:
> +static void __init bcm63xx_init(void)
> +{
> +       of_platform_populate(NULL, of_default_bus_match_table, NULL,
> +               &platform_bus);
> +       l2x0_of_init(0, ~0);
> +}
> +
> +static const char * const bcm63xx_dt_compat[] = {
> +       "brcm,bcm63138",
> +       NULL
> +};
> +
> +DT_MACHINE_START(BCM63XXX_DT, "BCM63xx DSL SoC")
> +       .init_machine   = bcm63xx_init,
> +       .dt_compat      = bcm63xx_dt_compat,
> +MACHINE_END
> 

You should be able to remove that bcm63xx_init() function if you add
the l2c_aux_val/l2c_aux_mask settings in the machine descriptor
instead.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
