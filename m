From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v10 2/2] phy: Add driver for mixel mipi dphy found on
 NXP's i.MX8 SoCs
Date: Wed, 8 May 2019 10:36:22 +0200
Message-ID: <20190508083622.GA3948@bogon.m.sigxcpu.org>
References: <cover.1557215047.git.agx@sigxcpu.org>
 <299e28042e0a24c0cde593873bdfb15e18187a92.1557215047.git.agx@sigxcpu.org>
 <20190507181223.GC15122@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190507181223.GC15122@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, Johan Hovold <johan@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Li Jun <jun.li@nxp.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Robert
List-Id: devicetree@vger.kernel.org

Hi,
On Tue, May 07, 2019 at 08:12:23PM +0200, Sam Ravnborg wrote:
> Hi Guido.
> 
> Looks good now, stumbled upon a few details I missed in last round.
> With these considered / fixed you can add my
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> > +#define CM(x)	(				\
> > +		((x) <	32)?0xe0|((x)-16) :	\
> > +		((x) <	64)?0xc0|((x)-32) :	\
> > +		((x) < 128)?0x80|((x)-64) :	\
> > +		((x) - 128))
> > +#define CN(x)	(((x) == 1)?0x1f : (((CN_BUF)>>((x)-1))&0x1f))
> > +#define CO(x)	((CO_BUF)>>(8-(x))&0x3)
> 
> A few spaces around the operators may help readability a little.
> 
> > +static int phy_write(struct phy *phy, u32 value, unsigned int reg)
> > +{
> > +	struct mixel_dphy_priv *priv = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret = regmap_write(priv->regmap, reg, value);
> > +	if (ret < 0)
> > +		dev_err(&phy->dev, "Failed to write DPHY reg %d: %d", reg, ret);
> 
> I have recently learned that one has to remember trailign "\n"- please
> add.
> Check all other dev_xxx as I noticed the newline is missing in a few
> more places.

Argh...I thought I've fixed these up already but that was in the
corresponding NWL driver only. Fixed now, thanks.

> 
> > +
> > +	dev_dbg(&phy->dev, "hs_clk/ref_clk=%ld/%ld ⩰ %d/%d\n",
>                                                    ^
> 
> There was another of the symbols my terminal cannot show.
> 

Thanks! I've incorporated your suggestions and will send out a v11 by
the end of the week in case there's more comments coming in.
Cheers,
 -- Guido
