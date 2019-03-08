Return-Path: <SRS0=TKor=RL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:54246 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfCHMvN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Mar 2019 07:51:13 -0500
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v2 3/4] pinctrl: mcp23s08: work around GPIO line naming
Date: Fri, 08 Mar 2019 13:51:10 +0100
MIME-Version: 1.0
Message-ID: <4b2df0d7-76ba-4a39-87fa-e5e6baaecc70@cesnet.cz>
In-Reply-To: <20190307223515.653197dc@windsurf>
References: <cover.1551966076.git.jan.kundrat@cesnet.cz>
 <517dcdda21ea0b0df884bc6adcba1dadb78b66b1.1551966077.git.jan.kundrat@cesnet.cz>
 <20190307223515.653197dc@windsurf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Mika Westerberg <mika.westerberg@linux.intel.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On =C4=8Dtvrtek 7. b=C5=99ezna 2019 22:35:15 CET, Thomas Petazzoni wrote:
> Hello Jan,
>
> On Thu, 7 Mar 2019 14:31:02 +0100
> Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz> wrote:
>
>> +Line naming
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Because several gpio_chip instances are hidden below a single device tree=

>
> Mentioning a Linux specific data structure (gpio_chip here) in a Device
> Tree binding documentation does not seem like a good idea. Bindings are
> supposed to be OS-agnostic.

Hi Thomas, that's a fair comment. On the other hand, this driver's DT=20
bindings are already quite Linux specific with their=20
"microchip,spi-present-mask" workaround. The way I understand this, Linux=20
does not support multiple child devices "within" one SPI slave. If there=20
was proper support for this, this patch would be superfluous.

I, too, would love to see this driver changed so that the bindings look,=20
e.g., like this:

  gpio_spi_chips: gpio@1 {
    compatible =3D "microchip,mcp23s17-multiple";

    gpio-bank@1 {
      compatible =3D "microchip,mcp23s17";
      reg =3D <1>;
      interrupt-parent =3D <&gpio1>;
      interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
      interrupt-controller;
      #interrupt-cells =3D <2>;
      gpio-controller;
      #gpio-cells =3D <2>;
      microchip,irq-mirror;
      drive-open-drain;
      spi-max-frequency =3D <10000000>;
      gpio-line-names =3D
        "foo",
        //...
        ;
       random_pin {
         gpio-hog;
         gpios =3D <6 GPIO_ACTIVE_HIGH>;
         input;
         line-name =3D "this hogs just one pin";
       };
    };

    gpio-bank@2 {
      compatible =3D "microchip,mcp23s17";
      reg =3D <2>;
      interrupt-parent =3D <&gpio1>;
      interrupts =3D <22 IRQ_TYPE_LEVEL_LOW>;
      interrupt-controller;
      #interrupt-cells =3D <2>;
      gpio-controller;
      #gpio-cells =3D <2>;
      microchip,irq-mirror;
      drive-open-drain;
      spi-max-frequency =3D <10000000>;
      gpio-line-names =3D
        "bar",
        //...
        ;
    };

However, I am not volunteering to do this work -- that's quite out of my=20
league and available time.

With kind regards,
Jan
