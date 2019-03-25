From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: edac: arm-dmc520.txt
Date: Mon, 25 Mar 2019 18:30:14 +0000
Message-ID: <3b740d3a-ba0d-d186-e8f8-6fdf75a36056@arm.com>
References: <1551921818-2825-1-git-send-email-ruizhao@outlook.com>
 <BN7PR08MB5572B3388B2D7DC8F6C7F285AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BN7PR08MB5572B3388B2D7DC8F6C7F285AE4C0@BN7PR08MB5572.namprd08.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rui Zhao <ruizhao@outlook.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "okaya@kernel.org" <okaya@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "sashal@kernel.org" <sashal@kernel.org>, "hangl@microsoft.com" <hangl@microsoft.com>, "lewan@microsoft.com" <lewan@microsoft.com>, Rui Zhao <ruizhao@microsoft.com>
List-Id: devicetree@vger.kernel.org

Hi Rui,

On 07/03/2019 01:24, Rui Zhao wrote:
> From: Rui Zhao <ruizhao@microsoft.com>
> dt-bindings for new EDAC driver dmc520_edac.c.

(minor nit, the DT folk prefer the binding to come first in the series, this makes it
easier to review)


> diff --git a/Documentation/devicetree/bindings/edac/arm-dmc520.txt b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> new file mode 100644
> index 0000000..7bea7dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/arm-dmc520.txt
> @@ -0,0 +1,21 @@
> +* ARM DMC-520 EDAC node
> +
> +Required properties:
> +- compatible		: "arm,dmc-520".
> +- reg			: Address range of the DMC-520 registers.
> +- interrupts		: DMC-520 interrupt numbers.

Your example has two interrupts, what do they correspond to? (It needs to be clear from
the binding)

Because this thing has quite a few, it may be worth naming the ones you use. If someone
else's platform uses one of the others, they can add it without conflicting with DTs for
yours.

Looking through the TRM for things ending in _int, they seem to be:
* ram_ecc_erc
* ram_ecc_erd
* dram_ecc_erc
* dram_ecc_erd
* failed_access
* failed_prog
* link_err
* arch_fsm
* temperature_event
* phy_request
* combined_int

I think this is far too many to enumerate from day one, especially as your platform only
needs two. Could we name the two you need so that its clear which ones they are, and
others can be added when someone needs them.


> +- interrupt-mask	: Interrupts to be enabled, refer to interrupt_control
> +			  register in DMC-520 TRM for interrupt mapping.

This sounds like policy. It would be good to omit the interrupts that aren't wired up. If
there is a policy like 'use ram not dram on platform Y' we can get the edac driver to do
that based on of_machine_is_compatible() (as the altera edac driver already does).


> +Optional properties:
> +- interrupt-shared	: set this property if and only if all DMC-520
> +			  interrupts share the interrupt number.

What if some of them are combined, and some aren't?

(this shared-interrupts was my example of why we need a documented binding to work out
what is specific to your platofrm)

I'm not sure how this usually gets described in a DT binding ... couldn't we spot this
from duplicate entries in the interrupts property? If we register them with IRQF_SHARED,
would it matter?

(We can always tell its our device from the status register, so I think we should use
IRQF_SHARED regardless.)


Thanks,

James
