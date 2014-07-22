From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rk3188-radxarock: add GPIO IR receiver node
Date: Tue, 22 Jul 2014 23:45:47 +0200
Message-ID: <3433422.DZFVBm30W2@diego>
References: <1405253401-15534-1-git-send-email-b.galvani@gmail.com> <2390327.HZxnbJmfOO@diego> <20140714190355.GA16904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140714190355.GA16904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 14. Juli 2014, 21:04:26 schrieb Beniamino Galvani:
> On Sun, Jul 13, 2014 at 02:37:40PM +0200, Heiko St=FCbner wrote:
> > Am Sonntag, 13. Juli 2014, 14:10:01 schrieb Beniamino Galvani:
> > > This adds a device tree node for the infrared receiver connected =
to a
> > > GPIO pin on the Radxa Rock.
> > >=20
> > > Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/rk3188-radxarock.dts |   13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts
> > > b/arch/arm/boot/dts/rk3188-radxarock.dts index 19d45b4..1d87bcb 1=
00644
> > > --- a/arch/arm/boot/dts/rk3188-radxarock.dts
> > > +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
> > > @@ -23,6 +23,13 @@
> > >=20
> > >  		reg =3D <0x60000000 0x80000000>;
> > >  =09
> > >  	};
> > >=20
> > > +	ir_recv: ir-receiver {
> > > +		compatible =3D "gpio-ir-receiver";
> > > +		gpios =3D <&gpio0 10 1>;
> > > +		pinctrl-names =3D "default";
> > > +		pinctrl-0 =3D <&ir_recv_pin>;
> > > +	};
> > > +
> >=20
> > hmm, on second glance, I'm actually not sure if this shouldn't belo=
ng in
> > the soc subnode, like the gpio-keys and leds.
>=20
> (adding devicetree mailing list)
>=20
> I placed the IR receiver under the root node after looking at what
> other boards do, for example:
>=20
>   imx6dl-hummingboard.dts
>   imx6qdl-cubox-i.dtsi
>   dove-cubox.dts
>=20
> On the other hand, if gpio-keys and leds are under the soc node
> probably it makes sense to follow the same rule also for the IR
> receiver.

your way was the right one actually ... using artificial subnodes is no=
t=20
encouraged at all - see comments I received , so the soc node itself al=
so may=20
go away.

I'll add the patch to my queue.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
