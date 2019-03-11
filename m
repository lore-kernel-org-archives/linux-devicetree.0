From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Date: Mon, 11 Mar 2019 17:41:40 -0500
Message-ID: <20190311224140.GA23484@bogus>
References: <1552297257-145919-1-git-send-email-vishal.sagar@xilinx.com>
 <1552297257-145919-2-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552297257-145919-2-git-send-email-vishal.sagar@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Hyun Kwon <hyunk@xilinx.com>, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Michal Simek <michals@xilinx.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Mon, 11 Mar 2019 15:10:56 +0530, Vishal Sagar wrote:
> Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> 
> The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> ---
> v5
> - Incorporated comments by Luca Cersoli
> - Removed DPHY clock from description and example
> - Removed bayer pattern from device tree MIPI CSI IP
>   doesn't deal with bayer pattern.
> 
> v4
> - Added reviewed by Hyun Kwon
> 
> v3
> - removed interrupt parent as suggested by Rob
> - removed dphy clock
> - moved vfb to optional properties
> - Added required and optional port properties section
> - Added endpoint property section
> 
> v2
> - updated the compatible string to latest version supported
> - removed DPHY related parameters
> - added CSI v2.0 related property (including VCX for supporting upto 16
>   virtual channels).
> - modified csi-pxl-format from string to unsigned int type where the value
>   is as per the CSI specification
> - Defined port 0 and port 1 as sink and source ports.
> - Removed max-lanes property as suggested by Rob and Sakari
> 
>  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 118 +++++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
