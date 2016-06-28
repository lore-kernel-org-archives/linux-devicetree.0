From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 18/19] sh: IO-DATA HDL-U (a,k.a landisk) support
Date: Tue, 28 Jun 2016 09:51:25 +0200
Message-ID: <CAMuHMdWUr5=GSjtWD1RTuWGPiqKUh3nmwAULUNxECP3kHtHw5g@mail.gmail.com>
References: <1467095795-5082-1-git-send-email-ysato@users.sourceforge.jp> <1467095795-5082-19-git-send-email-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1467095795-5082-19-git-send-email-ysato@users.sourceforge.jp>
Sender: linux-sh-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Linux-sh list <linux-sh@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sato-san,

On Tue, Jun 28, 2016 at 8:36 AM, Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../interrupt-controller/iodata-landisk.txt        | 34 ++++++++++
>  arch/sh/boot/dts/Makefile                          |  2 +
>  arch/sh/boot/dts/landisk.dts                       | 62 ++++++++++++++++++
>  drivers/irqchip/Makefile                           |  2 +-
>  drivers/irqchip/irq-io-landisk.c                   | 73 ++++++++++++++++++++++
>  5 files changed, 172 insertions(+), 1 deletion(-)

This needs to be split in two (or three) patches:
  - irqchip driver and DT
  - arch/sh

>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/iodata-landisk.txt
>  create mode 100644 arch/sh/boot/dts/landisk.dts
>  create mode 100644 drivers/irqchip/irq-io-landisk.c
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/iodata-landisk.txt b/Documentation/devicetree/bindings/interrupt-controller/iodata-landisk.txt
> new file mode 100644
> index 0000000..9f87f2c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/iodata-landisk.txt
> @@ -0,0 +1,34 @@
> +DT bindings for the I/O DATA HDL-U interrupt controller
> +
> +Required properties:
> +
> +  - compatible: has to be "iodata,landisk-intc".
> +
> +  - reg: Base address and length of interrupt controller register.
> +
> +  - interrupt-controller: Identifies the node as an interrupt controller.
> +
> +  - #address-cells: has to be <0>.

Why do you need #address-cells? There are no subnodes.

> +
> +  - #interrupt-cells: has to be <1>: an interrupt index.
> +
> +  - interrupt-map: Interrupt mapping on parent controller.

> --- /dev/null
> +++ b/arch/sh/boot/dts/landisk.dts
> @@ -0,0 +1,62 @@
> +/dts-v1/;
> +
> +#include "sh7751.dtsi"
> +
> +/ {
> +       model = "I/O DATA HDL-U";
> +       compatible = "iodata,hdl-u";
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       interrupt-parent = <&shintc>;
> +       chosen {
> +               stdout-path = &sci1;
> +               bootargs = "console=ttySC1,115200";

The console= parameter can be removed from bootargs.
You can specify the console speed using

        stdout-path = "&sci1:115200";

> +       };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
