From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 1/3] doc: dt: fpga: Added Documentation for Xilinx Zynq
 FPGA manager.
Date: Mon, 12 Oct 2015 09:33:41 -0700
Message-ID: <20151012163341.GK15287@xsjsorenbubuntu>
References: <1444344307-22509-1-git-send-email-moritz.fischer@ettus.com>
 <1444344307-22509-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444344307-22509-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@opensource.altera.com, atull@opensource.altera.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-10-09 at 12:45AM +0200, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../bindings/fpga/xilinx-zynq-fpga-mgr.txt         | 26 ++++++++++++=
++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-zyn=
q-fpga-mgr.txt
>=20
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-=
mgr.txt b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.t=
xt
> new file mode 100644
> index 0000000..82ffda8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> @@ -0,0 +1,26 @@
> +Xilinx Zynq FPGA Manager
> +
> +Required properties:
> +- compatible:		should contain "xlnx,zynq-devcfg-1.0"
> +- reg:			base address and size for memory mapped io
> +- interrupt parent:	interrupt source phandle
> +- interrupts:		interrupt for the FPGA manager device
> +- clocks:		phandle for clocks required operation
> +- syscon:		phandle for access to SLCR registers
> +
> +Optional properties:
> +- clock-names:		names for clocks

Is it optional? Currently, there is only one clock input, so a match
without specifying a clock name should work making this optional. But i=
n
your implementation, you do specify a clock name in devm_clk_get(). I'm
not entirely sure, but that call might fail if it doesn't find the
corresponding clock-names property.
I think, either we should make this required and list the required
entries here. Or the implementation probably needs to drop the clock
name when looking up its input clock.

	S=C3=B6ren
