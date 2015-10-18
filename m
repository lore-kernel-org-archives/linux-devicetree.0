From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCHv2 1/3] ARM: dt: fpga: Added binding docs for Xilinx Zynq
 FPGA manager.
Date: Sun, 18 Oct 2015 12:51:20 -0500
Message-ID: <20151018175120.GG12756@jcartwri.amer.corp.natinst.com>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
 <1445035350-3569-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445035350-3569-2-git-send-email-moritz.fischer@ettus.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, atull@opensource.altera.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 03:42:28PM -0700, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> 
> v2:
>  - Clock names are now a required property
>  - Removed interrupt-parent property
> 
> ---
>  .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> new file mode 100644
> index 0000000..7018aa8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.txt
> @@ -0,0 +1,19 @@
> +Xilinx Zynq FPGA Manager
> +
> +Required properties:
> +- compatible:		should contain "xlnx,zynq-devcfg-1.0"
> +- reg:			base address and size for memory mapped io
> +- interrupts:		interrupt for the FPGA manager device
> +- clocks:		phandle for clocks required operation

Technically a "clock specifier", but other than that:

Reviewed-by: Josh Cartwright <joshc@ni.com>

  Josh
