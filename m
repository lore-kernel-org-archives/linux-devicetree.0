From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 1/3] ARM: dts: imx6: add support for Ka-Ro electronics
 TX6S-8034 module
Date: Wed, 13 Jan 2016 12:10:12 +0100
Message-ID: <20160113121012.0c924bc8@ipc1.ka-ro>
References: <1452621710-15336-1-git-send-email-LW@KARO-electronics.de>
	<1452621710-15336-2-git-send-email-LW@KARO-electronics.de>
	<87h9iigce7.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87h9iigce7.fsf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Holger Schurig <holgerschurig@gmail.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

> Lothar Wa=C3=9Fmann <LW@KARO-electronics.de> writes:
>=20
> > +/ {
> > +	model =3D "Ka-Ro electronics TX6S-8034 Module";
> > +	compatible =3D "karo,imx6dl-tx6dl", "fsl,imx6dl";
> > +	timestamp =3D __DATE__, __TIME__;
>=20
> Is this needed or useful?
>=20
> There's a movement that aims to do "reproducible builds" ...   being
> able to recompile an image and verify it against the supplied can be
> helpful for security audit purposes.
>=20
Ooops. I was on the wrong branch when creating these patches. Will
resend this patch series soon.

> > +	display: display@di0 {
> > +		compatible =3D "fsl,imx-parallel-display";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_disp0_1>;
> > +		interface-pix-fmt =3D "rgb24";
> > +//		fsl,panel =3D <&lcd0_panel>;
>=20
> Probably not for upstream inclusion?
>
see above.
