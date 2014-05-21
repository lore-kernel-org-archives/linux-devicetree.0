From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 21 May 2014 18:54:20 +0200
Message-ID: <1948139.7c1AZ80ZQt@phil>
References: <1400689583-21119-1-git-send-email-matthias.bgg@gmail.com> <1400689583-21119-3-git-send-email-matthias.bgg@gmail.com> <63a3ee29-aa23-4137-9c0c-5b2bdd75a68f@BN1BFFO11FD014.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <63a3ee29-aa23-4137-9c0c-5b2bdd75a68f-fm2tX0oQAVwuzzbwJFeYHehlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 21. Mai 2014, 09:34:10 schrieb S=F6ren Brinkmann:
> Hi Matthias,
>=20
> On Wed, 2014-05-21 at 06:26PM +0200, Matthias Brugger wrote:
> > Add binding documentation for the General Porpose Timer driver of
>=20
> Typo: Purpose
>=20
> > the Mediatek SoCs.
> >=20
> > Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >=20
> >  .../devicetree/bindings/timer/mediatek,mtk-timer.txt   | 18
> >  ++++++++++++++++++ 1 file changed, 18 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt>=20
> > diff --git
> > a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> > b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt ne=
w file
> > mode 100644
> > index 0000000..7d909f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.tx=
t
> > @@ -0,0 +1,18 @@
> > +Mediatek MT6577, MT6572 and MT6589 Timers
> > +---------------------------------------
> > +
> > +Required properties:
> > +- compatible: Should be "mediatek,mtk6577-timer"
> > +- reg: Should contain location and length for timers register.
> > +- clocks: Clocks driving the timer hardware. This list shoud inclu=
de two
> > +	clocks. The order is system clock and as second clock the RTC clo=
ck.
> > +
> > +Examples:
> > +
> > +	timer {
>=20
> The node name should be timer@0x10008000

I think the more commonly used variant is

	timer@10008000

without the 0x. While some dts files really use @0x they are in the min=
ority.


>=20
> > +		compatible =3D "mediatek,mtk6577-timer";
> > +		reg =3D <0x10008000 0x80>;
> > +		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks =3D <&system_clk>, <&rtc_clk>;
> > +		clock-names =3D "system-clk", "rtc-clk";
>=20
> I'm still not convinced that the timer IP calls its clock inputs this
> way, but well.

Maybe this might convince you ;-)

"The GPT includes 5 32-bit timers and one 64-bit timer. Each timer has =
4=20
operation modes, which are ONE-SHOT,  REPEAT,  KEEP-GO and  FREERUN, an=
d can=20
operate on one of the 2 clock sources, RTC clock (32.768kHz) and system=
 clock=20
(13MHz)."


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
