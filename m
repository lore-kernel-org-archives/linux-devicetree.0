From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Thu, 1 Mar 2018 15:18:23 -0600
Message-ID: <20180301211823.g5dl5xvtbkhofrpb@rob-hp-laptop>
References: <1519154467-2896-1-git-send-email-jollys@xilinx.com>
 <1519154467-2896-2-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1519154467-2896-2-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jolly Shah <jolly.shah@xilinx.com>
Cc: ard.biesheuvel@linaro.org, mingo@kernel.org, gregkh@linuxfoundation.org, matt@codeblueprint.co.uk, sudeep.holla@arm.com, hkallweit1@gmail.com, keescook@chromium.org, dmitry.torokhov@gmail.com, michal.simek@xilinx.com, mark.rutland@arm.com, devicetree@vger.kernel.org, rajanv@xilinx.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 20, 2018 at 11:21:04AM -0800, Jolly Shah wrote:
> Add documentation to describe Xilinx ZynqMP firmware driver
> bindings. Firmware driver provides an interface to firmware
> APIs. Interface APIs can be used by any driver to communicate
> to PMUFW (Platform Management Unit).
> 
> Signed-off-by: Jolly Shah <jollys@xilinx.com>
> Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> ---
>  .../firmware/xilinx/xlnx,zynqmp-firmware.txt       | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.txt

Reviewed-by: Rob Herring <robh@kernel.org>
