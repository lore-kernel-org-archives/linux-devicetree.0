From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [1/3] ARM: dts: imx51-zii-common: create common include dtsi
Date: Wed, 27 Jun 2018 09:46:34 -0700
Message-ID: <CAHQ1cqH0o2rsVJWccR6dBXQCnp2-mmLNTNOi0uAOO2SSdz0+xA@mail.gmail.com>
References: <1529603100-31958-2-git-send-email-andrey.gusakov@cogentembedded.com>
 <5a3490a5-ee5c-a4da-8b54-b5234b7e50d0@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5a3490a5-ee5c-a4da-8b54-b5234b7e50d0@yandex.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: nikita.yoush@yandex.ru
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-imx@nxp.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Nikita:

Since you are mostly arguing against the suggestions I made to Andrey
Gusakov in off-list review, I'll respond.

On Wed, Jun 27, 2018 at 12:11 AM Nikita Yushchenko
<nikita.yoush@yandex.ru> wrote:
>
> > +     i2c_gpio: i2c-gpio {
> > +             compatible = "i2c-gpio";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&pinctrl_swi2c>;
> > +             i2c-gpio,delay-us = <50>;
> > +             status = "okay";
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +     };
>
> You add i2c-gpio node to dtsi file without defining gpios, with reference
> to pinctrl not defined inside your dtsi file or it's includes, and without
> any usage inside dtsi file.
>
> Saving several text lines that way is a bad idea.

There are three boards that share that configuration almost to a T,
with the only difference is the particular GPIOs used. Putting it into
a common file avoids repeating the boilerplate and makes it explicit
to the reader that those settings are shared.

> Please move it to where it is fully defined and used.
>

We are now starting to give Andrey Gusakov conflicting
recommendations. For the sake of moving forward, can we agree that
this and similar comments are relatively minor and defer to the
maintainers to make a call which way to go?
This way Andrey has a clear way on how to move forward with this set.

> > +&usb_vbus {
> > +     regulator-always-on;
>
> usb_vbus is regilator-fixed, what for is this?
>
> > +&uart2 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_uart2>;
> > +     status = "okay";
> > +};
>
> In your further patches you include this and then revert by marking &uart2 as
> disabled. Better to enable it in dts for boards that have it.
>

There are at least two boards that use that UART2 as is. Same as above
this was done to reduce boilerplate.

> Same with ecspi2, ipu and maybe more.
>

Ditto.

> > -     flash@1 {
> > -             #address-cells = <1>;
> > -             #size-cells = <1>;
> > -             compatible = "atmel,at45db642d", "atmel,at45", "atmel,dataflash";
> > -             spi-max-frequency = <25000000>;
> > -             reg = <1>;
> > -     };
>
> > +     flash@1 {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             compatible = "atmel,at45", "atmel,dataflash";
> > +             spi-max-frequency = <25000000>;
> > +             reg = <1>;
> > +     };
>
> Lost a compatible key?
>
> > -                     sysled0@3 {
> > -                             reg = <3>;
> > -                             label = "system:green:status";
> > -                             linux,default-trigger = "default-on";
> > -                     };
>
> > +                     sysled3: led3@3 {
> > +                             reg = <3>;
> > +                             label = "system:red:power";
> > +                             linux,default-trigger = "default-on";
> > +                     };
>
> > +&sysled3 {
> > +     label = "system:green:status";
>
> What for this label games?

Same as above. Avoiding unnecessary repetitions.

Thanks,
Andrey Smirnov
