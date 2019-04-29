From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv1 2/6] dt-bindings, firmware: add Intel Stratix10 remote
 system update binding
Date: Mon, 29 Apr 2019 12:48:21 -0500
Message-ID: <20190429174821.GA22717@bogus>
References: <1554835562-25056-1-git-send-email-richard.gong@linux.intel.com>
 <1554835562-25056-3-git-send-email-richard.gong@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554835562-25056-3-git-send-email-richard.gong@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: richard.gong@linux.intel.com
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, dinguyen@kernel.org, atull@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Richard Gong <richard.gong@intel.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 09, 2019 at 01:45:58PM -0500, richard.gong@linux.intel.com wrote:
> From: Richard Gong <richard.gong@intel.com>
> 
> Add a device tree binding for the Intel Stratix10 remote system
> update (RSU) driver
> 
> Signed-off-by: Richard Gong <richard.gong@intel.com>
> Reviewed-by: Alan Tull <atull@kernel.org>
> ---
>  .../bindings/firmware/intel,stratix10-rsu.txt      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt b/Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt
> new file mode 100644
> index 0000000..b6250eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/intel,stratix10-rsu.txt
> @@ -0,0 +1,31 @@
> +Intel Remote System Update Driver for Stratix10 SoC
> +============================================
> +The Intel Remote System Update (RSU) driver exposes interfaces
> +accessed through the Intel Service Layer to user space via sysfs
> +interface. The RSU interfaces report and control some of the optional
> +RSU features on Intel Stratix 10 SoC.
> +
> +The RSU feature provides a way for customers to update the boot
> +configuration of a Intel Stratix 10 SoC device with significantly reduced
> +risk of corrupting the bitstream storage and bricking the system.
> +
> +Required properties:
> +-------------------
> +The rsu node has the following mandatory properties, must be located under
> +the firmware/svc node.
> +
> +- compatible: "intel,stratix10-rsu"
> +
> +Example:
> +-------
> +	firmware {
> +		svc {
> +			compatible = "intel,stratix10-svc";
> +			method = "smc";
> +			memory-region = <&service_reserved>;
> +
> +			rsu: rsu {
> +				compatible = "intel,stratix10-rsu";

There's no DT resources, so why does this need to be in DT. Just make 
the driver for the parent instantiate the driver for this.

Rob
