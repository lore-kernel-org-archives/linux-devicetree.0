From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/7] mhi_bus: controller: MHI support for QCOM modems
Date: Wed, 11 Jul 2018 13:36:25 -0600
Message-ID: <20180711193625.GC8659@rob-hp-laptop>
References: <1524795811-21399-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-1-git-send-email-sdias@codeaurora.org>
 <1531166894-30984-7-git-send-email-sdias@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531166894-30984-7-git-send-email-sdias@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sujeev Dias <sdias@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Tony Truong <truong@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 09, 2018 at 01:08:13PM -0700, Sujeev Dias wrote:
> QCOM PCIe based modems uses MHI as the communication protocol.
> MHI control driver is the bus master for such modems. As the bus
> master driver, it oversees power management operations
> such as suspend, resume, powering on and off the device.
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Reviewed-by: Tony Truong <truong@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/bus/mhi_qcom.txt |  58 +++

And this one in it's own patch.

>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/bus/Kconfig                                |   1 +
>  drivers/bus/mhi/Makefile                           |   1 +
>  drivers/bus/mhi/controllers/Kconfig                |  13 +
>  drivers/bus/mhi/controllers/Makefile               |   1 +
>  drivers/bus/mhi/controllers/mhi_qcom.c             | 461 +++++++++++++++++++++
>  drivers/bus/mhi/controllers/mhi_qcom.h             |  67 +++
>  8 files changed, 603 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/mhi_qcom.txt
>  create mode 100644 drivers/bus/mhi/controllers/Kconfig
>  create mode 100644 drivers/bus/mhi/controllers/Makefile
>  create mode 100644 drivers/bus/mhi/controllers/mhi_qcom.c
>  create mode 100644 drivers/bus/mhi/controllers/mhi_qcom.h
> 
> diff --git a/Documentation/devicetree/bindings/bus/mhi_qcom.txt b/Documentation/devicetree/bindings/bus/mhi_qcom.txt
> new file mode 100644
> index 0000000..0a48a50
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/mhi_qcom.txt
> @@ -0,0 +1,58 @@
> +Qualcomm Technologies Inc MHI Bus controller
> +
> +MHI control driver enables clients to communicate with external mode
> +using MHI protocol.
> +
> +==============
> +Node Structure
> +==============
> +
> +Main node properties:
> +
> +- reg
> +  Usage: required
> +  Value type: Array (5-cell PCI resource) of <u32>
> +  Definition: First cell is devfn, which is determined by pci bus topology.
> +	Assign the other cells 0 since they are not used.
> +
> +- qcom,smmu-cfg

This should probably be part of the SMMU binding?

> +  Usage: required
> +  Value type: <u32>
> +  Definition: Required SMMU configuration bitmask for PCIe bus.
> +	BIT mask:
> +	BIT(0) : Attach address mapping to endpoint device
> +	BIT(1) : Set attribute S1_BYPASS
> +	BIT(2) : Set attribute FAST
> +	BIT(3) : Set attribute ATOMIC
> +	BIT(4) : Set attribute FORCE_COHERENT
> +
> +- qcom,addr-win
> +  Usage: required if SMMU S1 translation is enabled
> +  Value type: Array of <u64>
> +  Definition: Pair of values describing iova start and stop address
> +
> +- MHI bus settings
> +  Usage: required
> +  Values: as defined by mhi.txt
> +  Definition: Per definition of devicetree/bindings/bus/mhi.txt, define device
> +	specific MHI configuration parameters.
> +
> +========
> +Example:
> +========
> +
> +/* pcie domain (root complex) modem connected to */
> +&pcie1 {
> +	/* pcie bus modem connected to */
> +	pci,bus@1 {
> +		reg = <0 0 0 0 0>;
> +
> +		qcom,mhi {
> +			reg = <0 0 0 0 0>;

2 levels of PCI addresses doesn't look right, but I can't really tell in 
your example. The addresses don't look valid.

> +			qcom,smmu-cfg = <0x3d>;
> +			qcom,addr-win = <0x0 0x20000000 0x0 0x3fffffff>;
> +
> +			<mhi bus configurations>
> +		};
> +	};
> +};
