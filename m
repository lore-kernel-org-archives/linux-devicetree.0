From: Paul Thomas <pthomas8589@gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: zynqmp: DT: Add Xilinx AMS node
Date: Tue, 21 May 2019 09:26:44 -0400
Message-ID: <CAD56B7dw4kTRuXeKXyT6KbEP9E=B=KqpamL14d96LjGgAfrbGQ@mail.gmail.com>
References: <1555943870-15353-1-git-send-email-manish.narani@xilinx.com> <1555943870-15353-4-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555943870-15353-4-git-send-email-manish.narani@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, Jisheng.Zhang@synaptics.com, olof@lixom.net, dinguyen@kernel.org, amit.kucheria@linaro.org, stefan.popa@analog.com, dmurphy@ti.com, marcus.folkesson@gmail.com, tmaimon77@gmail.com, ricardo@ribalda.com, xc-racer2@live.ca, contact@artur-rojek.eu, geert@linux-m68k.org, smohanad@codeaurora.org, charles-antoine.couret@essensium.com, stefan@agner.ch, max.krummenacher@toradex.com, lee.jones@linaro.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Manish,

Thank you for posting this! It is very much needed in the mainline
kernel, nice work.

On Mon, Apr 22, 2019 at 10:54 AM Manish Narani <manish.narani@xilinx.com> wrote:
>
> The Xilinx AMS includes an ADC as well as on-chip sensors that can be
> used to sample external and monitor on-die operating conditions, such as
> temperature and supply voltage levels.
>
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 9aa6734..f776913 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -625,5 +625,31 @@
>                         reg = <0x0 0xfd4d0000 0x0 0x1000>;
>                         timeout-sec = <10>;
>                 };
> +
> +               xilinx_ams: ams@ffa50000 {
> +                       compatible = "xlnx,zynqmp-ams";
> +                       status = "disabled";
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <0 56 4>;
> +                       interrupt-names = "ams-irq";
> +                       reg = <0x0 0xffa50000 0x0 0x800>;
> +                       reg-names = "ams-base";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       #io-channel-cells = <1>;
> +                       ranges = <0 0 0xffa50800 0x800>;
> +
> +                       ams_ps: ams-ps@0,0 {
> +                               compatible = "xlnx,zynqmp-ams-ps";
> +                               status = "disabled";
> +                               reg = <0 0x400>;
> +                       };
> +
> +                       ams_pl: ams-pl@1,0 {
> +                               compatible = "xlnx,zynqmp-ams-pl";
> +                               status = "disabled";
> +                               reg = <0x400 0x400>;
> +                       };
> +               };
>         };
>  };
> --
> 2.1.1
>
I tested this with an older 4.18 kernel, and with a slightly different
devicetree (shown below) it seems to be working.

        xilinx_ams: ams@ffa50000 {
                compatible = "xlnx,zynqmp-ams";
                status = "okay";
                interrupt-parent = <&gic>;
                interrupts = <0 56 4>;
                interrupt-names = "ams-irq";
                reg = <0x0 0xffa50000 0x0 0x800>;
                reg-names = "ams-base";

                #address-cells = <2>;
                #size-cells = <2>;
                ranges;

                ams_ps: ams_ps@ffa50800 {
                        compatible = "xlnx,zynqmp-ams-ps";
                        reg = <0x0 0xffa50800 0x0 0x400>;
                };

                ams_pl: ams_pl@ffa50c00 {
                        compatible = "xlnx,zynqmp-ams-pl";
                        reg = <0x0 0xffa50c00 0x0 0x400>;
                };

Also I needed to have the clock defined "clocks = <&clk 70>;".

For the temperatures I get in_temp0_raw, in_temp1_raw and in_temp2 do
these correspond to channels 7,8 & 21 in the devicetree documentation?

thanks,
Paul
