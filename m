From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH] pinctrl: dt: at91: new binding
Date: Sat, 7 Mar 2015 00:49:55 +0800
Message-ID: <AB034DC5-9E4C-4883-BBF0-B93B438C7A54@jcrosoft.com>
References: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
 <54F9C2FE.8060804@atmel.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <54F9C2FE.8060804@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas FERRE <nicolas.ferre@atmel.com>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


> On Mar 6, 2015, at 11:08 PM, Nicolas Ferre <nicolas.ferre@atmel.com> wrot=
e:
> =

> Le 26/02/2015 10:34, Jean-Christophe PLAGNIOL-VILLARD a =E9crit :
>> Today if we want to disable a pio bank we may will siliently break pinct=
rl
>> configuration in the DT. This will be detected only at runtime.
>> =

>> So move the pinctrl configuration to the bank instead of the bus.
>> This allow to detect pinctrl issue at DT compiling time when disable a b=
ank.
>> =

>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: devicetree@vger.kernel.org
>> ---
>> .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 66 ++++++++++++++++=
++++++
>> 1 file changed, 66 insertions(+)
>> =

>> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>> index b7a93e8..78355ee 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>> @@ -148,3 +148,69 @@ dbgu: serial@fffff200 {
>> 	pinctrl-0 =3D <&pinctrl_dbgu>;
>> 	status =3D "disabled";
>> };
>> +
>> +II) New Bindings per PIO Block
> =

> Sorry but NACK.
> =

> I don't want to manage another flavor of the pinmux biding with no real
> benefit. I would have been good if we had it from day-1. Now it's too lat=
e.

yes we do, we catch but a compiling time instead of RUNTIME which is critic=
al

so I=92ll pass on the NACK

> =

> Moreover, splitting a binding definition if you have a function given by
> multiple banks can be weird and not well understood in regard to our
> current group+function definition scheme (Cf. your last example).
> =


Others already do so and this is not complex at all

Best Regards,
J.

> =

>> +This allow to detect pinctrl issue at DT compiling time when disable a =
bank
>> +
>> +Required properties for iomux controller:
>> +- compatible: "atmel,at91rm9200-pio-pinctrl" or "atmel,at91sam9x5-pio-p=
inctrl"
>> +		or "atmel,sama5d3-pio-pinctrl"
>> +- atmel,mux-mask: array of mask (periph per bank) to describe if a pin =
can be
>> +  configured in this periph mode. All the periph and bank need to be de=
scribe.
>> +
>> +How to create such array:
>> +
>> +Each column will represent the possible peripheral of the pinctrl for t=
he bank
>> +
>> +Take an example on the 9260
>> +Peripheral: 2 ( A and B)
>> +=3D>
>> +
>> +  /*    A         B     */
>> +  0xffffffff 0xffc00c3b  /* pioA */
>> +
>> +For each peripheral/bank we will descibe in a u32 if a pin can be
>> +configured in it by putting 1 to the pin bit (1 << pin)
>> +
>> +Required properties for pin configuration node:
>> +- atmel,pins: 3 integers array, represents a group of pins mux and conf=
ig
>> +  setting. The format is atmel,pins =3D <PIN_NUM PERIPH CONFIG>.
>> +  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph B...
>> +
>> +Bits used for CONFIG:
>> +cf atmel,at91-pinctrl
>> +
>> +pioB: gpio@fffff600 {
>> +	compatible =3D "atmel,at91rm9200-gpio", "atmel,at91rm9200-pio-pinctrl";
>> +	reg =3D <0xfffff600 0x200>;
>> +	interrupts =3D <3 IRQ_TYPE_LEVEL_HIGH 1>;
>> +	#gpio-cells =3D <2>;
>> +	gpio-controller;
>> +	interrupt-controller;
>> +	#interrupt-cells =3D <2>;
>> +	clocks =3D <&pioB_clk>;
>> +
>> +			 /*    A         B     */
>> +	atmel,mux-mask =3D <0xffffffff 0x7fff3ccf>;
>> +
>> +	dbgu {
>> +		pinctrl_dbgu: dbgu-0 {
>> +			atmel,pins =3D
>> +				<14 0x1 0x0	/* PB14 periph A */
>> +				 15 0x1 0x1>;	/* PB15 periph A with pullup */
>> +		};
>> +	};
>> +};
>> +
>> +dbgu: serial@fffff200 {
>> +	compatible =3D "atmel,at91sam9260-usart";
>> +	reg =3D <0xfffff200 0x200>;
>> +	interrupts =3D <1 4 7>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pinctrl_dbgu>;
>> +	status =3D "disabled";
>> +};
>> +
>> +if you have to use multiple bank
>> +	pinctrl-0 =3D <&pinctrl_ip_piaa>, <&pinctrl_ip_piab>;
>> =

> =

> Best regards,
> -- =

> Nicolas Ferre
> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
