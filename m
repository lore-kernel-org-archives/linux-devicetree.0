From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: reset: Add bindings for ZynqMP reset
 driver
Date: Mon, 21 Jan 2019 09:46:04 -0600
Message-ID: <20190121154604.GA30149@bogus>
References: <20190121173835.21173-1-nava.manne@xilinx.com>
 <20190121173835.21173-4-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121173835.21173-4-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mark.rutland@arm.com, michals@xilinx.com, RAJANV@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JOLLYS@xilinx.com, chinnikishore369@gmail.com, robh+dt@kernel.org, Nava kishore Manne <nava.manne@xilinx.com>, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Jan 2019 23:08:32 +0530, Nava kishore Manne wrote:
> Add documentation to describe Xilinx ZynqMP reset driver
> bindings.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> ---
> Changes for v3:
> 		-Moved reset outputs definitions info into
> 		 a header file(xlnx-zynqmp-resets.h).
> 
>  .../bindings/reset/xlnx,zynqmp-reset.txt      |  52 +++++++
>  .../dt-bindings/reset/xlnx-zynqmp-resets.h    | 130 ++++++++++++++++++
>  2 files changed, 182 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/xlnx,zynqmp-reset.txt
>  create mode 100644 include/dt-bindings/reset/xlnx-zynqmp-resets.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
