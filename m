From: <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 2/3] macb: Update compatibility string for SiFive
 FU540-C000
Date: Fri, 19 Jul 2019 12:05:57 +0000
Message-ID: <4075b955-a187-6fd7-a2e6-deb82b5d4fb6@microchip.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
Content-Language: en-US
Content-ID: <D5BEB55406C32044939CB2E42927225D@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yash.shah@sifive.com, davem@davemloft.net, robh+dt@kernel.org, paul.walmsley@sifive.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, ynezz@true.cz, sachin.ghadi@sifive.com
List-Id: devicetree@vger.kernel.org

On 19/07/2019 at 13:10, Yash Shah wrote:
> Update the compatibility string for SiFive FU540-C000 as per the new
> string updated in the binding doc.
> Reference: https://lkml.org/lkml/2019/7/17/200

Maybe referring to lore.kernel.org is better:
https://lore.kernel.org/netdev/CAJ2_jOFEVZQat0Yprg4hem4jRrqkB72FKSeQj4p8P5K=
A-+rgww@mail.gmail.com/

> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ether=
net/cadence/macb_main.c
> index 15d0737..305371c 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4112,7 +4112,7 @@ static int fu540_c000_init(struct platform_device *=
pdev)
>   	{ .compatible =3D "cdns,emac", .data =3D &emac_config },
>   	{ .compatible =3D "cdns,zynqmp-gem", .data =3D &zynqmp_config},
>   	{ .compatible =3D "cdns,zynq-gem", .data =3D &zynq_config },
> -	{ .compatible =3D "sifive,fu540-macb", .data =3D &fu540_c000_config },
> +	{ .compatible =3D "sifive,fu540-c000-gem", .data =3D &fu540_c000_config=
 },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, macb_dt_ids);
>=20


--=20
Nicolas Ferre
