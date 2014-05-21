From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm590xx: add support for GPLDO and
 VBUS regulators
Date: Wed, 21 May 2014 14:30:38 +0100
Message-ID: <20140521133038.GJ6679@lee--X1>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-5-git-send-email-mporter@linaro.org>
 <20140521092913.GG6679@lee--X1>
 <20140521120257.GV32082@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140521120257.GV32082@beef>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Devicetree List <devicetree@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > > diff --git a/arch/arm/boot/dts/bcm59056.dtsi b/arch/arm/boot/dts/=
bcm59056.dtsi
> > > index dfadaaa..066adfb 100644
> > > --- a/arch/arm/boot/dts/bcm59056.dtsi
> > > +++ b/arch/arm/boot/dts/bcm59056.dtsi
> > > @@ -70,5 +70,26 @@
> > > =20
> > >  		vsr_reg: vsr {
> > >  		};
> > > +
> > > +		gpldo1_reg: gpldo1 {
> > > +		};
> >=20
> > What do these empty nodes do in any case?
>=20
> They instantiate regulators. The bcm590xx binding specifies the
> allowable subnode names permitted here. This replaces the old method
> of specifying an index or the deprecated regulator-compatible propert=
y.
> The board-specific dts includes this dtsi and applies any board
> constraints to a subset of regulators that need them. Unused regulato=
rs
> are all disabled which is what we want.
>=20
> > Don't you at least need a status property in there or something?
>=20
> Not necessary for these subnodes.

Very well, thanks for the clarification.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
