From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/5] phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
Date: Wed, 13 Dec 2017 12:09:40 +0300
Message-ID: <7e7953b2-e94d-ded8-2278-6259a1457881@cogentembedded.com>
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513146460-20326-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513146460-20326-3-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello!

On 12/13/2017 9:27 AM, Yoshihiro Shimoda wrote:

> This patch unifies the OBINTEN handling to clean-up the code.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index c22d65a..beeaa30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -147,6 +147,18 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
>   	writel(val, usb2_base + USB2_ADPCTRL);
>   }
>   
> +static void rcar_gen3_enable_otg_irq(struct rcar_gen3_chan *ch, int enable)

    If it both enables and disables, rcar_gen3_control_otg_irq() would seem a 
better name...

> +{
> +	void __iomem *usb2_base = ch->base;
> +	u32 val = readl(usb2_base + USB2_OBINTEN);
> +
> +	if (enable)
> +		val |= USB2_OBINT_BITS;
> +	else
> +		val &= ~USB2_OBINT_BITS;
> +	writel(val, usb2_base + USB2_OBINTEN);
> +}
> +
>   static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
>   {
>   	rcar_gen3_set_linectrl(ch, 1, 1);
[...]

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
