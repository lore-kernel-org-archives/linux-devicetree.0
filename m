From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH 1/5] dt-bindings: MIPS: Document xilfpga bindings and boot style
Date: Sun, 18 Oct 2015 09:47:19 -0700
Message-ID: <CAAtXAHdcUKmjtXZMV2xVyb5nvebSZgWbO_rW0aKoywLUmaU11w@mail.gmail.com>
References: <1444827117-10939-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1444827117-10939-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444827117-10939-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: ralf@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-mips@linux-mips.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Zubair,

On Wed, Oct 14, 2015 at 5:51 AM, Zubair Lutfullah Kakakhel
<Zubair.Kakakhel@imgtec.com> wrote:
> Xilfpga boots only with device-tree. Document the required properties
> and the unique boot style
>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  .../devicetree/bindings/mips/img/xilfpga.txt       | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt
>
> diff --git a/Documentation/devicetree/bindings/mips/img/xilfpga.txt b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
> new file mode 100644
> index 0000000..1e7084c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
> @@ -0,0 +1,76 @@
> +Imagination University Program MIPSFpga
> +=======================================
> +
> +Under the Imagination University Program, a microAptiv UP core has been released for academic usage.
> +
> +As we are dealing with a mips core instantiated on an FPGA, specifications are fluid and can be varied in RTL.
> +
> +This binding document is provided as baseline guidance for the example project provided by IMG.
> +
> +The example project runs on the Nexys4DDR board by Digilent powered by the ARTIX-7 FPGA by Xilinx.
> +
> +Relevant details about the example project and the Nexys4DDR board:
> +
> +- microAptiv UP core m14Kc
> +- 50MHz clock speed
> +- 128Mbyte DDR RAM     at 0x0000_0000
> +- 8Kbyte RAM           at 0x1000_0000
> +- axi_intc             at 0x1020_0000
> +- axi_uart16550                at 0x1040_0000
> +- axi_gpio             at 0x1060_0000
> +- axi_i2c              at 0x10A0_0000
> +- custom_gpio          at 0x10C0_0000
> +- axi_ethernetlite     at 0x10E0_0000
> +- 8Kbyte BootRAM       at 0x1FC0_0000
> +
> +Required properties:
> +--------------------
> + - compatible: Must include "img,xilfpga".
> +
> +CPU nodes:
> +----------
> +A "cpus" node is required.  Required properties:
> + - #address-cells: Must be 1.
> + - #size-cells: Must be 0.
> +A CPU sub-node is also required for at least CPU 0. Required properties:
> + - device_type: Must be "cpu".
> + - compatible: Must be "mips,m14Kc".
> + - reg: Must be <0>.
> + - clocks: Must include the CPU clock.  See ../../clock/clock-bindings.txt for
> +   details on clock bindings.
I think the reference to clock binding docs is not required.

> + - ext clock handle for fixed-clock received by MIPS core.
> +Example:
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "mips,m14Kc";
> +                       reg = <0>;
> +                       clocks  = <&ext>;
> +               };
> +       };
> +
> +       ext: ext {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <50000000>;
> +       };
> +
> +Boot protocol:
> +--------------
> +
> +The BootRAM is a writeable "RAM" in FPGA at 0x1FC0_0000. This is for easy reprogrammibility via JTAG.
> +
> +The BootRAM inializes the cache and the axi_uart peripheral.
> +
> +DDR initialiation is already handled by a HW IP block.
> +
> +When the example project bitstream is loaded, the cpu_reset button needs to be pressed.
> +
> +The bootram initializes the cache and axi_uart. Then outputs MIPSFPGA\n\r on the serial port
> +on the Nexys4DDR board.
> +
> +At this point, the board is ready to load the Linux kernel vmlinux file via JTAG.
> +
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Cheers,

Moritz
