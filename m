From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [FOR 3.4 PATCH 5/6] atmel/nand: add DT support
Date: Sun, 29 Jan 2012 10:31:52 -0800
Message-ID: <CAPnjgZ0uTwFwaK2Dxdna7p6zrj9OZdV=CxT1eGsT+M5Aa+SJNA@mail.gmail.com>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1327727444-23908-5-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1327727444-23908-5-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jan 27, 2012 at 9:10 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> use a local copy of board informatin and fill with DT data
>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
> =A0.../devicetree/bindings/mtd/atmel-nand.txt =A0 =A0 =A0 =A0 | =A0 41 ++=
++++++
> =A0drivers/mtd/nand/atmel_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0107 ++++++++++++++++----
> =A02 files changed, 130 insertions(+), 18 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Docum=
entation/devicetree/bindings/mtd/atmel-nand.txt
> new file mode 100644
> index 0000000..a910ab9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -0,0 +1,41 @@
> +Atmel NAND flash
> +
> +Required properties:
> +- compatible : "atmel,at91rm9200-nand".
> +- reg : should specify localbus address and size used for the chip,
> + =A0 =A0 =A0 and if availlable the ECC.
> +- atmel,nand-addr-offset : offset for the address latch.
> +- atmel,nand-cmd-offset : offset for the command latch.
> +- #address-cells, #size-cells : Must be present if the device has sub-no=
des
> + =A0representing partitions.
> +
> +- gpios : specifies the gpio pins to control the NAND device. detect is =
an
> + =A0optional gpio and may be set to 0 if not present.

What does this mean please? What is 'detect' and what 'control' do the
gpios provide?

Below you have two GPIOs pioC 13 and pioC 14. I think the binding
should document the two GPIOs, the order, and what they are for.

