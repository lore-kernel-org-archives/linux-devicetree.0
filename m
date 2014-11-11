From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: berlin: Add AHCI and SATA PHY nodes to BG2
Date: Wed, 12 Nov 2014 00:23:07 +0100
Message-ID: <54629A5B.9050209@gmail.com>
References: <1413882477-27922-1-git-send-email-sebastian.hesselbarth@gmail.com> <1414664488-5911-1-git-send-email-sebastian.hesselbarth@gmail.com> <1414664488-5911-5-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414664488-5911-5-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, =?UTF-8?B?QW50b2luZSBUw6luYXJ0?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30.10.2014 11:21, Sebastian Hesselbarth wrote:
> Add DT nodes for the AHCI controller and SATA PHY found on Marvell
> Berlin2 SoCs.
>
> Acked-by: Antoine T=C3=A9nart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
>

Applied both DT patches to berlin/dt.

Sebastian

> ---
>   arch/arm/boot/dts/berlin2.dtsi | 39 +++++++++++++++++++++++++++++++=
++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berli=
n2.dtsi
> index 9d7c810ebd0b..f39090491eb2 100644
> --- a/arch/arm/boot/dts/berlin2.dtsi
> +++ b/arch/arm/boot/dts/berlin2.dtsi
> @@ -246,6 +246,45 @@
>   			};
>   		};
>
> +		ahci: sata@e90000 {
> +			compatible =3D "marvell,berlin2-ahci", "generic-ahci";
> +			reg =3D <0xe90000 0x1000>;
> +			interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&chip CLKID_SATA>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			sata0: sata-port@0 {
> +				reg =3D <0>;
> +				phys =3D <&sata_phy 0>;
> +				status =3D "disabled";
> +			};
> +
> +			sata1: sata-port@1 {
> +				reg =3D <1>;
> +				phys =3D <&sata_phy 1>;
> +				status =3D "disabled";
> +			};
> +		};
> +
> +		sata_phy: phy@e900a0 {
> +			compatible =3D "marvell,berlin2-sata-phy";
> +			reg =3D <0xe900a0 0x200>;
> +			clocks =3D <&chip CLKID_SATA>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			#phy-cells =3D <1>;
> +			status =3D "disabled";
> +
> +			sata-phy@0 {
> +				reg =3D <0>;
> +			};
> +
> +			sata-phy@1 {
> +				reg =3D <1>;
> +			};
> +		};
> +
>   		chip: chip-control@ea0000 {
>   			compatible =3D "marvell,berlin2-chip-ctrl";
>   			#clock-cells =3D <1>;
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
