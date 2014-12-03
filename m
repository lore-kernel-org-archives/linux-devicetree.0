From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v3 07/11] ARM: at91: select ATMEL_EBI when compiling a
 kernel for at91sam9 or sama5d3
Date: Wed, 3 Dec 2014 17:21:10 +0100
Message-ID: <547F3876.70207@atmel.com>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com> <1417429647-3419-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417429647-3419-8-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>
List-Id: devicetree@vger.kernel.org

Le 01/12/2014 11:27, Boris Brezillon a =E9crit :
> at91sam9* and sama5d* SoCs have an EBI (External Bus Interface).
> Select the ATMEL_EBI driver when support for these SoCs is selected.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  arch/arm/mach-at91/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
> index 0e6d548..a72402a 100644
> --- a/arch/arm/mach-at91/Kconfig
> +++ b/arch/arm/mach-at91/Kconfig
> @@ -49,6 +49,7 @@ config SOC_AT91SAM9
>  	select GENERIC_CLOCKEVENTS
>  	select MEMORY if USE_OF
>  	select ATMEL_SDRAMC if USE_OF
> +	select ATMEL_EBI if USE_OF

We can remove "USE_OF" for next version.

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
