From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: Document the Synopsys GPIO via CREG bindings
Date: Thu, 30 Aug 2018 10:43:42 +0200
Message-ID: <CACRpkdbQryY-R+14GvYAEkLH+7Tr4Pvb6YohWouTwug7qEGbDA@mail.gmail.com>
References: <20180828112721.28178-1-Eugeniy.Paltsev@synopsys.com> <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828112721.28178-3-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy.Paltsev@synopsys.com
Cc: "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 1:27 PM Eugeniy Paltsev
<Eugeniy.Paltsev@synopsys.com> wrote:

> +++ b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> @@ -0,0 +1,49 @@
> +GPIO via CREG (Control REGisers) driver

Speling

Also should be "Synopsys GPIO via CREG" as this is likely just
for Synopsys and not general purpose.

> +This is is single-register MMIO GPIO driver to control such strangely mapped
> +outputs:
> +
> +31            11        8         7        5         0   < bit number
> +|              |        |         |        |         |
> +[   not used   | gpio-1 | shift-1 | gpio-0 | shift-0 ]   < 32 bit MMIO register
> +                   ^                  ^
> +                   |                  |
> +                   |           write 0x2 == set output to "1" (on)
> +                   |           write 0x3 == set output to "0" (off)
> +                   |
> +            write 0x1 == set output to "1" (on)
> +            write 0x4 == set output to "0" (off)

Move this documentation into the driver instead.

> +Required properties:
> +- compatible : "snps,creg-gpio"
> +- reg : Exactly one register range with length 0x4.
> +- #gpio-cells : Should be one - the pin number.
> +- gpio-controller : Marks the device node as a GPIO controller.

OK

> +- snps,ngpios: Number of GPIO pins.

Use the existing ngpios attribute for this, see gpio.txt

> +- snps,bit-per-line: Number of bits per each gpio line (see picture).
> +  Array the size of "snps,ngpios"
> +- snps,shift: Shift (in bits) of the each GPIO field from the previous one in
> +  register (see picture). Array the size of "snps,ngpios"
> +- snps,on-val: Value should be set in corresponding field to set
> +  output to "1" (see picture). Array the size of "snps,ngpios"
> +- snps,off-val: Value should be set in corresponding field to set
> +  output to "0" (see picture). Array the size of "snps,ngpios"

Move this into a lookup table in the driver instead, and match
the lookup table to the compatible string. The format of the
register is known for a certain compatible, right?

> +Optional properties:
> +- snps,default-val: default output field values. Array the size of "snps,ngpios"

Default values for different lines can be achieved by hogs
if it's OK to tie them up perpetually, else work on creating generic
inialization values in gpio.txt and implement that in
gpiolib-of.c for everyone. This discussion comes up from time
to time.

Yours,
Linus Walleij
