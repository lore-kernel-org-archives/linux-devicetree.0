From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 2/3] dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
Date: Fri, 22 May 2015 07:43:40 +0200
Message-ID: <555EC20C.6010703@xilinx.com>
References: <1432251450-26352-1-git-send-email-moritz.fischer@ettus.com>
 <1432251450-26352-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432251450-26352-3-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>, jassisinghbrar@gmail.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, michal.simek@xilinx.com, soren.brinkmann@xilinx.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, arnd@arndb.de, joe@perches.com, jingoohan1@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/22/2015 01:37 AM, Moritz Fischer wrote:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  .../bindings/mailbox/xilinx-mailbox.txt         | 40 ++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

IRC the rule was to send binding first and then the driver.

> diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> new file mode 100644
> index 0000000..e559743
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
> @@ -0,0 +1,40 @@
> +Xilinx Mailbox Driver
> +=====================
> +
> +Required properties:
> +- compatible :	"xlnx,mailbox-2.1".
> +- reg : 	physical base address of the mailbox and length of
> +		memory mapped region.
> +- #mbox-cells:	Common mailbox binding property to identify the number
> +		of cells required for the mailbox specifier. Should be 1.
> +
> +Optional properties:
> +- interrupt-parent :	interrupt source phandle.
> +- interrupts :		interrupt number. The interrupt specifier format

please be consistent with spacing around :. It doesn't look nice.

> +			depends on the interrupt controller parent.
> +
> +Example:
> +	mbox: mailbox@0x40400000 {

remove 0x prefix here.

> +		compatible = "xlnx,axi-mailbox-2.1";
> +		reg = <0x100 0x3c>;

This is weird - it should start with 40400000.
Or is your physical address 0x100?


> +		interrupt-parent = <&intc>;
> +		interrupts = <5>;
> +		#mbox-cells = <1>;
> +	};
> +
> +Mailbox client
> +===============
> +"mboxes" and the optional "mbox-names" (please see
> +Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
> +of the mboxes property should contain a phandle to the mailbox controller
> +device node and second argument is the channel index. It must be 0 (hardware
> +support only one channel).The equivalent "mbox-names" property value can be

.<space>The

> +used to give a name to the communication channel to be used by the client user.
> +
> +Example:
> +	mclient0: mclient0@0x400 {

ditto.

> +		compatible = "client-1.0";
> +		reg = <0x400 0x10>;
> +		mbox-names = "mbox", "mbox-rx";
> +		mboxes = <&mbox 0>;
> +	};
> 

Thanks,
Michal
