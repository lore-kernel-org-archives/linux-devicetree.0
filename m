From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 04/13] media: rc: sunxi: Add RXSTA bits definition
Date: Wed, 5 Jun 2019 11:51:41 +0200
Message-ID: <20190605095141.psrq6mhk63zto77s@flea>
References: <20190604162959.29199-1-peron.clem@gmail.com>
 <20190604162959.29199-5-peron.clem@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBMNB33TQKGQERLNVPVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190604162959.29199-5-peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2019 at 06:29:50PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> We are using RXINT bits definition when looking at RXSTA register.
>
> These bits are equal but it's not really proper.
>
> Introduce the RXSTA bits and use them to have coherency.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/media/rc/sunxi-cir.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
> index 0504ebfc831f..572bd2257d35 100644
> --- a/drivers/media/rc/sunxi-cir.c
> +++ b/drivers/media/rc/sunxi-cir.c
> @@ -48,11 +48,11 @@
>
>  /* Rx Interrupt Enable */
>  #define SUNXI_IR_RXINT_REG    0x2C
> -/* Rx FIFO Overflow */
> +/* Rx FIFO Overflow Interrupt Enable */
>  #define REG_RXINT_ROI_EN		BIT(0)
> -/* Rx Packet End */
> +/* Rx Packet End Interrupt Enable */
>  #define REG_RXINT_RPEI_EN		BIT(1)
> -/* Rx FIFO Data Available */
> +/* Rx FIFO Data Available Interrupt Enable */
>  #define REG_RXINT_RAI_EN		BIT(4)
>
>  /* Rx FIFO available byte level */
> @@ -60,6 +60,12 @@
>
>  /* Rx Interrupt Status */
>  #define SUNXI_IR_RXSTA_REG    0x30
> +/* Rx FIFO Overflow */
> +#define REG_RXSTA_ROI			BIT(0)
> +/* Rx Packet End */
> +#define REG_RXSTA_RPE			BIT(1)
> +/* Rx FIFO Data Available */
> +#define REG_RXSTA_RA			BIT(4)

I'm fine with it on principle, but if the consistency needs to be
maintained then we could just reuse the above defines

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/20190605095141.psrq6mhk63zto77s%40flea.
For more options, visit https://groups.google.com/d/optout.
