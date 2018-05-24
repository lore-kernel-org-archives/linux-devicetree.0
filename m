From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: RE: [PATCH 4/9] regulator: bd71837: Devicetree bindings for BD71837
 regulators
Date: Thu, 24 May 2018 17:30:57 +0000
Message-ID: <042F8805D2046347BB8420BEAE397A4016C06B47@WILL-MAIL002.REu.RohmEu.com>
References: <20180524055752.GE4249@localhost.localdomain>,<20180524140118.GS4828@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180524140118.GS4828@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org

Hello Mark,

First of all, thank you for taking your time to check the patches. I do
appreciate it. I find reading patches hard myself.

> From: Mark Brown [broonie@kernel.org]
> Sent: Thursday, May 24, 2018 5:01 PM
> 
> > On Thu, May 24, 2018 at 08:57:52AM +0300, Matti Vaittinen wrote:
>
> > +Required properties:
> > + - compatible: should be "rohm,bd71837-pmic".
> > + - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "ldo7"
>
> The MFD is for a single device, there should be no need for compatibles
> on subfunctions.

I will check this. I must admit I am not sure what is the de-facto mechanism
for assigning the correct device-tree nodes to sub devices if compatibles
are not used? I think I saw device-tree node name being used for regulators
but how is it done for example with clk? I would be grateful if anyone could
point me to right direction with this.

Also, another thing I was wondering is how supply regulators should be
handled? In this case the LDO5 is supplied by BUCK6 and LDO6 by
BUCK7. 

>From generic regulator bindings
/Documentation/devicetree/bindings/regulator/regulator.txt
I found statement:

> - <name>-supply: phandle to the parent supply/regulator node

and

> Regulator Consumers:
> Consumer nodes can reference one or more of its supplies/
> regulators using the below bindings.
>
> - <name>-supply: phandle to the regulator node
>
> These are the same bindings that a regulator in the above
> example used to reference its own supply, in which case
> ts just seen as a special case of a regulator being a
> consumer itself.

but I did not find handling for the supply properties from regulator core.
Thus I ended up hard coding the supply relation in driver. This means
that buck6 name must be fixed.

Br,
    Matti Vaittinen
