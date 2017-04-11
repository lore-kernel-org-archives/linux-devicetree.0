From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Tue, 11 Apr 2017 09:54:50 +0200
Message-ID: <CACRpkdZXCaDp9skij_TkvK4UX=nA937xHkp_5xVN7mRT_kqq8Q@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491401247-7030-4-git-send-email-jacopo+renesas@jmondi.org> <20170410181215.e6cihbv2rfljbm3b@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170410181215.e6cihbv2rfljbm3b@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 10, 2017 at 8:12 PM, Rob Herring <robh@kernel.org> wrote:
> On Wed, Apr 05, 2017 at 04:07:21PM +0200, Jacopo Mondi wrote:

>> +  The allowed generic formats for a pin multiplexing sub-node are the
>> +  following ones:
>> +
>> +  node-1 {
>> +      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
>> +      GENERIC_PINCONFIG;
>
> What's GENERIC_PINCONFIG? I see this in some other binding docs, but not
> used anywhere. If this is a boolean property then get rid of the all
> caps. If this is a define, then don't use complex defines that expand to
> dts source.

I guess it is a wildcard for everything under the heading in
"Generic pin configuration node content"
in Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

I'm all for documenting it properly.

It's kind of useful, but I don't know the recent ambtions about being
formal with DT bindings. The GPIO bindings are just over the top
with BNF notation in its formalism. Dunno what is best here :/

Yours,
Linus Walleij
