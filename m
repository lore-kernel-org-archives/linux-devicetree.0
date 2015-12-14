From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: add eFuse node for rk3066a SoCs
Date: Mon, 14 Dec 2015 14:12:33 +0100
Message-ID: <8067633.MgqW58IghF@diego>
References: <1447227272-1728-1-git-send-email-wxt@rock-chips.com> <566E926E.7090903@linaro.org> <3368238.OTPIyEf9PI@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3368238.OTPIyEf9PI@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 14. Dezember 2015, 14:06:06 schrieb Heiko St=FCbner:
> Hi srini,
>=20
> Am Montag, 14. Dezember 2015, 09:57:02 schrieb Srinivas Kandagatla:
> > Heiko,
> >=20
> > Can you take the DT patches in this series via your tree.
> >=20
> > I picked up nvmem patches from this series.
>=20
> yep that was my plan ... just needed to wait for the nvmem parts to b=
e
> picked.

after looking at the patch-series as a whole, I just noticed, that they=
 don't=20
even depend on each other ... so I could've picked them earlier easily.

Anyway, I'll do that now.

> > thanks,
> > srini
> >=20
> > On 11/11/15 07:34, Caesar Wang wrote:
> > > This patch add the eFuse dt node for rk3066a SoCs.
> > >=20
> > > Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > > ---
> > >=20
> > >   arch/arm/boot/dts/rk3066a.dtsi | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/rk3066a.dtsi
> > > b/arch/arm/boot/dts/rk3066a.dtsi index 946f187..f61bb8a 100644
> > > --- a/arch/arm/boot/dts/rk3066a.dtsi
> > > +++ b/arch/arm/boot/dts/rk3066a.dtsi
> > > @@ -153,6 +153,19 @@
> > >=20
> > >   		clock-names =3D "timer", "pclk";
> > >   =09
> > >   	};
> > >=20
> > > +	efuse: efuse@20010000 {
> > > +		compatible =3D "rockchip,rockchip-efuse";
> > > +		reg =3D <0x20010000 0x4000>;
> > > +		#address-cells =3D <1>;
> > > +		#size-cells =3D <1>;
> > > +		clocks =3D <&cru PCLK_EFUSE>;
> > > +		clock-names =3D "pclk_efuse";
> > > +
> > > +		cpu_leakage: cpu_leakage {
> > > +			reg =3D <0x17 0x1>;
> > > +		};
> > > +	};
> > > +
> > >=20
> > >   	timer@20038000 {
> > >   =09
> > >   		compatible =3D "snps,dw-apb-timer-osc";
> > >   		reg =3D <0x20038000 0x100>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
