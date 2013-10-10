From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: phandle entries will be applied sequentially
Date: Thu, 10 Oct 2013 16:08:39 +0800
Message-ID: <20131010080837.GB29191@S2101-09.ap.freescale.net>
References: <1381297324-19006-1-git-send-email-shawn.guo@linaro.org>
 <CACRpkdazPK6SNg9PdWCrjB8nwho1rCueumJWAN=STXdN1zNnMA@mail.gmail.com>
 <20131009124425.GG25034@n2100.arm.linux.org.uk>
 <CACRpkda3J4cCTnFaQFrmZ=box6EeJ8WQZpuQpi2p_BFX+W2vuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda3J4cCTnFaQFrmZ=box6EeJ8WQZpuQpi2p_BFX+W2vuw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 03:09:21PM +0200, Linus Walleij wrote:
> When I look at the i.MX driver (I guess this is what Shawn
> is working on here) it can actually be augmented to do it
> the same way and avoid this mess altogether:
> 
>        for (i = 0; i < num_configs; i++) {
>                 if (info->flags & SHARE_MUX_CONF_REG) {
>                         u32 reg;
>                         reg = readl(ipctl->base + pin_reg->conf_reg);
>                         reg &= ~0xffff;
>                         reg |= configs[i];
>                         writel(reg, ipctl->base + pin_reg->conf_reg);
>                 } else {
>                         writel(configs[i], ipctl->base + pin_reg->conf_reg);
>                 }
>                 dev_dbg(ipctl->dev, "write: offset 0x%x val 0x%lx\n",
>                         pin_reg->conf_reg, configs[i]);
>         } /* for each config */
> 
> As can be seen it will just writel() the config into the register
> for each config, it seems more like there is a bug that also
> the else-clause here should be read-modify-write, or am
> I getting it all wrong?

On imx, num_configs is always 1 (new_map[j].data.configs.num_configs
is hard-coded as 1 in imx_dt_node_to_map() function).  We have all
configs for given pin encoded in the last integer of fsl,pin entry.
And this integer can be directly written into conf_reg.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
