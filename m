From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ptp: Add binding doc for IDT
 ClockMatrix based PTP clock
Date: Tue, 01 Oct 2019 17:09:06 -0500
Message-ID: <5d93ce84.1c69fb81.8e964.4dc1@mx.google.com>
References: <1568837198-27211-1-git-send-email-vincent.cheng.xh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568837198-27211-1-git-send-email-vincent.cheng.xh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vincent.cheng.xh@renesas.com
Cc: mark.rutland@arm.com, richardcochran@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 04:06:37PM -0400, vincent.cheng.xh@renesas.com wrote:
> From: Vincent Cheng <vincent.cheng.xh@renesas.com>
> 
> Add device tree binding doc for the IDT ClockMatrix PTP clock driver.

Bindings are for h/w, not drivers...

> 
> Signed-off-by: Vincent Cheng <vincent.cheng.xh@renesas.com>
> ---
>  Documentation/devicetree/bindings/ptp/ptp-idtcm.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ptp/ptp-idtcm.txt

Please make this a DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt b/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt
> new file mode 100644
> index 0000000..4eaa34d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt
> @@ -0,0 +1,15 @@
> +* IDT ClockMatrix (TM) PTP clock
> +
> +Required properties:
> +
> +  - compatible  Should be "idt,8a3400x-ptp" for System Synchronizer
> +                Should be "idt,8a3401x-ptp" for Port Synchronizer
> +                Should be "idt,8a3404x-ptp" for Universal Frequency Translator (UFT)

If PTP is the only function of the chip, you don't need to append 
'-ptp'.

What's the 'x' for? We generally don't use wildcards in compatible 
strings.

> +  - reg         I2C slave address of the device
> +
> +Example:
> +
> +	phc@5b {
> +		compatible = "idt,8a3400x-ptp";
> +		reg = <0x5b>;
> +	};
> -- 
> 2.7.4
> 
