From: <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 1/3] macb: bindings doc: update sifive fu540-c000 binding
Date: Fri, 19 Jul 2019 12:02:27 +0000
Message-ID: <443fd93a-ff6f-1641-89ec-f35f39de3688@microchip.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Content-Language: en-US
Content-ID: <165F3368D1BE9941BA62F18B715B2CA7@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yash.shah@sifive.com, davem@davemloft.net, robh+dt@kernel.org, paul.walmsley@sifive.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On 19/07/2019 at 13:10, Yash Shah wrote:
> As per the discussion with Nicolas Ferre, rename the compatible property
> to a more appropriate and specific string.
> LINK: https://lkml.org/lkml/2019/7/17/200
>=20
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   Documentation/devicetree/bindings/net/macb.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentati=
on/devicetree/bindings/net/macb.txt
> index 63c73fa..0b61a90 100644
> --- a/Documentation/devicetree/bindings/net/macb.txt
> +++ b/Documentation/devicetree/bindings/net/macb.txt
> @@ -15,10 +15,10 @@ Required properties:
>     Use "atmel,sama5d4-gem" for the GEM IP (10/100) available on Atmel sa=
ma5d4 SoCs.
>     Use "cdns,zynq-gem" Xilinx Zynq-7xxx SoC.
>     Use "cdns,zynqmp-gem" for Zynq Ultrascale+ MPSoC.
> -  Use "sifive,fu540-macb" for SiFive FU540-C000 SoC.
> +  Use "sifive,fu540-c000-gem" for SiFive FU540-C000 SoC.
>     Or the generic form: "cdns,emac".
>   - reg: Address and length of the register set for the device
> -	For "sifive,fu540-macb", second range is required to specify the
> +	For "sifive,fu540-c000-gem", second range is required to specify the
>   	address and length of the registers for GEMGXL Management block.
>   - interrupts: Should contain macb interrupt
>   - phy-mode: See ethernet.txt file in the same directory.
>=20


--=20
Nicolas Ferre
