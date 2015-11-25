From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH (v2) 1/10] clocksource: Add brcm,bcm6345-timer device
 tree binding
Date: Tue, 24 Nov 2015 21:05:44 -0600
Message-ID: <20151125030544.GA9933@rob-hp-laptop>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q@mail.gmail.com>
 <5653612A.4050309@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <5653612A.4050309@simon.arlott.org.uk>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Jonas Gorski <jogo@openwrt.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Wim Van Sebroeck <wim@iguana.be>, Miguel Gaio <miguel.gaio@efixo.com>, Maxime Bizon <mbizon@freebox.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, MIPS Mailing List <linux-mips@linux-mips.org>, linux-watchdog@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 23, 2015 at 06:55:38PM +0000, Simon Arlott wrote:
> Add device tree bindings for the BCM6345/BCM6318 timers. This is requ=
ired
> for the BCM6345 watchdog which needs to respond to one of the timer
> interrupts.
>=20
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>

Acked-by: Rob Herring <robh@kernel.org>

> ---
> On 23/11/15 15:33, Jonas Gorski wrote:
> > On Sat, Nov 21, 2015 at 8:02 PM, Simon Arlott <simon@fire.lp0.eu> w=
rote:
> >> +- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6345-time=
r"
> >=20
> > Since bcm6318 uses a slightly different register layout than the
> > earlier SoCs, I'd argue that using bcm6345-timer as a compatible fo=
r
> > bcm6318 is wrong.
>=20
> I've split them out into two very similar bindings.
>=20
> Patches 1/4 and 2/4 are replaced with (v2) 1/10 and (v2) 2/10.
>=20
>  .../bindings/timer/brcm,bcm6318-timer.txt          | 44 ++++++++++++=
++++++++
>  .../bindings/timer/brcm,bcm6345-timer.txt          | 47 ++++++++++++=
++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/brcm,bcm6=
318-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/brcm,bcm6=
345-timer.txt
>=20
> diff --git a/Documentation/devicetree/bindings/timer/brcm,bcm6318-tim=
er.txt b/Documentation/devicetree/bindings/timer/brcm,bcm6318-timer.txt
> new file mode 100644
> index 0000000..cf4be7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/brcm,bcm6318-timer.txt
> @@ -0,0 +1,44 @@
> +Broadcom BCM6318 Timer
> +
> +This block is a timer that is connected to multiple interrupts on th=
e main
> +interrupt controller and functions as a programmable interrupt contr=
oller for
> +timer events. There is a main timer interrupt for all timers.
> +
> +- 4 independent timers with their own interrupt, and own maskable le=
vel
> +  interrupt bit in the main timer interrupt
> +
> +- 1 watchdog timer with an unmaskable level interrupt bit in the mai=
n timer
> +  interrupt
> +
> +- Contains one enable/status word pair
> +
> +- No atomic set/clear operations
> +
> +Required properties:
> +
> +- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6318-timer"
> +- reg: specifies the base physical address and size of the registers=
, excluding
> +  the watchdog registers
> +- interrupt-controller: identifies the node as an interrupt controll=
er
> +- #interrupt-cells: specifies the number of cells needed to encode a=
n interrupt
> +  source, should be 1.
> +- interrupt-parent: specifies the phandle to the parent interrupt co=
ntroller(s)
> +  this one is cascaded from
> +- interrupts: specifies the interrupt line(s) in the interrupt-paren=
t controller
> +  node for the main timer interrupt, followed by the individual time=
r
> +  interrupts; valid values depend on the type of parent interrupt co=
ntroller
> +- clocks: phandle of timer reference clock (periph)
> +
> +Example:
> +
> +timer: timer@10000040 {
> +	compatible =3D "brcm,bcm63148-timer", "brcm,bcm6318-timer";
> +	reg =3D <0x10000040 0x28>;
> +
> +	interrupt-controller;
> +	#interrupt-cells =3D <1>;
> +
> +	interrupt-parent =3D <&periph_intc>;
> +	interrupts =3D <31>, <0>, <1>, <2>, <3>;
> +	clock =3D <&periph_osc>;
> +};
> diff --git a/Documentation/devicetree/bindings/timer/brcm,bcm6345-tim=
er.txt b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
> new file mode 100644
> index 0000000..03250dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/brcm,bcm6345-timer.txt
> @@ -0,0 +1,47 @@
> +Broadcom BCM6345 Timer
> +
> +This block is a timer that is connected to one interrupt on the main=
 interrupt
> +controller and functions as a programmable interrupt controller for =
timer
> +events.
> +
> +- 3 independent timers with their own maskable level interrupt bit (=
but not
> +  per CPU because there is only one parent interrupt and the timers =
share it)
> +
> +- 1 watchdog timer with an unmaskable level interrupt
> +
> +- Contains one enable/status word pair
> +
> +- No atomic set/clear operations
> +
> +The lack of per CPU ability of timers makes them unusable as a set o=
f
> +clockevent devices, otherwise they could be attached to the remainin=
g
> +interrupts.
> +
> +Required properties:
> +
> +- compatible: should be "brcm,bcm<soc>-timer", "brcm,bcm6345-timer"
> +- reg: specifies the base physical address and size of the registers=
, excluding
> +  the watchdog registers
> +- interrupt-controller: identifies the node as an interrupt controll=
er
> +- #interrupt-cells: specifies the number of cells needed to encode a=
n interrupt
> +  source, should be 1.
> +- interrupt-parent: specifies the phandle to the parent interrupt co=
ntroller(s)
> +  this one is cascaded from
> +- interrupts: specifies the interrupt line(s) in the interrupt-paren=
t controller
> +  node for the timer interrupt; valid values depend on the type of p=
arent
> +  interrupt controller
> +- clocks: phandle of timer reference clock (periph)
> +
> +Example:
> +
> +timer: timer@10000080 {
> +	compatible =3D "brcm,bcm63168-timer", "brcm,bcm6345-timer";
> +	reg =3D <0x10000080 0x1c>;
> +
> +	interrupt-controller;
> +	#interrupt-cells =3D <1>;
> +
> +	interrupt-parent =3D <&periph_intc>;
> +	interrupts =3D <0>;
> +	clock=B7=3D=B7<&periph_osc>;
> +};
> --=20
> 2.1.4
>=20
> --=20
> Simon Arlott
