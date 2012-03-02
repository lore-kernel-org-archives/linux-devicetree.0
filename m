From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] Initial Device Tree system for Snowball
Date: Fri, 02 Mar 2012 12:14:53 -0700
Message-ID: <20120302191453.C972F3E1C63@localhost>
References: <1330703567-17925-1-git-send-email-niklas.hernaeus@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330703567-17925-1-git-send-email-niklas.hernaeus-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Niklas Hernaeus <niklas.hernaeus-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2 Mar 2012 16:52:47 +0100, Niklas Hernaeus <niklas.hernaeus-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org> wrote:
> From: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This is the base system for using Device Tree for Snowball.
> The new boardfile is a slightly modified copy of the original board file,
> so new Device Tree stuff can simply be added and code removed, while
> functionality stays the same.
> 
> Signed-off-by: Niklas Hernaeus <niklas.hernaeus-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/snowball.dts          |   32 ++
>  arch/arm/mach-ux500/Kconfig             |   17 +-
>  arch/arm/mach-ux500/Makefile            |    5 +-
>  arch/arm/mach-ux500/board-mop500-dt.c   |  729 +++++++++++++++++++++++++++++++
>  arch/arm/mach-ux500/include/mach/irqs.h |    2 +-
>  5 files changed, 779 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/boot/dts/snowball.dts
>  create mode 100644 arch/arm/mach-ux500/board-mop500-dt.c
> 
> diff --git a/arch/arm/boot/dts/snowball.dts b/arch/arm/boot/dts/snowball.dts
> new file mode 100644
> index 0000000..02305fb
> --- /dev/null
> +++ b/arch/arm/boot/dts/snowball.dts
> @@ -0,0 +1,32 @@
> +/*
> + * Copyright 2011 ST-Ericsson AB
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	model = "Calao Systems Snowball platform with device tree";
> +	compatible = "calaosystems,snowball-a9500";
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x00000000 0x20000000>;
> +	};
> +
> +	soc-u9500 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges;
> +	};
> +};
> diff --git a/arch/arm/mach-ux500/Kconfig b/arch/arm/mach-ux500/Kconfig
> index 52af004..be7e4fe 100644
> --- a/arch/arm/mach-ux500/Kconfig
> +++ b/arch/arm/mach-ux500/Kconfig
> @@ -27,19 +27,22 @@ menu "Ux500 target platform (boards)"
>  config MACH_U8500
>  	bool "U8500 Development platform"
>  	depends on UX500_SOC_DB8500
> +	depends on !USE_OF

Hi Niklas,

Don't make any configurations depend on !USE_OF.  Turning on device
tree support must not disable non-DT booting.  This is a policy
decision made a while ago.  You'll need to ensure the code is
structured so that the DT and non-DT code paths can co-exist.

>  	select TPS6105X
>  	help
>  	  Include support for the mop500 development platform.
>  
>  config MACH_HREFV60
> -       bool "U85000 Development platform, HREFv60 version"
> -       depends on UX500_SOC_DB8500
> -       help
> -         Include support for the HREFv60 new development platform.
> +	bool "U85000 Development platform, HREFv60 version"
> +	depends on UX500_SOC_DB8500
> +	depends on !USE_OF

Ditto here.

> +	help
> +	  Include support for the HREFv60 new development platform.
>  
>  config MACH_SNOWBALL
>  	bool "U8500 Snowball platform"
>  	depends on UX500_SOC_DB8500
> +	depends on !USE_OF
>  	select MACH_U8500
>  	help
>  	  Include support for the snowball development platform.
> @@ -49,6 +52,12 @@ config MACH_U5500
>  	depends on UX500_SOC_DB5500
>  	help
>  	  Include support for the U5500 development platform.
> +config MACH_UX500_DT
> +	def_bool y if USE_OF
> +	depends on UX500_SOC_DB8500 || UX500_SOC_DB5500
> +
> +config MACH_MOP500
> +	def_bool y if MACH_U8500 || MACH_UX500_DT
>  endmenu
