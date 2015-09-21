From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] Documentation: tps65912: Add DT bindings for the
 TPS65912 PMIC
Date: Tue, 22 Sep 2015 00:07:25 +0100
Message-ID: <20150921230725.GB11284@x1>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-2-git-send-email-afd@ti.com>
 <20150920041630.GE3039@x1>
 <56003101.50107@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56003101.50107@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Sep 2015, Andrew F. Davis wrote:
> On 09/19/2015 11:16 PM, Lee Jones wrote:
> >On Tue, 15 Sep 2015, Andrew F. Davis wrote:
> >
> >>The TPS65912 PMIC contains several regulators and a GPIO controller=
=2E
> >>Add bindings for the TPS65912 PMIC.
> >>
> >>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>---
> >>  .../devicetree/bindings/gpio/gpio-tps65912.txt     | 17 +++++++++
> >>  Documentation/devicetree/bindings/mfd/tps65912.txt | 43 +++++++++=
+++++++++++++
> >>  .../bindings/regulator/tps65912-regulator.txt      | 32 +++++++++=
+++++++
> >>  3 files changed, 92 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-tp=
s65912.txt
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/tps65912=
=2Etxt
> >>  create mode 100644 Documentation/devicetree/bindings/regulator/tp=
s65912-regulator.txt

[...]

> >>+Optional nodes:
> >>+ - Regulators: Documentation/devicetree/bindings/regulator/tps6591=
2-regulator.txt
> >>+ - GPIO: Documentation/devicetree/bindings/gpio/gpio-tps65912.txt.
> >
> >Better to use ../gpio, ../regulator, etc.
> >
> >"Regulators" and "GPIO" aren't valid node names.
> >
> >Please be more specific.
> >
>=20
> OK, I'll see if I can clear this up.

[...]

> >>+Optional properties:
> >>+ - Any optional property defined in bindings/regulator/regulator.t=
xt
> >
> >../regulator/...
> >
>=20
> Not really sure what you mean here?

Same as above.  Use "../regulator/regulator.txt" instead.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
