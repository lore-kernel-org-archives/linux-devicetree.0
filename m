From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/5] ARM: dts: imx50: Add Kobo Aura DTS
Date: Fri, 29 Mar 2019 10:44:50 +0800
Message-ID: <20190329024449.GM12513@dragon>
References: <20190319152421.16179-1-j.neuschaefer@gmx.net>
 <20190319152421.16179-3-j.neuschaefer@gmx.net>
 <20190322013151.GR12513@dragon>
 <20190326162653.GD2095@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326162653.GD2095@latitude>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 05:26:53PM +0100, Jonathan Neuschäfer wrote:
> Hi, thanks for your comments. I'll address them in v2.
> 
> On Fri, Mar 22, 2019 at 09:31:53AM +0800, Shawn Guo wrote:
> > On Tue, Mar 19, 2019 at 04:24:17PM +0100, Jonathan Neuschäfer wrote:
> > > The Kobo Aura is an e-book reader released in 2013.
> [...]
> > > +	sd2_pwrseq: pwrseq {
> > > +		compatible = "mmc-pwrseq-simple";
> > > +		pinctrl-names = "default";
> > > +		pinctrl-0 = <&pinctrl_sd2_reset>;
> > > +
> > 
> > Please do not have random newlines.
> 
> Does that apply to all empty lines between properties?

Yes, that's what we do for i.MX device trees.

> 
> > 
> > > +		reset-gpios = <&gpio4 17 GPIO_ACTIVE_LOW>;
> > > +	};
> > > +
> [...]
> > > +&iomuxc {
> > > +	pinctrl_uart2: uart2 {
> > > +		fsl,pins = <
> > > +			MX50_PAD_UART2_TXD__UART2_TXD_MUX	0x1e4
> > > +			MX50_PAD_UART2_RXD__UART2_RXD_MUX	0x1e4
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c1: i2c1 {
> > 
> > Please sort these pinctrl nodes alphabetically.
> 
> It doesn't make a difference here, but should I generally sort by name
> or by label in cases like this one?

Keep using the naming schema below, and it always makes no difference
then.

	pinctrl_xxx: xxx

Shawn
