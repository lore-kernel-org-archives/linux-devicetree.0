From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/9] ARM: at91/dt: add mmc0 slot0 support to at91rm9200ek board
Date: Fri, 29 Nov 2013 11:03:07 +0100
Message-ID: <CACRpkdZoAjuWVpWZfvPgOAd7qB1ZBtC+45nD3SYay3SrMhqwVA@mail.gmail.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>
	<1377687995-10758-1-git-send-email-b.brezillon@overkiz.com>
	<20131120145926.GE14627@ns203013.ovh.net>
	<528CDFFB.1020601@overkiz.com>
	<CACRpkdboBg4YOnMNiar0DDBVnoky=zNky+Pzyp1=P_POtH15qQ@mail.gmail.com>
	<528DE1C4.6060900@overkiz.com>
	<CACRpkdZdweyWJefttiuiYAJ9qhahLbnj7eHUiLV_83UA41X_uQ@mail.gmail.com>
	<5294D64D.7000100@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5294D64D.7000100@overkiz.com>
Sender: linux-kernel-owner@vger.kernel.org
To: boris brezillon <b.brezillon@overkiz.com>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Joachim Eastwood <manabian@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

P=E5 tisdag, 26 Nov, 2013 vid 6:11 PM, skrev boris brezillon
<b.brezillon@overkiz.com>:
> Le 26/11/2013 14:46, Linus Walleij a =E9crit :

>> But in this case it is a mechanical switch rather than a jumper?
>
> Not exactly.
>
> The functionnaly selection (spi device or mmc slot) is done by the so=
ftware
> using to the
> PB22 pin:
>  - set PB22 pin to 1 if you want to enable the mmc slot
>  - set PB22 pin to 0 if you want to enable the spi device

OK I got it wrong, I thought it was a mechanical switch. So this is a G=
PIO
line somekindof, you control it like this, and it will have effects on =
the
electronics.

So to get the device running you need to both:

- Switch the value of this GPIO line.
- Switch pin control state.

We are certain that the gpio_set_value() shall be used to set that GPIO
line, because it does not control any pin control logic, it controls
some electronics outside of the SoC, and that is outside the pin
controller domain.

I guess one way is to obtain this GPIO in board code and just
flick it depending on which device you register.

You can have GPIOs tied to the machine/board itself, see this
fragment from arch/arm/boot/dts/ste-nomadik-s8815.dts:

        /* Custom board node with GPIO pins to active etc */
        usb-s8815 {
                /* This will bias the MMC/SD card detect line */
                mmcsd-gpio {
                        gpios =3D <&gpio3 16 0x1>;
                };
        };

This GPIO needs to be driven high to bias the MMC/SD card.
I solved it like this in the board code in
arch/arm/mach-nomadik/cpu-8815.c:

/*
 * This GPIO pin turns on a line that is used to detect card insertion
 * on this board.
 */
static int __init cpu8815_mmcsd_init(void)
{
        struct device_node *cdbias;
        int gpio, err;

        cdbias =3D of_find_node_by_path("/usb-s8815/mmcsd-gpio");
        if (!cdbias) {
                pr_info("could not find MMC/SD card detect bias node\n"=
);
                return 0;
        }
        gpio =3D of_get_gpio(cdbias, 0);
        if (gpio < 0) {
                pr_info("could not obtain MMC/SD card detect bias GPIO\=
n");
                return 0;
        }
        err =3D gpio_request(gpio, "card detect bias");
        if (err) {
                pr_info("failed to request card detect bias GPIO %d\n",=
 gpio);
                return -ENODEV;
        }
        err =3D gpio_direction_output(gpio, 0);
        if (err){
                pr_info("failed to set GPIO %d as output, low\n", gpio)=
;
                return err;
        }
        pr_info("enabled USB-S8815 CD bias GPIO %d, low\n", gpio);
        return 0;
}
device_initcall(cpu8815_mmcsd_init);

This is maybe not a perfect approach :-/

But you get the idea. You could set this up one way or another
depending on whether this board is registering a device for
SPI or MMC.

Probably Jean-Christophe has opinions on this so let's see what
he says.

> If I understand correctly, you're suggesting to retrieve the PB22 pin=
 value
> to decide
> wether the mmc slot or the spi device is enabled. Is that right ?

=46orget about this, I didn't understand the real problem.

> In the board version this was configured in the init_machine function=
 (or
> board init
> function) depending on the MTD_AT91_DATAFLASH_CARD
> (
> http://lxr.free-electrons.com/source/arch/arm/mach-at91/board-rm9200e=
k.c#L173).
> As a result it was not reconfigurable at runtime.
>
> But Jean-Christophe suggested to make it configurable at runtime (usi=
ng dt
> fragments).

It should definately be set up at runtime, just a matter where and
how.

Yours,
Linus Walleij
