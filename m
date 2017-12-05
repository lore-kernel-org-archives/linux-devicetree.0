From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH net-next v3 3/4] net: phy: smsc: LAN8710/20: add
 PHY_RST_AFTER_CLK_EN flag
Date: Tue, 5 Dec 2017 18:35:51 +0100
Message-ID: <20171205173551.GO12805@lunn.ch>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-4-dev@g0hl1n.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205132600.13796-4-dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, fugang.duan-3arQi8VN3Tc@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lukma-ynQEQJNshbs@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 05, 2017 at 02:25:59PM +0100, Richard Leitner wrote:
> From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
> 
> The Microchip/SMSC LAN8710/LAN8720 PHYs need (according to their
> datasheet [1]) a continuous REF_CLK when configured to "REF_CLK In Mode".
> Therefore set the PHY_RST_AFTER_CLK_EN flag for those PHYs to let the
> ETH driver reset them after the REF_CLK is enabled.
> 
> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00002165B.pdf
> 
> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
