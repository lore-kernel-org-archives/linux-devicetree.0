From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: fpga: add xilinx slave-serial
 binding description
Date: Mon, 27 Feb 2017 16:39:59 -0600
Message-ID: <20170227223959.pyrcsafiks2jxcgu@rob-hp-laptop>
References: <1487759951-20711-1-git-send-email-agust@denx.de>
 <1487759951-20711-2-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1487759951-20711-2-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 11:39:10AM +0100, Anatolij Gustschin wrote:
> Add dt binding documentation details for Xilinx FPGA configuration
> over slave serial interface.
> 
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> ---
> Changes in v3:
> 
>  - extend example to show the usage in SPI master node, connected
>    to the fpga-region node
> 
> Changes in v2:
> 
>  - correct gpios properties in example to match above description
> 
>  - use fpga-mgr@0 instead of fpga-spi@0 in example
> 
>  .../bindings/fpga/xilinx-slave-serial.txt          | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/xilinx-slave-serial.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
