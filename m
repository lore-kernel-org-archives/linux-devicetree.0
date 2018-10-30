From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] mfd: lochnagar: Add initial binding documentation
Date: Tue, 30 Oct 2018 14:10:30 +0100
Message-ID: <CACRpkdZGsD2uRmz3XL59KrLij6tFo0pT6rqVR99qFGxvitTUdQ@mail.gmail.com>
References: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181019095003.26046-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 19, 2018 at 11:50 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> +      gf-aif2-txdat, usb-aif1, usb-aif2, adat-aif, soundcard-aif,
> +
> +  - aif-master : Specifies that an AIF group will be used as a master
> +    interface (either this or aif-slave is required if a group is
> +    being muxed to an AIF)
> +  - aif-slave : Specifies that an AIF group will be used as a slave
> +    interface (either this or aif-master is required if a group is
> +    being muxed to an AIF)

This is not properly described as pin config parameters, but that is how
they are used in the driver. Please describe that this is supposed to
augment the pin config of the pins.

But I think it looks bogus. If the pins are already mixed to groups
like that:

> +       pin-settings: pin-settings {
> +               ap-aif {
> +                       aif-slave;
> +                       groups = "gf-aif1";
> +                       function = "codec-aif3";
> +               };
> +               codec-aif {
> +                       aif-master;
> +                       groups = "codec-aif3";
> +                       function = "gf-aif1";
> +               };
> +       };

OK so what the "special properties" above indicates is really the
direction of the pins, whether out (master) or in (slave".

Just use the standard bool pin config properties:
input-enable;
output-enable;

Reference
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

For this. If you want users to see that this is master and slave,
just /* Write a comment */ in the device tree.

Yours,
Linus Walleij
