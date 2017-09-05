MIME-Version: 1.0
In-Reply-To: <1504532886.12356.17.camel@hp800z>
References: <1504532886.12356.17.camel@hp800z>
Date: Tue, 5 Sep 2017 15:34:07 -0500
Message-ID: <CAL_JsqJ78tnn+4vBb+BYXbYrpaTJW+h=FGryqRVG7zS2F6hi0w@mail.gmail.com>
Subject: Re: [RFC] yamldt and dts2yaml.
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 4, 2017 at 8:48 AM, Pantelis Antoniou <pantelis.antoniou@konsulko.com> wrote:
> Hi all,
>
> yamldt has a new minor release out (v0.3)
>
> The last minor release brought schema validation, and this one
> bring dts2yaml an automatic DTS to YAML conversion tool.
>
> The test-suite converts and compiles all the current DTS files in
> the kernel and out of the 1.3 thousand DTS files only 6 fail to
> convert (due to complex macro usage that make the source file look
> nothing like DTS).

Which ones are those? I don't want to see anything beyond defines that result in a single number.

> Conversion is extremely simple:
>
> $ dts2yaml -r bcm2837-rpi-3-b.dts
>
> Will convert the rpi-3 DTS file (and all the included files).
>
> $ ls *.yaml*
> bcm2835-rpi.yamli  bcm2837-rpi-3-b.yaml  bcm2837.yamli  bcm283x-rpi-smsc9514.yamli  bcm283x-rpi-usb-host.yamli  bcm283x.yamli
>
> $ cat bcm2837-rpi-3-b.dts
> /dts-v1/;
> #include "bcm2837.dtsi"
> #include "bcm2835-rpi.dtsi"
> #include "bcm283x-rpi-smsc9514.dtsi"
> #include "bcm283x-rpi-usb-host.dtsi"
>
> / {
>         compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
>         model = "Raspberry Pi 3 Model B";
>
>         memory {
>                 reg = <0 0x40000000>;
>         };
>
>         leds {
>                 act {
>                         gpios = <&gpio 47 0>;
>                 };
>         };
> };
>
> &uart1 {
>         status = "okay";
> };
>
> /* SDHCI is used to control the SDIO for wireless */
> &sdhci {
>         pinctrl-names = "default";
>         pinctrl-0 = <&emmc_gpio34>;
>         status = "okay";
>         bus-width = <4>;
>         non-removable;
> };
>
> /* SDHOST is used to drive the SD card */
> &sdhost {
>         pinctrl-names = "default";
>         pinctrl-0 = <&sdhost_gpio48>;
>         status = "okay";
>         bus-width = <4>;
> };
>
> $ cat bcm2837-rpi-3-b.yaml
> #include "bcm2837.yamli"
> #include "bcm2835-rpi.yamli"
> #include "bcm283x-rpi-smsc9514.yamli"
> #include "bcm283x-rpi-usb-host.yamli"
>
> compatible: [ "raspberrypi,3-model-b", "brcm,bcm2837" ]
> model: "Raspberry Pi 3 Model B"
>
> memory:
>   reg: [ 0, 0x40000000 ]
>
> leds:
>   act:
>     gpios: [ *gpio, 47, 0 ]
>
> *uart1:
>   status: "okay"
>
> # SDHCI is used to control the SDIO for wireless
> *sdhci:
>   pinctrl-names: "default"
>   pinctrl-0: *emmc_gpio34
>   status: "okay"
>   bus-width: 4
>   non-removable: true
>
> # SDHOST is used to drive the SD card
> *sdhost:
>   pinctrl-names: "default"
>   pinctrl-0: *sdhost_gpio48
>   status: "okay"
>   bus-width: 4
>
>
> For more take a look here.
>
> https://github.com/pantoniou/yamldt
>
> I am eagerly awaiting for your comments.

I have no comments because I have no use for this on its own. I want to see a schema definition and tools to check schema files. 

Rob
