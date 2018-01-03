From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/6] irqchip: Add the ingenic-tcu-intc driver
Date: Wed, 03 Jan 2018 22:50:04 +0100
Message-ID: <1515016205.1642.1@smtp.crapouillou.net>
References: <20171229125942.27305-2-paul@crapouillou.net>
        <20180101143344.2099-1-paul@crapouillou.net>
        <20180101143344.2099-3-paul@crapouillou.net>
        <20180103205817.4hnoyyomtwmhri76@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103205817.4hnoyyomtwmhri76@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,


Le mer. 3 janv. 2018 =E0 21:58, Rob Herring <robh@kernel.org> a =E9crit :
> On Mon, Jan 01, 2018 at 03:33:41PM +0100, Paul Cercueil wrote:
>>  This simple driver handles the IRQ chip of the TCU
>>  (Timer Counter Unit) of the JZ47xx Ingenic SoCs.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   .../bindings/interrupt-controller/ingenic,tcu.txt  |  32 +++++
>>   drivers/irqchip/Kconfig                            |   6 +
>>   drivers/irqchip/Makefile                           |   1 +
>>   drivers/irqchip/irq-ingenic-tcu.c                  | 151=20
>> +++++++++++++++++++++
>>   4 files changed, 190 insertions(+)
>>   create mode 100644=20
>> Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
>>   create mode 100644 drivers/irqchip/irq-ingenic-tcu.c
>>=20
>>   v2: Use SPDX identifier for the license
>>       Make KConfig option select CONFIG_IRQ_DOMAIN since we depend=20
>> on it
>>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt=
=20
>> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
>>  new file mode 100644
>>  index 000000000000..a3e6318f8461
>>  --- /dev/null
>>  +++=20
>> b/Documentation/devicetree/bindings/interrupt-controller/ingenic,tcu.txt
>>  @@ -0,0 +1,32 @@
>>  +Ingenic SoCs Timer/Counter Unit Interrupt Controller
>>  +
>>  +Required properties:
>>  +
>>  +- compatible : should be "ingenic,<socname>-tcu-intc". Valid=20
>> strings are:
>>  +  * ingenic,jz4740-tcu-intc
>>  +  * ingenic,jz4770-tcu-intc
>>  +  * ingenic,jz4780-tcu-intc
>>  +- interrupt-controller : Identifies the node as an interrupt=20
>> controller
>>  +- #interrupt-cells : Specifies the number of cells needed to=20
>> encode an
>>  +  interrupt source. The value shall be 1.
>>  +- interrupt-parent : phandle of the interrupt controller.
>>  +- interrupts : Specifies the interrupt the controller is connected=20
>> to.
>>  +
>>  +Example:
>>  +
>>  +/ {
>>  +	regmap {
>=20
> regmap is a Linuxism.

Should I just call it "mfd" then? (or better, "mfd@10002000")


>>  +		compatible =3D "simple-mfd", "syscon";
>=20
> Need a specific compatible string here. Neither of these are valid by
> themselves.

So a compatible string not used by any driver? Something like=20
"ingenic,tcu"?
Would I need to document it too? (it's just a simple-mfd after all)


>>  +		reg =3D <0x10002000 0x1000>;
>>  +
>>  +		tcu: interrupt-controller {
>=20
> The TCU is only an interrupt controller?

The TCU is a multi-function silicon. It has 8 channels, each one with=20
its own
interrupt line, demultiplexed from 2-3 parent IRQs (depending on the=20
SoC).
The TCU IRQ driver handles this.

Each channel has a clock, that can be reparented, reclocked, and gated.
That's the job for the TCU clocks driver.

Being hardware timers, they can be used for accounting and timekeeping=20
within
Linux, that's the job for the clocksource driver.

The TCU block also feeds the clocks to the watchdog and the OST (a=20
separate
timer block, not handled here).

Each channel can be configured as PWM. A future patchset will convert=20
the PWM
driver for Ingenic SoCs to use the TCU clocks and regmap provided by=20
these
new drivers.

If your remark was only reffering to the name of the node handle, I can=20
rename
it to "tcu_intc", there's no problem.

>>  +			compatible =3D "ingenic,jz4740-tcu-intc";
>=20
> Is there a register range associated with this block? If so, add a reg
> property even if regmap doesn't need it.

Sure.

Thanks for the review!

-Paul
=
