From: Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] xtensa: standardize devicetree cpu compatible strings
Date: Mon, 2 Dec 2013 07:00:48 +0400
Message-ID: <CAMo8BfKq5LP2ZAi64cRuC5BLbt9D=_HZ5FgrBSHu3zzJJVujsw@mail.gmail.com>
References: <5c50a0a2748086d0d24b3c532bad1d4d1c78a91b.1385885196.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5c50a0a2748086d0d24b3c532bad1d4d1c78a91b.1385885196.git.baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Chris Zankel <chris-YvXeqwSYzG2sTnJN9+BGXg@public.gmane.org>, "linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org" <linux-xtensa-PjhNF2WwrV/0Sa2dR60CXw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 1, 2013 at 12:13 PM, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org> wrote:
> The recommended compatible string format, according to the ePAPR v1.1 standard,
> is "manufacturer,model". Change the xtensa cpu compatible strings to
> "cdns,xtensa-cpu". Also, change the boards compatible strings in a similar way.
>
> The pic compatible string will be dealt with in a separate patch.
>
> Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> ---
>
> v2:
>     Omit the change of pic compatible strings, as this we be handled by Max
>     Filippov no top of his xtensa-smp tree moving the pic driver to
>     drivers/ipqchip/.
>
>     Remove support for old compatible strings.
> ---

Thanks, taken to my xtensa tree.

>  arch/xtensa/boot/dts/lx60.dts        | 2 +-
>  arch/xtensa/boot/dts/ml605.dts       | 2 +-
>  arch/xtensa/boot/dts/xtfpga.dtsi     | 4 ++--
>  arch/xtensa/platforms/xtfpga/setup.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/xtensa/boot/dts/lx60.dts b/arch/xtensa/boot/dts/lx60.dts
> index 2eab365..a0f8b8a 100644
> --- a/arch/xtensa/boot/dts/lx60.dts
> +++ b/arch/xtensa/boot/dts/lx60.dts
> @@ -3,7 +3,7 @@
>  /include/ "xtfpga-flash-4m.dtsi"
>
>  / {
> -       compatible = "xtensa,lx60";
> +       compatible = "cdns,xtensa-lx60";
>         memory@0 {
>                 device_type = "memory";
>                 reg = <0x00000000 0x04000000>;
> diff --git a/arch/xtensa/boot/dts/ml605.dts b/arch/xtensa/boot/dts/ml605.dts
> index 6ed51d6..905c3a5 100644
> --- a/arch/xtensa/boot/dts/ml605.dts
> +++ b/arch/xtensa/boot/dts/ml605.dts
> @@ -3,7 +3,7 @@
>  /include/ "xtfpga-flash-16m.dtsi"
>
>  / {
> -       compatible = "xtensa,ml605";
> +       compatible = "cdns,xtensa-ml605";
>         memory@0 {
>                 device_type = "memory";
>                 reg = <0x00000000 0x08000000>;
> diff --git a/arch/xtensa/boot/dts/xtfpga.dtsi b/arch/xtensa/boot/dts/xtfpga.dtsi
> index 7eda6ec..3d8659e 100644
> --- a/arch/xtensa/boot/dts/xtfpga.dtsi
> +++ b/arch/xtensa/boot/dts/xtfpga.dtsi
> @@ -1,5 +1,5 @@
>  / {
> -       compatible = "xtensa,xtfpga";
> +       compatible = "cdns,xtensa-xtfpga";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         interrupt-parent = <&pic>;
> @@ -17,7 +17,7 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 cpu@0 {
> -                       compatible = "xtensa,cpu";
> +                       compatible = "cdns,xtensa-cpu";
>                         reg = <0>;
>                         /* Filled in by platform_setup from FPGA register
>                          * clock-frequency = <100000000>;
> diff --git a/arch/xtensa/platforms/xtfpga/setup.c b/arch/xtensa/platforms/xtfpga/setup.c
> index 74bb74f..25d936e 100644
> --- a/arch/xtensa/platforms/xtfpga/setup.c
> +++ b/arch/xtensa/platforms/xtfpga/setup.c
> @@ -168,7 +168,7 @@ void __init platform_calibrate_ccount(void)
>         long clk_freq = 0;
>  #ifdef CONFIG_OF
>         struct device_node *cpu =
> -               of_find_compatible_node(NULL, NULL, "xtensa,cpu");
> +               of_find_compatible_node(NULL, NULL, "cdns,xtensa-cpu");
>         if (cpu) {
>                 u32 freq;
>                 update_clock_frequency(cpu);
> --
> 1.8.4.3
>

-- 
Thanks.
-- Max
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
