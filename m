From: Emmanuel Vadot <manu@bidouilliste.com>
Subject: Re: [PATCH] ARM: dts: imx6: RIoTboard Add chosen stdout-path property
Date: Mon, 18 Jun 2018 18:30:38 +0200
Message-ID: <20180618183038.c8ee3164ff62ab5e27535c5c@bidouilliste.com>
References: <20180618154257.16919-1-manu@freebsd.org>
 <1529337797.7211.4.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1529337797.7211.4.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 18 Jun 2018 18:03:17 +0200
Lucas Stach <l.stach@pengutronix.de> wrote:

> Am Montag, den 18.06.2018, 17:42 +0200 schrieb Emmanuel Vadot:
> > The RIoTboard debug uart is connected to serial1.
> > Add a chosen property in the DTS so OS knows what serial port to use for
> > the console.
> > =

> > > Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
> > ---
> > =A0arch/arm/boot/dts/imx6dl-riotboard.dts | 4 ++++
> > =A01 file changed, 4 insertions(+)
> > =

> > diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts=
/imx6dl-riotboard.dts
> > index 2e98c92adff7..315d2ae6fa45 100644
> > --- a/arch/arm/boot/dts/imx6dl-riotboard.dts
> > +++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
> > @@ -19,6 +19,10 @@
> > > =A0		reg =3D <0x10000000 0x40000000>;
> > > =A0	};
> > =A0
> > > +	chosen {
> > +		stdout-path =3D "serial1:115200n8";
> =

> If there a reason to deviate from the "stdout-path =3D &uart1;" notation
> used by other i.MX boards?
> =

> Regards,
> Lucas

 This is, AFAIK, the proper way to specify the stdout-path.
 See
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/chosen.txt#L31

 Cheers,

> > +	};
> > +
> > > =A0	regulators {
> > > =A0		compatible =3D "simple-bus";
> > > =A0		#address-cells =3D <1>;
> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


-- =

Emmanuel Vadot <manu@bidouilliste.com> <manu@freebsd.org>
