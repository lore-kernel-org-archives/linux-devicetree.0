From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: add GPIO nodes for the BG2Q
Date: Tue, 15 Apr 2014 18:00:58 +0800
Message-ID: <20140415180058.2fefca78@xhacker>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
	<1397549245-3338-3-git-send-email-antoine.tenart@free-electrons.com>
	<534CFA77.9030108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534CFA77.9030108-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Tue, 15 Apr 2014 02:23:03 -0700
Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On 04/15/2014 10:07 AM, Antoine T=C3=A9nart wrote:
> > The Marvell Berlin BG2Q has 6 GPIO ports compatible with the
> > snps,dw-apb-gpio driver. This patch add the corresponding device tr=
ee
> > nodes.
> >
> > Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.c=
om>
> > ---
> >   arch/arm/boot/dts/berlin2q.dtsi | 102
> > ++++++++++++++++++++++++++++++++++++++++ 1 file changed, 102 insert=
ions(+)
> >
> > diff --git a/arch/arm/boot/dts/berlin2q.dtsi
> > b/arch/arm/boot/dts/berlin2q.dtsi index e6e556055dfc..b2625f896bc5 =
100644
> > --- a/arch/arm/boot/dts/berlin2q.dtsi
> > +++ b/arch/arm/boot/dts/berlin2q.dtsi
> > @@ -109,6 +109,78 @@
> >   			ranges =3D <0 0xe80000 0x10000>;
> >   			interrupt-parent =3D <&aic>;
> >
> > +			gpio0: gpio@0400 {
> > +				compatible =3D "snps,dw-apb-gpio";
> > +				reg =3D <0x0400 0x400>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +
> > +				porta: gpio-controller@0 {
>=20
> ePAPR recommended name is even more generic, i.e. "gpio". If
> that clashed in any way with other numbered names, I suggest
> to rename to "gpio-port" as actually the controller is the
> parent node and this represents one port (in the nomenclature
> of DW-APB-GPIO).
>=20
> > +					compatible =3D
> > "snps,dw-apb-gpio-port";
> > +					gpio-controller;
> > +					#gpio-cells =3D <2>;
> > +					snps,nr-gpios =3D <32>;
>=20
> 32 gpio pins for each of the 6 GPIO controllers? Either BG2Q is a GPI=
O

Yes, BG2Q support 32 pins every port

> beast or it is a mistake :P
>=20
> Can you please double-check?
>=20
> I am fine with using nr-gpios property now, but I guess BG2Q also
> has that CONFIG[1,2] registers to actually read out the features
> synthesized in? If I find some time, I'll prepare a patch for
> dw-apb-gpio to exploit that (optional) information instead of
> using nr-gpios.

The problem is CONFIG1/2 registers don't exist on some versions.
=46or example, the version used in BG2/BG2CD. So nr-gpio is necessary
if we want to support these versions.

Thanks,
Jisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
