From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: add mtk-timer bindings
Date: Wed, 14 May 2014 10:44:42 -0700
Message-ID: <cebe44ba-c543-4f4a-9aeb-810156fe8250@BN1AFFO11FD036.protection.gbl>
References: <1400087579-4250-1-git-send-email-matthias.bgg@gmail.com>
 <1400087579-4250-3-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1400087579-4250-3-git-send-email-matthias.bgg@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, tglx@linutronix.de, thierry.reding@gmail.com, florian.vaussard@epfl.ch, jic23@kernel.org, jason@lakedaemon.net, andrew@lunn.ch, silvio.fricke@gmail.com, heiko.stuebner@bq.com, olof@lixom.net, sebastian.hesselbarth@gmail.com, sboyd@codeaurora.org, gregory.clement@free-electrons.com, arnd@arndb.de, robherring2@gmail.com, marc.zyngier@arm.com, maxime.ripard@free-electrons.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Wed, 2014-05-14 at 07:12PM +0200, Matthias Brugger wrote:
> Add binding documentation for the General Porpose Timer driver of
> the Mediatek SoCs.
>=20
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  .../devicetree/bindings/timer/mediatek,mtk-timer.txt   | 18 ++++++++=
++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,=
mtk-timer.txt
>=20
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-tim=
er.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> new file mode 100644
> index 0000000..938adf6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -0,0 +1,18 @@
> +Mediatek MT6589, MT6577 and MT6572 Timers
> +---------------------------------------
> +
> +Required properties:
> +- compatible: Should be "mediatek,mtk6589-timer"

Don't you want compatible strings for the other supported SOCs too?

> +- reg: Should contain location and length for timers register.
> +- clocks: Clocks driving the timer hardware. This list shoud include=
 two
> +	clocks. The order is system clock and as second clock the RTC clock=
=2E

Sorry for being pedantic, but we had so many ugly bindings in our vendo=
r
tree. I'm still getting caught up on the clocks. I have the feeling the=
 SOC
has two clocks (system and rtc) which are used to drive this timer,
while the timer probably refers differently to its clock inputs.
If this was the case, the names 'rtc' and 'system' clock are SOC specif=
ic
names/implementation details. From the timer perspective it is probably
just important that it receives two clock inputs. Since the timer is
described here and not the SOC, these SOC specific names should
disappear and be replaced with the names the timer IP uses for its inpu=
t
clocks.

The clock-names should be listed too, probably as optional properties.

> +
> +Examples:
> +
> +	timer {
> +		compatible =3D "mediatek,mtk6589-timer";
> +		reg =3D <0x10008000 0x80>;
> +		interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =3D <&system_clk>, <&rtc_clk>;
> +		clock-names =3D "system-clk", "rtc-clk";


	S=C3=B6ren
