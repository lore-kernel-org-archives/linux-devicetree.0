From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0
 clock selector PHY
Date: Mon, 24 Jul 2017 10:15:32 +0000
Message-ID: <TY1PR06MB099263CA5AAEF5ECA6E16E9BD8BB0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1498631315-15730-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170705211753.GV22780@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170705211753.GV22780@codeaurora.org>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen-san,

Thank you for your comments!

> From: Stephen Boyd
> Sent: Thursday, July 6, 2017 6:18 AM
>=20
> On 06/28, Yoshihiro Shimoda wrote:
> > +
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +	dev_set_drvdata(dev, priv);
> > +
> > +	init.name =3D "rcar_usb2_clock_sel";
> > +	init.ops =3D &usb2_clock_sel_clock_ops;
> > +	init.flags =3D CLK_IS_BASIC;
>=20
> Please drop CLK_IS_BASIC unless you need it.

I got it.

> > +	init.parent_names =3D NULL;
> > +	init.num_parents =3D 0;
> > +	priv->hw.init =3D &init;
> > +
> > +	clk =3D clk_register(NULL, &priv->hw);
> > +	if (IS_ERR(clk))
> > +		return PTR_ERR(clk);
> > +
> > +	error =3D of_clk_add_provider(np, of_clk_src_simple_get, clk);
>=20
> Can you use clk_hw_register() and of_clk_add_hw_provider()
> please?

I could use of_clk_add_hw_provider().

Best regards,
Yoshihiro Shimoda

> > +	if (error)
> > +		return error;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct dev_pm_ops rcar_usb2_clock_sel_pm_ops =3D {
> > +	.suspend	=3D rcar_usb2_clock_sel_suspend,
> > +	.resume		=3D rcar_usb2_clock_sel_resume,
> > +};
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
