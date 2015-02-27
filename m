From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 3/4] clk: Provide always-on clock support
Date: Fri, 27 Feb 2015 21:51:20 +0000
Message-ID: <20150227215120.GC12821@x1>
References: <1425071674-16995-1-git-send-email-lee.jones@linaro.org>
 <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425071674-16995-4-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 27 Feb 2015, Lee Jones wrote:

> Lots of platforms contain clocks which if turned off would prove fata=
l.
> The only way to recover from these catastrophic failures is to restar=
t
> the board(s).  Now, when a clock is registered with the framework it =
is
> compared against a list of provided always-on clock names which must =
be
> kept ungated.  If it matches, we enable the existing CLK_IGNORE_UNUSE=
D
> flag, which will prevent the common clk framework from attempting to
> gate it during the clk_disable_unused() procedure.
>=20
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/clk.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 61c3fc5..3aab75e 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2856,6 +2856,9 @@ int of_clk_add_provider(struct device_node *np,
>  			void *data)
>  {
>  	struct of_clk_provider *cp;
> +	struct property *prop;
> +	struct clk *clk;
> +	const char *clkname;
>  	int ret;
> =20
>  	cp =3D kzalloc(sizeof(struct of_clk_provider), GFP_KERNEL);
> @@ -2875,6 +2878,14 @@ int of_clk_add_provider(struct device_node *np=
,
>  	if (ret < 0)
>  		of_clk_del_provider(np);
> =20
> +	of_property_for_each_string(np, "clock-always-on", prop, clkname) {
> +		clk =3D __clk_lookup(clkname);
> +		if (!clk)
> +			continue;
> +
> +		clk->core->flags |=3D CLK_IGNORE_UNUSED;

Might save a few cycles by breaking here.

> +	}
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_clk_add_provider);

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
