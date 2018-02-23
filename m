From: Juergen Borleis <jbe@pengutronix.de>
Subject: Re: [PATCH v2 3/4] arm64: add support for i.MX8M EVK board
Date: Fri, 23 Feb 2018 16:30:43 +0100
Message-ID: <201802231630.45460.jbe@pengutronix.de>
References: <20180201183126.32384-1-l.stach@pengutronix.de>
 <20180201183126.32384-3-l.stach@pengutronix.de>
 <20180223150352.GU3217@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180223150352.GU3217@dragon>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kernel@pengutronix.de
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, patchwork-lst@pengutronix.de, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "A . s . Dong" <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Friday 23 February 2018 16:03:53 Shawn Guo wrote:
> On Thu, Feb 01, 2018 at 07:31:25PM +0100, Lucas Stach wrote:
> > +&usdhc1 {
> > +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 =3D <&pinctrl_usdhc1_cd_reset>, <&pinctrl_usdhc1_clk_strobe=
>,
> > +	            <&pinctrl_usdhc1_data>;
> > +	pinctrl-1 =3D <&pinctrl_usdhc1_cd_reset>,
> > +	            <&pinctrl_usdhc1_clk_strobe_100mhz>,
> > +	            <&pinctrl_usdhc1_data_100mhz>;
> > +	pinctrl-2 =3D <&pinctrl_usdhc1_cd_reset>,
> > +	            <&pinctrl_usdhc1_clk_strobe_200mhz>,
> > +	            <&pinctrl_usdhc1_data_200mhz>;
> > +	vqmmc-supply =3D <&sw4_reg>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	no-sd;
> > +	no-sdio;
> > +	status =3D "okay";
> > +};
>
> I'm not sure it can be enabled right now.  Per my testing, eMMC is not
> working yet.
>
> [    0.879756] mmc0: Switching to 3.3V signalling voltage failed
> [    0.913587] mmc0: SDHCI controller on 30b40000.usdhc [30b40000.usdhc]
> using ADMA ...
> [    1.007628] mmc0: switch to high-speed from hs200 failed, err:-110
> [    1.013873] mmc0: error -110 whilst initialising MMC card
> [    1.020639] mmc0: Switching to 3.3V signalling voltage failed
> ...
> [    1.132462] mmc0: switch to high-speed from hs200 failed, err:-110
> [    1.138674] mmc0: error -110 whilst initialising MMC card
> [    1.145394] mmc0: Switching to 3.3V signalling voltage failed
> [    1.268367] mmc0: switch to high-speed from hs200 failed, err:-110
> [    1.274576] mmc0: error -110 whilst initialising MMC card
> [    1.281291] mmc0: Switching to 3.3V signalling voltage failed
> [    1.440708] mmc0: switch to high-speed from hs200 failed, err:-110
> [    1.446919] mmc0: error -110 whilst initialising MMC card
>
> Or am I missing anything?

Property "no-1-8-v;" if no 1.8 V is available?

jb

-- =

Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0=
| Juergen Borleis =A0 =A0 =A0 =A0 =A0 =A0 |
Industrial Linux Solutions =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0 =A0| http://w=
ww.pengutronix.de/ =A0|
