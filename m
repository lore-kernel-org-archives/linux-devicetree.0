From: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/12] ARM: dts: STi: Add fake reg property for clocks
Date: Mon, 12 Feb 2018 09:22:55 -0600
Message-ID: <CABGGisxgejFHj0xQq-aBQETt9CX3OzLc3ER_Y9nyrw7FeLdt6g@mail.gmail.com>
References: <1518446590-16800-1-git-send-email-patrice.chotard@st.com> <1518446590-16800-11-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518446590-16800-11-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 12, 2018 at 8:43 AM,  <patrice.chotard-qxv4g6HH51o@public.gmane.org> wrote:
> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
>
> For all clock's element inside SoC, add a fake reg property,
> this allows to fix the following warnings when compiling
> dtb with W=1 option :
>
> arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
> arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
> arch/arm/boot/dts/stih410-b2120.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property
>
> arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
> arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
> arch/arm/boot/dts/stih410-b2260.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property
>
> arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-periphs missing or empty reg/ranges property
> arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-m-a9-ext2f-div2s missing or empty reg/ranges property
> arch/arm/boot/dts/stih418-b2199.dtb: Warning (simple_bus_reg):
> Node /clocks/clk-tmdsout-hdmi missing or empty reg/ranges property
>
> Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
> ---
>
> v2: _ add a fake reg property to node without reg property.
>
>  arch/arm/boot/dts/stih407-clock.dtsi | 9 ++++++---
>  arch/arm/boot/dts/stih410-clock.dtsi | 9 ++++++---
>  arch/arm/boot/dts/stih418-clock.dtsi | 9 ++++++---
>  3 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/stih407-clock.dtsi b/arch/arm/boot/dts/stih407-clock.dtsi
> index b882dcf3a649..1bba47e06ebe 100644
> --- a/arch/arm/boot/dts/stih407-clock.dtsi
> +++ b/arch/arm/boot/dts/stih407-clock.dtsi
> @@ -24,9 +24,10 @@
>                 /*
>                  * ARM Peripheral clock for timers
>                  */
> -               arm_periph_clk: clk-m-a9-periphs {
> +               arm_periph_clk: clk-m-a9-periphs@0 {
>                         #clock-cells = <0>;
>                         compatible = "fixed-factor-clock";
> +                       reg = <0 0>;

Don't do this. The correct fix is change the location of these nodes
to be under whatever controls them.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
