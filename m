From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sun6i: Reparent AHB clock on PLL6
Date: Fri, 28 Feb 2014 14:16:35 -0300
Message-ID: <5310C473.7030304@elopez.com.ar>
References: <1393605440-14643-1-git-send-email-maxime.ripard@free-electrons.com> <1393605440-14643-3-git-send-email-maxime.ripard@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBD73XIMS3EHBBDEJYOMAKGQE34NM5GY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1393605440-14643-3-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

El 28/02/14 13:37, Maxime Ripard escribi=F3:
> In order for the DMA controller to work for SDRAM to devices transfers, t=
he AHB
> clock should be reparented on the PLL6.
>
> Force that parenting in the clock driver.
>
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   drivers/clk/sunxi/clk-sunxi.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.=
c
> index f6f61cc..a5c5882 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -1286,7 +1286,7 @@ static void __init of_sunxi_table_clock_setup(const=
 struct of_device_id *clk_mat
>    */
>   static void __init sunxi_clock_protect(void)
>   {
> -	struct clk *clk;
> +	struct clk *clk, *parent;
>
>   	/* memory bus clock - sun5i+ */
>   	clk =3D clk_get(NULL, "mbus");
> @@ -1307,6 +1307,22 @@ static void __init sunxi_clock_protect(void)
>   	if (!IS_ERR(clk))
>   		clk_prepare_enable(clk);
>
> +	clk =3D clk_get(NULL, "ahb1_mux");
> +	if (IS_ERR(clk)) {
> +		pr_err("Couldn't get AHB1 Mux\n");
> +		return;
> +	}
> +
> +	parent =3D clk_get(NULL, "pll6");
> +	if (IS_ERR(clk)) {
> +		pr_err("Couldn't get PLL6\n");
> +		return;
> +	}

Remember this runs on every sunxi, but this bit of magic is sun6i only.=20
We'll get bogus messages on the other platforms if this goes as is. You=20
could do something like the following:

 > +	clk =3D clk_get(NULL, "ahb1_mux");
 > +	parent =3D clk_get(NULL, "pll6");
 > +	if (!IS_ERR(clk) && !IS_ERR(parent))
 > +		clk_set_parent(...)

If these things become more common, we may need to consider a=20
per-platform fixup function or something.

Cheers,

Emilio

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
