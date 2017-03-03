From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/4] fpga dt: bindings for Altera Partial
 Reconfiguration IP.
Date: Fri, 3 Mar 2017 01:03:46 -0600
Message-ID: <20170303070346.i7qdyyvx4bxn36na@rob-hp-laptop>
References: <1488470232-20412-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1488470232-20412-4-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488470232-20412-4-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: atull@opensource.altera.com, moritz.fischer@ettus.com, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Thu, Mar 02, 2017 at 07:57:11AM -0800, matthew.gerlach@linux.intel.com wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> 
> Device Tree bindings for Altera Partial Reconfiguration IP.
> 
> v3: s/altr,pr-ip/altr,a10-pr-ip/
> v2: s/Reconfiguraion/Reconfiguration/
> ====================

The version info should go after the '---'. Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/fpga/altera-pr-ip.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
> 
> diff --git a/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
> new file mode 100644
> index 0000000..52a294c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fpga/altera-pr-ip.txt
> @@ -0,0 +1,12 @@
> +Altera Arria10 Partial Reconfiguration IP
> +
> +Required properties:
> +- compatible : should contain "altr,a10-pr-ip"
> +- reg        : base address and size for memory mapped io.
> +
> +Example:
> +
> +	fpga_mgr: fpga-mgr@ff20c000 {
> +		compatible = "altr,a10-pr-ip";
> +		reg = <0xff20c000 0x10>;
> +	};
> -- 
> 2.7.4
> 
