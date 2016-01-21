From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/4] WIP: MIPS: ath79: make ar933x clks more
 devicetree-friendly
Date: Thu, 21 Jan 2016 13:17:11 +0300
Message-ID: <20160121131711.a7315d3ca6233e50ec824544@gmail.com>
References: <1453074987-3356-1-git-send-email-antonynpavlov@gmail.com>
	<1453074987-3356-2-git-send-email-antonynpavlov@gmail.com>
	<20160118205725.0a16be8e@tock>
	<20160121031215.250b826347fd9c179b031288@gmail.com>
	<20160121091217.379b6239@tock>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160121091217.379b6239@tock>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Yegor Yefremov <yegorslists-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gabor Juhos <juhosg-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 21 Jan 2016 09:12:17 +0100
Alban <albeu-GANU6spQydw@public.gmane.org> wrote:

> On Thu, 21 Jan 2016 03:12:15 +0300
> Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > On Mon, 18 Jan 2016 20:57:25 +0100
> > Alban <albeu-GANU6spQydw@public.gmane.org> wrote:
> >=20
> > > On Mon, 18 Jan 2016 02:56:24 +0300
> > > Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >=20
> > > > At the moment ar933x of-enabled drivers use use clock names
> > > > (e.g. "uart" or "ahb") to get clk descriptor.
> > > > On the other hand
> > > > Documentation/devicetree/bindings/clock/clock-bindings.txt stat=
es
> > > > that the 'clocks' property is required for passing clk to clock
> > > > consumers.
> > >=20
> > > This patch is not need, you should set the clock-names property i=
n
> > > the relevant device nodes instead.
> >=20
> > This patch is needed for AR9331!
> >=20
> > In ar933x_clocks_init() we have
> >=20
> >         ath79_add_sys_clkdev("ref", ref_rate);
> >         clks[0] =3D ath79_add_sys_clkdev("cpu", cpu_rate);
> >         clks[1] =3D ath79_add_sys_clkdev("ddr", ddr_rate);
> >         clks[2] =3D ath79_add_sys_clkdev("ahb", ahb_rate);
> >=20
> >         clk_add_alias("wdt", NULL, "ahb", NULL);
> >         clk_add_alias("uart", NULL, "ref", NULL);
> >=20
> > "uart" is an alias for "ref". But "ref" is not visible via device t=
ree!
> >=20
> > I see this error message on ar933x-uart start:
> > =20
> >      ERROR: could not get clock /ahb/apb/uart@18020000:uart(0)
>=20
> The ref clock should be defined in the board DTS, I now see that it i=
s
> missing in yours. What you need to do is to define the clock-names
> property in the Soc DTS, that allow the names lookup to work. Then in
> the board DTS you can define the clock property to connect it to the
> proper parent.=20
>=20
> I'm also working on supporting the QCA9558 and the clock tree is simi=
lar.
> See https://github.com/AlbanBedel/linux/commit/d6c8f8adfce08972c6
> as example.

Current ath79 clock.c code does not read ref clock from devicetree!
So you can set any clock rate value in board DTS but it will has no eff=
ect
on the real clk calculation.

A more reasonable solution is used for CI20 board.
In arch/mips/boot/dts/ingenic/jz4780.dtsi we have

	ext: ext {
		compatible =3D "fixed-clock";
		#clock-cells =3D <0>;
	};

=2E..

	cgu: jz4780-cgu@10000000 {
		compatible =3D "ingenic,jz4780-cgu";
		reg =3D <0x10000000 0x100>;

		clocks =3D <&ext>, <&rtc>;
		clock-names =3D "ext", "rtc";

		#clock-cells =3D <1>;
	};


In arch/mips/boot/dts/ingenic/ci20.dts we have

&ext {
	clock-frequency =3D <48000000>;
};

At last drivers/clk/ingenic/jz4780-cgu.c registers this "ext" clock
as a parent of most other subordianate clocks. So there is no magic
frequency constants in drivers/clk/ingenic!

In arch/mips/ath79/clocks.c we have a very different situation:
the reference clock frequences are already hardcoded in C-code so there=
 is
no need to mention them in devicetree files.

--=A0
Best regards,
=A0 Antony Pavlov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
