From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: soc: Add a binding for the Broadcom
 VCHIQ services.
Date: Thu, 8 Mar 2018 12:18:58 +0000
Message-ID: <616b5c0c-ca31-c041-ba5a-f73febf62fe6@arm.com>
References: <20180307185716.17449-1-eric@anholt.net>
 <20180307185716.17449-3-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180307185716.17449-3-eric@anholt.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phil Elwell <phil@raspberrypi.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 07/03/18 18:57, Eric Anholt wrote:
> The VCHIQ communication channel can be provided by BCM283x and Capri
> SoCs, to communicate with the VPU-side OS services.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> ---
> 
> v2: dropped firmware property, added cache-line-size.
> 
>  .../bindings/soc/bcm/brcm,bcm2835-vchiq.txt        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> new file mode 100644
> index 000000000000..cdef4abc5e47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.txt
> @@ -0,0 +1,28 @@
> +Broadcom VCHIQ firmware services
> +
> +Required properties:
> +
> +- compatible:	Should be "brcm,bcm2835-vchiq"
> +- reg:		Physical base address and length of the doorbell register pair
> +- interrupts:	The interrupt number
> +		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
> +
> +Optional properties:
> +
> +- cache-line-size:
> +		Size of L2 cache lines.  The VPU firmware detects


Which L2 cache is this ? VPU or CPUs ?
If CPUs, just drop it and get it from CPU nodes if you need it.

If VPUs, it's better add that to the name as CPUs use "cache-line-size"
At-least for me, it looked like you are specifying CPU L2 cache line
size and hence thought to comment.

-- 
Regards,
Sudeep
