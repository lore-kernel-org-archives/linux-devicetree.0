From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: at91/dt: add mmc0 slot0 support to at91rm9200ek
 board
Date: Fri, 29 Nov 2013 11:30:00 +0100
Message-ID: <52986CA8.3010601@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com>	<1377687995-10758-1-git-send-email-b.brezillon@overkiz.com>	<20131120145926.GE14627@ns203013.ovh.net>	<528CDFFB.1020601@overkiz.com>	<CACRpkdboBg4YOnMNiar0DDBVnoky=zNky+Pzyp1=P_POtH15qQ@mail.gmail.com>	<528DE1C4.6060900@overkiz.com>	<CACRpkdZdweyWJefttiuiYAJ9qhahLbnj7eHUiLV_83UA41X_uQ@mail.gmail.com>	<5294D64D.7000100@overkiz.com> <CACRpkdZoAjuWVpWZfvPgOAd7qB1ZBtC+45nD3SYay3SrMhqwVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZoAjuWVpWZfvPgOAd7qB1ZBtC+45nD3SYay3SrMhqwVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Linus,

On 29/11/2013 11:03, Linus Walleij wrote:
> P=E5 tisdag, 26 Nov, 2013 vid 6:11 PM, skrev boris brezillon
> <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>:
>> Le 26/11/2013 14:46, Linus Walleij a =E9crit :
>>> But in this case it is a mechanical switch rather than a jumper?
>> Not exactly.
>>
>> The functionnaly selection (spi device or mmc slot) is done by the s=
oftware
>> using to the
>> PB22 pin:
>>   - set PB22 pin to 1 if you want to enable the mmc slot
>>   - set PB22 pin to 0 if you want to enable the spi device
> OK I got it wrong, I thought it was a mechanical switch. So this is a=
 GPIO
> line somekindof, you control it like this, and it will have effects o=
n the
> electronics.
>
> So to get the device running you need to both:
>
> - Switch the value of this GPIO line.
> - Switch pin control state.
>
> We are certain that the gpio_set_value() shall be used to set that GP=
IO
> line, because it does not control any pin control logic, it controls
> some electronics outside of the SoC, and that is outside the pin
> controller domain.
>
> I guess one way is to obtain this GPIO in board code and just
> flick it depending on which device you register.
>
> You can have GPIOs tied to the machine/board itself, see this
> fragment from arch/arm/boot/dts/ste-nomadik-s8815.dts:
>
>          /* Custom board node with GPIO pins to active etc */
>          usb-s8815 {
>                  /* This will bias the MMC/SD card detect line */
>                  mmcsd-gpio {
>                          gpios =3D <&gpio3 16 0x1>;
>                  };
>          };
>
> This GPIO needs to be driven high to bias the MMC/SD card.
> I solved it like this in the board code in
> arch/arm/mach-nomadik/cpu-8815.c:
>
> /*
>   * This GPIO pin turns on a line that is used to detect card inserti=
on
>   * on this board.
>   */
> static int __init cpu8815_mmcsd_init(void)
> {
>          struct device_node *cdbias;
>          int gpio, err;
>
>          cdbias =3D of_find_node_by_path("/usb-s8815/mmcsd-gpio");
>          if (!cdbias) {
>                  pr_info("could not find MMC/SD card detect bias node=
\n");
>                  return 0;
>          }
>          gpio =3D of_get_gpio(cdbias, 0);
>          if (gpio < 0) {
>                  pr_info("could not obtain MMC/SD card detect bias GP=
IO\n");
>                  return 0;
>          }
>          err =3D gpio_request(gpio, "card detect bias");
>          if (err) {
>                  pr_info("failed to request card detect bias GPIO %d\=
n", gpio);
>                  return -ENODEV;
>          }
>          err =3D gpio_direction_output(gpio, 0);
>          if (err){
>                  pr_info("failed to set GPIO %d as output, low\n", gp=
io);
>                  return err;
>          }
>          pr_info("enabled USB-S8815 CD bias GPIO %d, low\n", gpio);
>          return 0;
> }
> device_initcall(cpu8815_mmcsd_init);
>
> This is maybe not a perfect approach :-/
>
> But you get the idea. You could set this up one way or another
> depending on whether this board is registering a device for
> SPI or MMC.

The whole goal of moving from board files to dt is to drop all board
specific processing or initialization and only keep a common descriptio=
n
with generic drivers capable of handling common use cases.

I'm not sure providing new board specific drivers is a good solution
(even if it is the simplest way to achieve our goal).

Could we have something similar to pinctrl but with gpios :
when the device is probed the device/driver core code request the gpio
configure it appropriately and set it to the requested value (if config=
ured
as output).

Or even better, provide an external switch subsystem (with a gpio-switc=
h=20
driver)
and automate switch request/config in device/driver core code (as done=20
for the
pinctrl config).

These are just thoughts, and I guess introducing new code in the=20
device/driver core
code is not that easy, especially when this code is here to handle=20
specific case
like ours.

Thanks for sharing your thoughts.

Best Regards,

Boris

>
> Probably Jean-Christophe has opinions on this so let's see what
> he says.
>
>> If I understand correctly, you're suggesting to retrieve the PB22 pi=
n value
>> to decide
>> wether the mmc slot or the spi device is enabled. Is that right ?
> Forget about this, I didn't understand the real problem.
>
>> In the board version this was configured in the init_machine functio=
n (or
>> board init
>> function) depending on the MTD_AT91_DATAFLASH_CARD
>> (
>> http://lxr.free-electrons.com/source/arch/arm/mach-at91/board-rm9200=
ek.c#L173).
>> As a result it was not reconfigurable at runtime.
>>
>> But Jean-Christophe suggested to make it configurable at runtime (us=
ing dt
>> fragments).
> It should definately be set up at runtime, just a matter where and
> how.
>
> Yours,
> Linus Walleij

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
