From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: berlin: add GPIO nodes for the BG2Q
Date: Tue, 15 Apr 2014 13:48:49 +0200
Message-ID: <20140415114848.GA2813@piout.net>
References: <1397549245-3338-1-git-send-email-antoine.tenart@free-electrons.com>
 <1397549245-3338-3-git-send-email-antoine.tenart@free-electrons.com>
 <534CFA77.9030108@gmail.com>
 <20140415180058.2fefca78@xhacker>
 <534D0943.2050100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <534D0943.2050100-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jimmy Xu <zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15/04/2014 at 12:26:11 +0200, Sebastian Hesselbarth wrote :
> On 04/15/2014 12:00 PM, Jisheng Zhang wrote:
> >On Tue, 15 Apr 2014 02:23:03 -0700
> >Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>On 04/15/2014 10:07 AM, Antoine T=E9nart wrote:
> >>>The Marvell Berlin BG2Q has 6 GPIO ports compatible with the
> >>>snps,dw-apb-gpio driver. This patch add the corresponding device t=
ree
> >>>nodes.
> >>>
> >>>Signed-off-by: Antoine T=E9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
>
> >>>---
> >>>   arch/arm/boot/dts/berlin2q.dtsi | 102
> >>>++++++++++++++++++++++++++++++++++++++++ 1 file changed, 102 inser=
tions(+)
> >>>
> >>>diff --git a/arch/arm/boot/dts/berlin2q.dtsi
> >>>b/arch/arm/boot/dts/berlin2q.dtsi index e6e556055dfc..b2625f896bc5=
 100644
> >>>--- a/arch/arm/boot/dts/berlin2q.dtsi
> >>>+++ b/arch/arm/boot/dts/berlin2q.dtsi
> [...]
> >>>+					compatible =3D
> >>>"snps,dw-apb-gpio-port";
> >>>+					gpio-controller;
> >>>+					#gpio-cells =3D <2>;
> >>>+					snps,nr-gpios =3D <32>;
> >>
> >>32 gpio pins for each of the 6 GPIO controllers? Either BG2Q is a G=
PIO
> >
> >Yes, BG2Q support 32 pins every port
>=20
> Wow. Thanks for confirming this!
>=20
> >>I am fine with using nr-gpios property now, but I guess BG2Q also
> >>has that CONFIG[1,2] registers to actually read out the features
> >>synthesized in? If I find some time, I'll prepare a patch for
> >>dw-apb-gpio to exploit that (optional) information instead of
> >>using nr-gpios.
> >
> >The problem is CONFIG1/2 registers don't exist on some versions.
> >For example, the version used in BG2/BG2CD. So nr-gpio is necessary
> >if we want to support these versions.
>=20
> Hmm, are you sure about BG2? I remember reading it and it contains
> sane values. Anyway, a proper patch for dw-apb-gpio would include
> checking for sane (e.g. non-zero) values. And nr-gpios will always
> stay as fall-back just because e.g. sunxi does not have the CONFIG
> registers.
>=20

Shouldn't that be use nr-gpios and if not available, read the CONFIG
registers? Else, what about bogus registers ?

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
