From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 net-next 5/5] ptp: Add a driver for InES time stamping
 IP core.
Date: Fri, 12 Oct 2018 15:42:57 -0500
Message-ID: <20181012204256.GA16019@bogus>
References: <20181007173823.21590-6-richardcochran@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181007173823.21590-6-richardcochran@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 07, 2018 at 10:38:23AM -0700, Richard Cochran wrote:
> The InES at the ZHAW offers a PTP time stamping IP core.  The FPGA
> logic recognizes and time stamps PTP frames on the MII bus.  This
> patch adds a driver for the core along with a device tree binding to
> allow hooking the driver to MII buses.
> 
> Signed-off-by: Richard Cochran <richardcochran@gmail.com>
> ---
>  Documentation/devicetree/bindings/ptp/ptp-ines.txt |  37 +

Bindings should be separate patch.

>  drivers/ptp/Kconfig                                |  10 +
>  drivers/ptp/Makefile                               |   1 +
>  drivers/ptp/ptp_ines.c                             | 870 +++++++++++++++++++++
>  4 files changed, 918 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ptp/ptp-ines.txt
>  create mode 100644 drivers/ptp/ptp_ines.c
> 
> diff --git a/Documentation/devicetree/bindings/ptp/ptp-ines.txt b/Documentation/devicetree/bindings/ptp/ptp-ines.txt
> new file mode 100644
> index 000000000000..1484b62802c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/ptp-ines.txt
> @@ -0,0 +1,37 @@
> +ZHAW InES PTP time stamping IP core
> +
> +The IP core needs two different kinds of nodes.  The control node
> +lives somewhere in the memory map and specifies the address of the
> +control registers.  There can be up to three port handles placed as
> +attributes of PHY nodes.  These associate a particular MII bus with a
> +port index within the IP core.
> +
> +Required properties of the control node:
> +
> +- compatible:		"ines,ptp-ctrl"

ines is not registered vendor prefix. Should it be 'zhaw' instead?

> +- reg:			physical address and size of the register bank
> +- #phandle-cells:	must be one (1)

#timestamper-cells

Or if it is always 1, you could omit it.

> +
> +Required format of the port handle within the PHY node:
> +
> +- timestamper:		provides control node reference and
> +			the port channel within the IP core

This and #timestamper-cells need to be in a common binding doc.

And bonus points if you add a check in dtc for this. Should be a 
one-liner.

> +
> +Example:
> +
> +	tstamper: timestamper@60000000 {
> +		compatible = "ines,ptp-ctrl";
> +		reg = <0x60000000 0x80>;
> +		#phandle-cells = <1>;
> +	};
> +
> +	ethernet@80000000 {
> +		...
> +		mdio {
> +			...
> +			phy@3 {
> +				...
> +				timestamper = <&tstamper 0>;
> +			};
> +		};
> +	};
