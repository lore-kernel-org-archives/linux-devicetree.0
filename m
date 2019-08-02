From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: stm32: Fix missing 'clocks'
 property in examples
Date: Sat, 3 Aug 2019 00:31:16 +0200
Message-ID: <CACRpkdYsYH_z55+OeHzAp9bjj+0WrnH8LoXcEahVcX=in6TTEQ@mail.gmail.com>
References: <20190716215618.29757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716215618.29757-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 16, 2019 at 11:56 PM Rob Herring <robh@kernel.org> wrote:

> Now that examples are validated against the DT schema, an error with
> required 'clocks' property missing is exposed:
>
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@40020000: gpio@0: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@1000: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@2000: 'clocks' is a required property
>
> Add the missing 'clocks' properties to the examples to fix the errors.
>
> Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>

This seems to already be upstream, but I have no memory of applying it.
Less work for me :)

Yours,
Linus Walleij
