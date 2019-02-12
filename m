From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: fpga: Add bindings for ZynqMP fpga driver
Date: Tue, 12 Feb 2019 03:02:32 -0800
Message-ID: <CAAtXAHfUih0fWh6GhkRLKHb9epqhY_BnVzD-wBZ28rK+QY82LA@mail.gmail.com>
References: <20190211161736.23844-1-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211161736.23844-1-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: Alan Tull <atull@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rajan Vaja <rajanv@xilinx.com>, Jolly Shah <jollys@xilinx.com>, linux-fpga@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kishore m <chinnikishore369@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Nava,

a couple of nits inline. otherwise looks fine to me.

On Sun, Feb 10, 2019 at 8:17 AM Nava kishore Manne
<nava.manne@xilinx.com> wrote:
>
> Add documentation to describe Xilinx ZynqMP fpga driver
> bindings.
>
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
> Changes for v3:
>                 -Created patches on top of 5.0-rc5.
>                  No functional changes.
> Changes for v2:
>                 -Removed "----" separators.
> Changes for v1:
>                 -Created a Seperate(New) DT binding file as
>                  suggested by Rob.
>
> Changes for RFC-V2:
>                 -Moved pcap node as a child to firwmare
>                  node as suggested by Rob.
>
>  .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
>
> diff --git a/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> new file mode 100644
> index 0000000..1f6f588
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.txt
> @@ -0,0 +1,13 @@
> +Device Tree zynqmp-fpga bindings for the Zynq Ultrascale+ MPSoC controlled
> +using ZynqMP SoC firmware interface

How about:
Devicetree bindings for Zynq Ultrascale MPSoC FPGA Manager.

> +For Bitstream configuration on ZynqMp Soc uses processor configuration
> +port(PCAP) to configure the programmable logic(PL) through PS by using
> +FW interface.
ZynqMP or ZynqMp, let's stay consistent here.

How about:
The ZynqMP SoC uses the PCAP (Processor configuration Port) to configure the
Programmable Logic (PL). The configuration uses  the firmware interface.
> +
> +Required properties:
> +- compatible: should contain "xlnx,zynqmp-pcap-fpga"
> +
> +Example:
> +       zynqmp_pcap: pcap {
> +               compatible = "xlnx,zynqmp-pcap-fpga";
> +       };
> --
> 2.7.4
>

Thanks,
Moritz
