From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv3 1/3] dt-bindings: display: Intel FPGA VIP drm driver
 Devicetree bindings
Date: Mon, 17 Jul 2017 12:44:51 -0500
Message-ID: <20170717174451.ka5bhdobc67ktisu@rob-hp-laptop>
References: <1499910047-25936-1-git-send-email-hean.loong.ong@intel.com>
 <1499910047-25936-2-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499910047-25936-2-git-send-email-hean.loong.ong@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: hean.loong.ong@intel.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ong@rob-hp-laptop
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 09:40:45AM +0800, hean.loong.ong@intel.com wrote:
> From: "Ong, Hean Loong" <hean.loong.ong@intel.com>
> 
> Device tree binding for Intel FPGA Video and Image
> Processing Suite. The binding involved would be generated
> from the Altera (Intel) Qsys system. The bindings would
> set the max width, max height, buts per pixel and memory
> port width. The device tree binding only supports the Intel
> Arria10 devkit and its variants. Vendor name retained as
> altr.
> 
> Signed-off-by: Ong, Hean Loong <hean.loong.ong@intel.com>
> ---
>  .../devicetree/bindings/display/altr,vip-fb2.txt   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/altr,vip-fb2.txt b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
> new file mode 100644
> index 0000000..ce249fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/altr,vip-fb2.txt
> @@ -0,0 +1,41 @@
> +Intel Video and Image Processing(VIP) Frame Buffer II bindings
> +
> +Supported hardware: Arria 10 and above with display port IP
> +
> +The hardware associated with this device tree is a SoC FPGA. Where there is an ARM controller
> +and a FPGA device. The ARM controller would host the Linux OS while the FPGA device runs on its
> +individual IP firmware. In the Intel VIP Frame Buffer II the ARM controller would be 
> +driving data from the Linux OS to the FPGA device programmed with the Frame Buffer II IP
> +to render pixels to be streamed to the Display Port connector.
> +
> +The DRM driver for the Arria 10 devkit would require the display resolution

Bindings are for h/w, not drivers and DRM is a Linuxism.

> +and pixel information to be included as these values are generated based
> +on the FPGA design that drives the video connector attached to the DRM driver.
> +
> +The Frame Buffer II device is a simple frame buffer device. The device contains the display
> +properties and the bridge or connector register. The output for this device currently 
> +is a dedicated to a single Display Port.
> +
> +More information the FPGA video IP component can be acquired from
> +https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_vip.pdf  							 
> +
> +Required properties:
> +----------------------------
> +- compatible: "altr,vip-frame-buffer-2.0"
> +- reg: Physical base address and length of the framebuffer controller's
> +  registers.
> +- altr,max-width: The width of the framebuffer in pixels.
> +- altr,max-height: The height of the framebuffer in pixels.
> +- altr,bits-per-symbol: only "8" is currently supported

If only 8 is supported, then you don't need this property. You can 
always add it later.

> +- altr,mem-port-width = the bus width of the avalon master port on the frame reader
> +
> +Example:
> +----------------------------
> +	dp_0_frame_buf: vip@100000280 {

display-controller@...

> +			compatible = "altr,vip-frame-buffer-2.0";
> +			reg = <0x00000001 0x00000280 0x00000040>;
> +			altr,max-width = <1280>;
> +			altr,max-height = <720>;
> +			altr,bits-per-symbol = <8>;
> +			altr,mem-port-width = <128>;
> +	};
> -- 
> 2.7.4
> 
