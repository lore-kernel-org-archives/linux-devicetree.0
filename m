From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v5 07/11] ARM: at91: select ATMEL_EBI when compiling a
 kernel for at91sam9 or sama5d3
Date: Thu, 4 Dec 2014 11:34:27 +0100
Message-ID: <548038B3.3080105@atmel.com>
References: <1417639455-17410-1-git-send-email-boris.brezillon@free-electrons.com> <1417639455-17410-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417639455-17410-8-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: devicetree@vger.kernel.org

Le 03/12/2014 21:44, Boris Brezillon a =E9crit :
> at91sam9* and sama5d* SoCs have an EBI (External Bus Interface).
> Select the ATMEL_EBI driver when support for these SoCs is selected.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  .../bindings/memory-controllers/atmel-ebi.txt          | 18 ++++++++=
+---------
>  arch/arm/mach-at91/Kconfig                             |  2 ++
>  2 files changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/atm=
el-ebi.txt b/Documentation/devicetree/bindings/memory-controllers/atmel=
-ebi.txt
> index 3749ea1..68af1ad 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/atmel-ebi.=
txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/atmel-ebi.=
txt
> @@ -16,6 +16,7 @@ Required properties:
>  			"atmel,at91sam9261-ebi"
>  			"atmel,at91sam9263-ebi0"
>  			"atmel,at91sam9263-ebi1"
> +			"atmel,at91sam9rl-ebi"
>  			"atmel,at91sam9g45-ebi"
>  			"atmel,at91sam9x5-ebi"
>  			"atmel,sama5d3-ebi"
> @@ -51,15 +52,14 @@ Required child cs node properties:
>  			memory layout.
> =20
>  Optional child cs node properties:
> -- atmel,generic-dev		boolean property specifying if the device is
> -				a generic device.
> +- atmel,specialized-logic	boolean property specifying if the device =
is
> +				a connected to a specialized logic:
> +				NAND, Compact Flash, SDR-SDRAM.

Ah, ok, seen it here.

>  				The following properties are only parsed if
> -				this property is present.
> -				Specialized devices are attached to specialized
> -				controllers which are responsible for
> -				configuring the bus appropriately.
> -				Here are some examples of specialized
> -				controllers: NAND, CompactFlash, SDR-SDRAM.
> +				this property is absent.
> +				If this property is set, specialized controller
> +				drivers are responsible for configuring the bus
> +				appropriately.
> =20
>  - atmel,bus-width:		width of the asynchronous device's data bus
>  				8, 16 or 32.
> @@ -99,7 +99,7 @@ present 0 is assumed):
>  - atmel,tdf-optimized		data float optimized mode. If present the dat=
a
>  				float time is optimized depending on the next
>  				device being accessed (next device setup
> -				time is substracted to the current devive data
> +				time is subtracted to the current device data
>  				float time).
> =20
> =20
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 0e6d548..78b1412 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -49,6 +49,7 @@ config SOC_AT91SAM9
>  	select GENERIC_CLOCKEVENTS
>  	select MEMORY if USE_OF
>  	select ATMEL_SDRAMC if USE_OF
> +	select ATMEL_EBI
> =20
>  config SOC_SAMA5
>  	bool
> @@ -58,6 +59,7 @@ config SOC_SAMA5
>  	select USE_OF
>  	select MEMORY
>  	select ATMEL_SDRAMC
> +	select ATMEL_EBI
> =20
>  menu "Atmel AT91 System-on-Chip"
> =20
>=20


--=20
Nicolas Ferre
