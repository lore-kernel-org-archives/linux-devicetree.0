From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2 3/3] ARM: dts: db8500: add node property "regulator-compatible"
 regulator node
Date: Tue, 19 Jun 2012 17:13:58 +0100
Message-ID: <4FE0A546.1010707@linaro.org>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com> <1340116099-17629-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340116099-17629-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, swarren@wwwdotorg.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/06/12 15:28, Laxman Dewangan wrote:
> Device's regulator matches their hardware counterparts with the
> property "regulator-compatible" of each child regulator node in
> place of the child node.
> Add the property "regulator-compatible" for each regulator with
> their name.
>
> Signed-off-by: Laxman Dewangan<ldewangan@nvidia.com>
> ---
> Changes from V1:
>   - This is new change in V2.
>
>   arch/arm/boot/dts/db8500.dtsi |  128 ++++++++++++++++++++++++++++++=
+----------
>   1 files changed, 97 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm/boot/dts/db8500.dtsi b/arch/arm/boot/dts/db8500=
=2Edtsi
> index 4ad5160..9548f80 100644
> --- a/arch/arm/boot/dts/db8500.dtsi
> +++ b/arch/arm/boot/dts/db8500.dtsi
> @@ -203,107 +203,149 @@
>
>   			db8500-prcmu-regulators {
>   				compatible =3D "stericsson,db8500-prcmu-regulator";
> +				#address-cells =3D<1>;
> +				#size-cells =3D<0>;

Why are these and the reg properties required?

>   				// DB8500_REGULATOR_VAPE
> -				db8500_vape_reg: db8500_vape {
> +				db8500_vape_reg: regulator@0 {
> +					reg =3D<0>;
> +					regulator-compatible =3D "db8500_vape";
>   					regulator-name =3D "db8500-vape";
>   					regulator-always-on;
>   				};

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
M: +44 77 88 633 515
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