> +
> +Optional properties:
> +- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by d=
efault.
> + =A0Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_f=
irst",
> + =A0"soft_bch".
> +- nand-bus-width : 8 or 16 bus width if not present 8
> +- nand-on-flash-bbt: boolean to enable on flash bbt option if not presen=
t false
> +
> +Examples:
> +nand0: nand@40000000,0 {
> + =A0 =A0 =A0 compatible =3D "atmel,at91rm9200-nand";
> + =A0 =A0 =A0 #address-cells =3D <1>;
> + =A0 =A0 =A0 #size-cells =3D <1>;
> + =A0 =A0 =A0 reg =3D <0x40000000 0x10000000
> + =A0 =A0 =A0 =A0 =A0 =A0 =A00xffffe800 0x200
> + =A0 =A0 =A0 =A0 =A0 =A0 >;
> + =A0 =A0 =A0 atmel,nand-addr-offset =3D <21>;
> + =A0 =A0 =A0 atmel,nand-cmd-offset =3D <22>;
> + =A0 =A0 =A0 nand-on-flash-bbt =3D <1>;
> + =A0 =A0 =A0 nand-ecc-mode =3D "soft";
> + =A0 =A0 =A0 gpios =3D <&pioC 13 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&pioC 14 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00

Sorry, I haven't seen this before, perhaps it is a standard thing in
Linux. Does 0 mean end of list? Can we not just use the property's
size value for this?

Regards,
Simon

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 >;
> + =A0 =A0 =A0 partition@0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ...
> + =A0 =A0 =A0 };
> +};
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index d3bde9b..ea7643a 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -27,6 +27,10 @@
> =A0#include <linux/module.h>
> =A0#include <linux/moduleparam.h>
> =A0#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of_mtd.h>
> =A0#include <linux/mtd/mtd.h>
> =A0#include <linux/mtd/nand.h>
> =A0#include <linux/mtd/partitions.h>
> @@ -83,7 +87,7 @@ struct atmel_nand_host {
> =A0 =A0 =A0 =A0struct mtd_info =A0 =A0 =A0 =A0 mtd;
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*io_base;
> =A0 =A0 =A0 =A0dma_addr_t =A0 =A0 =A0 =A0 =A0 =A0 =A0io_phys;
> - =A0 =A0 =A0 struct atmel_nand_data =A0*board;
> + =A0 =A0 =A0 struct atmel_nand_data =A0board;
> =A0 =A0 =A0 =A0struct device =A0 =A0 =A0 =A0 =A0 *dev;
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*ecc;
>
> @@ -101,8 +105,8 @@ static int cpu_has_dma(void)
> =A0*/
> =A0static void atmel_nand_enable(struct atmel_nand_host *host)
> =A0{
> - =A0 =A0 =A0 if (gpio_is_valid(host->board->enable_pin))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(host->board->enable_pin, 0);
> + =A0 =A0 =A0 if (gpio_is_valid(host->board.enable_pin))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(host->board.enable_pin, 0);
> =A0}
>
> =A0/*
> @@ -110,8 +114,8 @@ static void atmel_nand_enable(struct atmel_nand_host =
*host)
> =A0*/
> =A0static void atmel_nand_disable(struct atmel_nand_host *host)
> =A0{
> - =A0 =A0 =A0 if (gpio_is_valid(host->board->enable_pin))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(host->board->enable_pin, 1);
> + =A0 =A0 =A0 if (gpio_is_valid(host->board.enable_pin))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio_set_value(host->board.enable_pin, 1);
> =A0}
>
> =A0/*
> @@ -132,9 +136,9 @@ static void atmel_nand_cmd_ctrl(struct mtd_info *mtd,=
 int cmd, unsigned int ctrl
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0if (ctrl & NAND_CLE)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->io_base + (1 << host->boa=
rd->cle));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->io_base + (1 << host->boa=
rd.cle));
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->io_base + (1 << host->boa=
rd->ale));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->io_base + (1 << host->boa=
rd.ale));
> =A0}
>
> =A0/*
> @@ -145,8 +149,8 @@ static int atmel_nand_device_ready(struct mtd_info *m=
td)
> =A0 =A0 =A0 =A0struct nand_chip *nand_chip =3D mtd->priv;
> =A0 =A0 =A0 =A0struct atmel_nand_host *host =3D nand_chip->priv;
>
> - =A0 =A0 =A0 return gpio_get_value(host->board->rdy_pin) ^
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0!!host->board->rdy_pin_active_low;
> + =A0 =A0 =A0 return gpio_get_value(host->board.rdy_pin) ^
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0!!host->board.rdy_pin_active_low;
> =A0}
>
> =A0static void dma_complete_func(void *completion)
> @@ -432,6 +436,54 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, i=
nt mode)
> =A0 =A0 =A0 =A0}
> =A0}
>
> +static int __devinit atmel_of_init_port(struct atmel_nand_host *host,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct device_node *np)
> +{
> + =A0 =A0 =A0 u32 val;
> + =A0 =A0 =A0 int ecc_mode;
> + =A0 =A0 =A0 struct atmel_nand_data *board =3D &host->board;
> + =A0 =A0 =A0 enum of_gpio_flags flags;
> +
> + =A0 =A0 =A0 if (of_property_read_u32(np, "atmel,nand-addr-offset", &val=
) =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (val >=3D 32) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(host->dev, "invalid=
 addr-offset %u\n", val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->ale =3D val;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 if (of_property_read_u32(np, "atmel,nand-cmd-offset", &val)=
 =3D=3D 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (val >=3D 32) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(host->dev, "invalid=
 cmd-offset %u\n", val);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->cle =3D val;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ecc_mode =3D of_get_nand_ecc_mode(np);
> +
> + =A0 =A0 =A0 if (ecc_mode < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->ecc_mode =3D NAND_ECC_SOFT;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->ecc_mode =3D ecc_mode;
> +
> + =A0 =A0 =A0 board->on_flash_bbt =3D of_get_nand_on_flash_bbt(np);
> +
> + =A0 =A0 =A0 if (of_get_nand_bus_width(np) =3D=3D 16)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->bus_width_16 =3D 1;
> +
> + =A0 =A0 =A0 board->rdy_pin =3D of_get_gpio_flags(np, 0, &flags);
> + =A0 =A0 =A0 if (flags =3D=3D OF_GPIO_ACTIVE_LOW)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->rdy_pin_active_low =3D 1;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 board->rdy_pin_active_low =3D 0;
> +
> + =A0 =A0 =A0 board->enable_pin =3D of_get_gpio(np, 1);
> + =A0 =A0 =A0 board->det_pin =3D of_get_gpio(np, 2);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0/*
> =A0* Probe for the NAND device.
> =A0*/
> @@ -442,6 +494,7 @@ static int __init atmel_nand_probe(struct platform_de=
vice *pdev)
> =A0 =A0 =A0 =A0struct nand_chip *nand_chip;
> =A0 =A0 =A0 =A0struct resource *regs;
> =A0 =A0 =A0 =A0struct resource *mem;
> + =A0 =A0 =A0 struct mtd_part_parser_data ppdata =3D {};
> =A0 =A0 =A0 =A0int res;
>
> =A0 =A0 =A0 =A0mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -468,8 +521,15 @@ static int __init atmel_nand_probe(struct platform_d=
evice *pdev)
>
> =A0 =A0 =A0 =A0mtd =3D &host->mtd;
> =A0 =A0 =A0 =A0nand_chip =3D &host->nand_chip;
> - =A0 =A0 =A0 host->board =3D pdev->dev.platform_data;
> =A0 =A0 =A0 =A0host->dev =3D &pdev->dev;
> + =A0 =A0 =A0 if (pdev->dev.of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D atmel_of_init_port(host, pdev->dev.=
of_node);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (res)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_nand_ioremap;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&host->board, pdev->dev.platform_dat=
a,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(struct atmel_nand_dat=
a));
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0nand_chip->priv =3D host; =A0 =A0 =A0 =A0 /* link the priv=
ate data structures */
> =A0 =A0 =A0 =A0mtd->priv =3D nand_chip;
> @@ -480,10 +540,10 @@ static int __init atmel_nand_probe(struct platform_=
device *pdev)
> =A0 =A0 =A0 =A0nand_chip->IO_ADDR_W =3D host->io_base;
> =A0 =A0 =A0 =A0nand_chip->cmd_ctrl =3D atmel_nand_cmd_ctrl;
>
> - =A0 =A0 =A0 if (gpio_is_valid(host->board->rdy_pin))
> + =A0 =A0 =A0 if (gpio_is_valid(host->board.rdy_pin))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nand_chip->dev_ready =3D atmel_nand_device=
_ready;
>
> - =A0 =A0 =A0 nand_chip->ecc.mode =3D host->board->ecc_mode;
> + =A0 =A0 =A0 nand_chip->ecc.mode =3D host->board.ecc_mode;
>
> =A0 =A0 =A0 =A0regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> =A0 =A0 =A0 =A0if (!regs && nand_chip->ecc.mode =3D=3D NAND_ECC_HW) {
> @@ -508,7 +568,7 @@ static int __init atmel_nand_probe(struct platform_de=
vice *pdev)
>
> =A0 =A0 =A0 =A0nand_chip->chip_delay =3D 20; =A0 =A0 =A0 =A0 =A0 =A0 /* 2=
0us command delay time */
>
> - =A0 =A0 =A0 if (host->board->bus_width_16) =A0/* 16-bit bus width */
> + =A0 =A0 =A0 if (host->board.bus_width_16) =A0 /* 16-bit bus width */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nand_chip->options |=3D NAND_BUSWIDTH_16;
>
> =A0 =A0 =A0 =A0nand_chip->read_buf =3D atmel_read_buf;
> @@ -517,15 +577,15 @@ static int __init atmel_nand_probe(struct platform_=
device *pdev)
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, host);
> =A0 =A0 =A0 =A0atmel_nand_enable(host);
>
> - =A0 =A0 =A0 if (gpio_is_valid(host->board->det_pin)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (gpio_get_value(host->board->det_pin)) {
> + =A0 =A0 =A0 if (gpio_is_valid(host->board.det_pin)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (gpio_get_value(host->board.det_pin)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_INFO "No Smart=
Media card inserted.\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0res =3D -ENXIO;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_no_card;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (host->board->on_flash_bbt || on_flash_bbt) {
> + =A0 =A0 =A0 if (host->board.on_flash_bbt || on_flash_bbt) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_INFO "atmel_nand: Use On Flash=
 BBT\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nand_chip->bbt_options |=3D NAND_BBT_USE_F=
LASH;
> =A0 =A0 =A0 =A0}
> @@ -600,8 +660,9 @@ static int __init atmel_nand_probe(struct platform_de=
vice *pdev)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0mtd->name =3D "atmel_nand";
> - =A0 =A0 =A0 res =3D mtd_device_parse_register(mtd, NULL, 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->board->parts, host->b=
oard->num_parts);
> + =A0 =A0 =A0 ppdata.of_node =3D pdev->dev.of_node;
> + =A0 =A0 =A0 res =3D mtd_device_parse_register(mtd, NULL, &ppdata,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->board.parts, host->bo=
ard.num_parts);
> =A0 =A0 =A0 =A0if (!res)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return res;
>
> @@ -645,11 +706,21 @@ static int __exit atmel_nand_remove(struct platform=
_device *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +#if defined(CONFIG_OF)
> +static const struct of_device_id atmel_nand_dt_ids[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "atmel,at91rm9200-nand" },
> + =A0 =A0 =A0 { /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, atmel_nand_dt_ids);
> +#endif
> +
> =A0static struct platform_driver atmel_nand_driver =3D {
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __exit_p(atmel_nand_remove),
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "atmel_nand",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D of_match_ptr(atmel_nand=
_dt_ids),
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.7.7
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
