From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v3 2/3] dt-bindings: fpga: Add bindings for ZynqMP
 nvmem driver
Date: Thu, 27 Sep 2018 14:21:04 -0500
Message-ID: <20180927192104.GA7898@bogus>
References: <20180922134149.5693-1-nava.manne@xilinx.com>
 <20180922134149.5693-3-nava.manne@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180922134149.5693-3-nava.manne@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, srinivas.kandagatla@linaro.org, jollys@xilinx.com, rajanv@xilinx.com, sboyd@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 22, 2018 at 07:11:48PM +0530, Nava kishore Manne wrote:
> Add documentation to describe Xilinx ZynqMP nvmem driver
> bindings.
> 
> Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
> ---
> Changes for v3:
> 		-None.
> Changes for v2:
>                 -Moved nvmem_firmware node as a child to
>                  firwmare node.
> 
>  .../firmware/xilinx/xlnx,zynqmp-firmware.txt  | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)

There are various components of the zynqmp firmware bindings being sent 
separately. I cannot review it piece by piece. So please the firmware 
bindings as a complete set. Really, I mainly need to see a complete 
example.

Rob
