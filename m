From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/6] dt-bindings: nvmem: Add bindings for ZynqMP nvmem
 driver
Date: Mon, 21 Jan 2019 09:47:10 -0600
Message-ID: <20190121154710.GA31999@bogus>
References: <20190121173835.21173-1-nava.manne@xilinx.com>
 <20190121173835.21173-6-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121173835.21173-6-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mark.rutland@arm.com, michals@xilinx.com, RAJANV@xilinx.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JOLLYS@xilinx.com, chinnikishore369@gmail.com, robh+dt@kernel.org, Nava kishore Manne <nava.manne@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 21 Jan 2019 23:08:34 +0530, Nava kishore Manne wrote:
> Add documentation to describe Xilinx ZynqMP nvmem driver
> bindings.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
> Changes for v3:
> 		-Added nvmem node as child of FW. Since nvmem driver is a provider.
>   
>  .../bindings/nvmem/xlnx,zynqmp-nvmem.txt      | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/xlnx,zynqmp-nvmem.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
