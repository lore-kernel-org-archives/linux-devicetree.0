From: "Andrew Jeffery" <andrew@aj.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v1_1/2]_dt-binding:_misc:_Add_common_LPC_snoop_docu?=
 =?UTF-8?Q?mentation?=
Date: Mon, 15 Apr 2019 21:04:48 -0400
Message-ID: <93fd2cb2-b3cd-4b7f-b187-eec62ce49723@www.fastmail.com>
References: <20190415121235.255028-1-tmaimon77@gmail.com>
 <20190415121235.255028-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190415121235.255028-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, arnd@arnd.de, Rob Herring <robh+dt@kernel.org>, mark.rutland@arm.com, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Mon, 15 Apr 2019, at 21:51, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM BIOS Post Code (BPC) and Apeed AST2500 LPC snoop.
> The LPC snoop monitoring two configurable I/O addresses
> written by the host on Low Pin Count (LPC) bus.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/misc/lpc-snoop.txt         | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/lpc-snoop.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/lpc-snoop.txt 
> b/Documentation/devicetree/bindings/misc/lpc-snoop.txt
> new file mode 100644
> index 000000000000..7deac244ef9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/lpc-snoop.txt
> @@ -0,0 +1,27 @@
> +LPC snoop interface
> +
> +The LPC snoop (BIOS Post Code) interface can monitor
> +two configurable I/O addresses written by the host on
> +the Low Pin Count (LPC) bus.

Wrapping looks kind of odd and there's a missing newline at the
end of the file, but for the content:

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +
> +Nuvoton NPCM7xx LPC snoop supports capture double words,
> +when using capture double word only I/O address 1 is monitored.
> +
> +Required properties for lpc-snoop node
> +- compatible   : "nuvoton,npcm750-lpc-bpc-snoop" for Poleg NPCM7XX
> +                 "aspeed,ast2500-lpc-snoop" for Aspeed AST2500.
> +- reg          : specifies physical base address and size of the 
> registers.
> +- interrupts   : contain the LPC snoop interrupt with flags for 
> falling edge.
> +- snoop-ports  : contain monitor I/O addresses, at least one monitor 
> I/O
> +                 address required
> +
> +Optional property for NPCM7xx lpc-snoop node
> +- nuvoton,lpc-en-dwcapture : enable capture double words support.
> +
> +Example:
> +	lpc-snoop: lpc_snoop@f0007040 {
> +		compatible = "nuvoton,npcm750-lpc-bpc-snoop";
> +		reg = <0xf0007040 0x14>;
> +		snoop-ports = <0x80>;
> +		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> \ No newline at end of file
> -- 
> 2.14.1
> 
>
