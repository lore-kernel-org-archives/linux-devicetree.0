From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Thu, 30 Jun 2016 10:31:08 +0200
Message-ID: <20160630103108.66faa9f392f050de6106d194@free.fr>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
	<20160629190535.11855-14-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160629190535.11855-14-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 29 Jun 2016 21:05:34 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	/* Force the PLL-Audio-1x divider to 4 */
> +	val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> +	val &=3D ~GENMASK(4, 0);
> +	writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> +
> +	sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> +}

=46YI, the pll-audio PLL_POST_DIV is 19:16.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
