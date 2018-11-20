From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 05/14] irqchip/sun4i: add support for
 suniv interrupt controller
Date: Tue, 20 Nov 2018 09:48:15 +0100
Message-ID: <20181120084815.rvh63cvvhxj6sbs2@flea>
References: <cover.1542546735.git.mesihkilinc@gmail.com>
 <d693414b1693a9018956bcc589a9048e88fbc8f6.1542546735.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7nbopu3lgekzonta"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWUUZ7PQKGQEGRXZZHI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <d693414b1693a9018956bcc589a9048e88fbc8f6.1542546735.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7nbopu3lgekzonta
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Sun, Nov 18, 2018 at 05:17:04PM +0300, Mesih Kilinc wrote:
> The new F-series SoCs (suniv) from Allwinner use an stripped version of
> the interrupt controller in A10/A13.
> 
> Add support for it in irq-sun4i driver.
> 
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/irqchip/irq-sun4i.c | 47 ++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-sun4i.c b/drivers/irqchip/irq-sun4i.c
> index e3e5b91..2abf662 100644
> --- a/drivers/irqchip/irq-sun4i.c
> +++ b/drivers/irqchip/irq-sun4i.c
> @@ -23,13 +23,26 @@
>  
>  #include <asm/exception.h>
>  
> +enum sun4i_irq_type {
> +	sun4i_ic,
> +	suniv_ic
> +};
> +
> +static enum sun4i_irq_type sun4i_irq_type;

You don't really need that type. It's completely redundant with the
compatible.

> +static int sun4i_irq_enable_reg_offset;
> +static int sun4i_irq_mask_reg_offset;

Ideally, this should be a structure so that we can easily extend it
without adding more and more global variables. And the type shouldn't
be signed.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--7nbopu3lgekzonta--
