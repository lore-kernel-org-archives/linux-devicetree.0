From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH_V3 1/4] dt-bindings: MIPS: Document xilfpga bindings and
 boot style
Date: Fri, 13 Nov 2015 08:52:08 -0600
Message-ID: <20151113145208.GA21683@rob-hp-laptop>
References: <1445859057-47665-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1445859057-47665-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445859057-47665-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 26, 2015 at 11:30:54AM +0000, Zubair Lutfullah Kakakhel wrote:
> Xilfpga boots only with device-tree. Document the required properties
> and the unique boot style
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> 
> ---
> V2->V3
> minor nitpicks. mips->MIPS. typo. reorder compatible strings in priority
> 
> V1->V2
> 
> Reformatted to 80 char column
> Correct clock phandle description
> Added digilent,nexys4ddr to get more specific about platform
> Added compatible string in example.
> ---
>  .../devicetree/bindings/mips/img/xilfpga.txt       | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/img/xilfpga.txt
> 
> diff --git a/Documentation/devicetree/bindings/mips/img/xilfpga.txt b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
> new file mode 100644
> index 0000000..57e7ee9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/img/xilfpga.txt
> @@ -0,0 +1,83 @@
> +Imagination University Program MIPSfpga
> +=======================================
> +
> +Under the Imagination University Program, a microAptiv UP core has been
> +released for academic usage.
> +
> +As we are dealing with a MIPS core instantiated on an FPGA, specifications
> +are fluid and can be varied in RTL.
> +
> +This binding document is provided as baseline guidance for the example
> +project provided by IMG.
> +
> +The example project runs on the Nexys4DDR board by Digilent powered by
> +the ARTIX-7 FPGA by Xilinx.
> +
> +Relevant details about the example project and the Nexys4DDR board:
> +
> +- microAptiv UP core m14Kc
> +- 50MHz clock speed
> +- 128Mbyte DDR RAM	at 0x0000_0000
> +- 8Kbyte RAM		at 0x1000_0000
> +- axi_intc		at 0x1020_0000
> +- axi_uart16550		at 0x1040_0000
> +- axi_gpio		at 0x1060_0000
> +- axi_i2c		at 0x10A0_0000
> +- custom_gpio		at 0x10C0_0000
> +- axi_ethernetlite	at 0x10E0_0000
> +- 8Kbyte BootRAM	at 0x1FC0_0000
> +
> +Required properties:
> +--------------------
> + - compatible: Must include "digilent,nexys4ddr","img,xilfpga".
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
> + - clocks: phandle to ext clock for fixed-clock received by MIPS core.
> +
> +Example:
> +
> +	compatible = "img,xilfpga","digilent,nexys4ddr";
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "mips,m14Kc";
> +			reg = <0>;
> +			clocks	= <&ext>;
> +		};
> +	};
> +
> +	ext: ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +
> +Boot protocol:
> +--------------
> +
> +The BootRAM is a writeable "RAM" in FPGA at 0x1FC0_0000.
> +This is for easy reprogrammibility via JTAG.
> +
> +The BootRAM initializes the cache and the axi_uart peripheral.
> +
> +DDR initialization is already handled by a HW IP block.
> +
> +When the example project bitstream is loaded, the cpu_reset button
> +needs to be pressed.
> +
> +The bootram initializes the cache and axi_uart.
> +Then outputs MIPSFPGA\n\r on the serial port on the Nexys4DDR board.
> +
> +At this point, the board is ready to load the Linux kernel
> +vmlinux file via JTAG.
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
