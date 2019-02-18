From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: xilinx: Add the dt binding for
 Xilinx AI Engine
Date: Mon, 18 Feb 2019 15:17:39 -0600
Message-ID: <20190218211739.GA19490@bogus>
References: <1548119537-1788-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1548119537-1788-1-git-send-email-hyun.kwon@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 05:12:16PM -0800, Hyun Kwon wrote:
> Add the dt bindings for Xilinx AI Engine, which is a tile processor
> with many cores. The compatible string, 'xlnx,mathengine' is kept for
> backward compatibility as it's the legacy name.
> 
> Signed-off-by: Hyun Kwon <hyun.kwon@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>  .../devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt | 19 +++++++++++++++++++
>  MAINTAINERS                                           |  5 +++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> new file mode 100644
> index 0000000..fade9d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> @@ -0,0 +1,19 @@
> +Xilinx AI Engine
> +----------------
> +
> +The Xilinx AI Engine is a tile processor with many cores (up to 400) that
> +can run in parallel. The data routing between cores is configured through
> +internal switches, and shim tiles interface with external interconnect, such
> +as memory or PL.
> +
> +Required properties:
> +
> +- compatible: Must be "xlnx,ai_engine", or "xlnx,mathengine" for legacy name.

Use '-' rather than '_'. No legacy names. It didn't reviewed and we're 
not going to be stuck with it.

Only 1 version of the IP? The compatible should be more specific.

Are details like number of cores discoverable?

> +- reg: Physical base address and length of the registers set for the device.
> +
> +Example:
> +
> +	ai_engine@80000000 {
> +		compatible = "xlnx,ai_engine";
> +		reg = <0x0 0x80000000 0x0 0x20000000>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32d44447..d119d1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16040,6 +16040,11 @@ F:	Documentation/driver-api/uio-howto.rst
>  F:	drivers/uio/
>  F:	include/linux/uio_driver.h
>  
> +USERSPACE I/O (UIO) DRIVER FOR XILINX AI ENGINE
> +M:	Hyun Kwon <hyun.kwon@xilinx.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/xilinx/xlnx,ai_engine.txt
> +
>  UTIL-LINUX PACKAGE
>  M:	Karel Zak <kzak@redhat.com>
>  L:	util-linux@vger.kernel.org
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
