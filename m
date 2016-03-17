From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB PHY
Date: Thu, 17 Mar 2016 15:38:57 +0300
Message-ID: <56EAA561.8010408@cogentembedded.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458181615-27782-7-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/17/2016 5:26 AM, David Lechner wrote:

> This is a new phy driver for the SoC USB controllers on the TI DA8XX

    DA8xx, please.

> family of microcontrollers. The USB 1.1 PHY is just a simple on/off.
> The USB 2.0 PHY also allows overriding the VBUS and ID pins.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
[...]

> diff --git a/drivers/phy/phy-da8xx-usb.c b/drivers/phy/phy-da8xx-usb.c
> new file mode 100644
> index 0000000..93a5f4d
> --- /dev/null
> +++ b/drivers/phy/phy-da8xx-usb.c
> @@ -0,0 +1,295 @@
[...]
> +static inline u32 da8xx_usbphy_readl(void __iomem *base)
> +{
> +	return readl(base);
> +}
> +
> +static inline void da8xx_usbphy_writel(void __iomem *base, u32 value)
> +{
> +	writel(value, base);

    Why wrap them at all?

> +}
> +
> +static int da8xx_usb11_phy_init(struct phy *phy)
> +{
> +	struct da8xx_usbphy *d_phy = phy_get_drvdata(phy);
> +	int ret;
> +	u32 val;
> +
> +	ret = clk_prepare_enable(d_phy->usb11_clk);
> +	if (ret)
> +		return ret;
> +
> +	val = da8xx_usbphy_readl(d_phy->phy_ctrl);
> +	val |= USB1SUSPENDM;
> +	da8xx_usbphy_writel(d_phy->phy_ctrl, val);

    Hum, I'd think this needs to be done in the power_on() method...

> +
> +	return 0;
> +}
> +
> +static int da8xx_usb11_phy_shutdown(struct phy *phy)
> +{
> +	struct da8xx_usbphy *d_phy = phy_get_drvdata(phy);
> +	u32 val;
> +
> +	val = da8xx_usbphy_readl(d_phy->phy_ctrl);
> +	val &= ~USB1SUSPENDM;
> +	da8xx_usbphy_writel(d_phy->phy_ctrl, val);

    And this in power_off()...

> +
> +	clk_disable_unprepare(d_phy->usb11_clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops da8xx_usb11_phy_ops = {
> +	.power_on	= da8xx_usb11_phy_init,
> +	.power_off	= da8xx_usb11_phy_shutdown,

    Aha, it's just that the names don't match...
    Please call the implementations da8xx_usb11_phy_power_{on|off}().
The same with USB 2.0 PHY.

[...]

    Looks good otherwise on my superficial review. :-)

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
