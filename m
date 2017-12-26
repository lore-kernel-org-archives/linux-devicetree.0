From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH net-next v7 2/2] net: ethernet: socionext: add AVE
 ethernet driver
Date: Tue, 26 Dec 2017 12:58:15 -0500 (EST)
Message-ID: <20171226.125815.447371237720916939.davem@davemloft.net>
References: <1513854776-4149-1-git-send-email-hayashi.kunihiko@socionext.com>
        <1513854776-4149-3-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513854776-4149-3-git-send-email-hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Date: Thu, 21 Dec 2017 20:12:56 +0900

> +	writel(AVE_TXDC_ADDR_START
> +		| (((priv->tx.ndesc * priv->desc_size) << 16) & AVE_TXDC_SIZE),
> +		priv->base + AVE_TXDC);
...
> +	writel(AVE_RXDC0_ADDR_START
> +	       | (((priv->rx.ndesc * priv->desc_size) << 16) & AVE_RXDC0_SIZE),
> +	       priv->base + AVE_RXDC0);
 ...
> +	cmdsts = AVE_STS_OWN | AVE_STS_1ST | AVE_STS_LAST
> +		| (skb->len & AVE_STS_PKTLEN_TX_MASK);

Please do not begin lines with operators, instead put them at the end
of the previous line, f.e.:

	cmdsts = AVE_STS_OWN | AVE_STS_1ST | AVE_STS_LAST |
		 (skb->len & AVE_STS_PKTLEN_TX_MASK);

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
