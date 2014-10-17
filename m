From: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/2] Documentation: devicetree: Add bindings for Wi2Wi w2sg0004 gps
Date: Fri, 17 Oct 2014 12:16:42 +0200
Message-ID: <D65FF64A-856F-47EC-B3DE-7F2FCE505087@goldelico.com>
References: <1413491183-15018-1-git-send-email-marek@goldelico.com> <1413491183-15018-2-git-send-email-marek@goldelico.com> <20141017093714.GB4202@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141017093714.GB4202@leverpostej>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marek Belisko <marek@goldelico.com>, "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


Am 17.10.2014 um 11:37 schrieb Mark Rutland <mark.rutland@arm.com>:

> On Thu, Oct 16, 2014 at 09:26:23PM +0100, Marek Belisko wrote:
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> Signed-off-by: Marek Belisko <marek@goldelico.com>
>> ---
>> .../devicetree/bindings/misc/wi2wi,w2sg0004.txt    | 44 ++++++++++++=
++++++++++
>> 1 file changed, 44 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/misc/wi2wi,w2sg=
0004.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004.t=
xt b/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004.txt
>> new file mode 100644
>> index 0000000..e144441
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/wi2wi,w2sg0004.txt
>> @@ -0,0 +1,44 @@
>> +Wi2Wi GPS module connected through UART
>> +
>> +Required properties:
>> +- compatible: wi2wi,w2sg0004 or wi2wi,w2sg0084
>> +- pinctrl: specify two states (default and monitor). One is the def=
ault (UART) mode
>> +  and the other is for monitoring the RX line by an interrupt
>> +- on-off-gpio: the GPIO that controls the module's on-off toggle in=
put
>> +
>> +Optional properties:
>> +- lna-suppy: an (optional) LNA regulator that is enabled together w=
ith the GPS receiver
>> +
>> +example:
>> +
>> +        gps_receiver: w2sg0004 {
>> +                compatible =3D "wi2wi,w2sg0004";
>=20
> I couldn't spot "wi2wi" in
> Documentation/devicetree/bindings/vendor-prefixes.txt (in mainline).
>=20
> Could you please add it?
>=20
>> +                gpio-controller;
>> +                #gpio-cells =3D <2>;
>=20
> As far as I can see, these properties aren't necessary. This only
> consumes a GPIO, it doesn't provide any.

Well, it provides one GPIO. Sort of a "virtual=93 GPIO. It is needed so=
 that=20
it can be wired up to the DTR gpio of the UART driver (unfortunately th=
is
patch was reverted some months ago from mainline and we will reintroduc=
e
it soon).

The reason to solve it that way is that we did not want to have a direc=
t link
between this driver and any serial drivers or other mechanisms how driv=
ers
can detect that their serial port (/dev/tty*) is opened.

It is used to power down the w2sg GPS chip if no user space process is
accessing its serial port (or de-asserts DTR through tcsetattr/ioctl).

>=20
>> +
>> +                pinctrl-names =3D "default", "monitor";
>> +                pinctrl-0 =3D <&uart2_pins>;
>> +                pinctrl-1 =3D <&uart2_rx_irq_pins>;
>> +
>> +                interrupt-parent =3D <&gpio5>;
>> +                interrupts =3D <19 IRQ_TYPE_EDGE_FALLING>;  /* GPIO=
_147: RX - trigger on arrival of start bit */
>=20
> While interrupts is a standard property, please describe above how ma=
ny
> you expect and what their logical function is.
>=20
> The only part I'm confused about is how the link to the UART is
> described. I assume I'm just ignorant of some existing pattern.

The serial link itself is not described at all because it is assumed to=
 be a =84must have=93.
The driver only needs to monitor the RX line and needs to switch it bet=
ween UART and
GPIO/IRQ mode. So this monitoring switch is described (with two differe=
nt pinctrl states).

We know that it is a little tricky to control this chip correctly - and=
 we think this solution
is the most general (no direct dependency on the serial line, and just =
to pinmux states
and an interrupt).

>=20
> Otherwise this looks ok.
>=20
> Thanks,
> Mark.

Thanks as well,
Nikolaus

>=20
>> +                lna-supply =3D <&vsim>;	/* LNA regulator */
>> +                on-off-gpio =3D <&gpio5 17 0>;	/* GPIO_145: trigger=
 for turning on/off w2sg0004 */
>> +
>> +&pinmux {
>> +
>> +	uart2_pins: pinmux_uart2_pins {
>> +		pinctrl-single,pins =3D <
>> +			0x14a (PIN_INPUT | MUX_MODE0)		/* uart2_tx.uart2_rx */
>> +			0x148 (PIN_OUTPUT | MUX_MODE0)		/* uart2_tx.uart2_tx */
>> +		>;
>> +	};
>> +
>> +	uart2_rx_irq_pins: pinmux_uart2_rx_irq_pins {
>> +		pinctrl-single,pins =3D <
>> +			/* switch RX to GPIO so that we can get interrupts by the start =
bit */
>> +			0x14a (PIN_INPUT | MUX_MODE4)		/* uart2_tx.uart2_rx */
>> +		>;
>> +	};
>> +
>> +}
>> --=20
>> 1.9.1
