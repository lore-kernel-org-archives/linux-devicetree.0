From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 7 Mar 2011 22:17:54 +0800
Message-ID: <20110307141656.GC7189@S2101-09.ap.freescale.net>
References: <1299503160-9910-1-git-send-email-jason.hui@linaro.org>
	<1299503160-9910-2-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299503160-9910-2-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 07, 2011 at 09:05:58PM +0800, Jason Liu wrote:
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/mach-mx5/Kconfig               |    8 ++++
>  arch/arm/mach-mx5/Makefile              |    1 +
>  arch/arm/mach-mx5/board-dt.c            |   64 +++++++++++++++++++++++++++++++
>  arch/arm/mach-mx5/clock-mx51-mx53.c     |   43 ++++++++++++++++++++-
>  arch/arm/plat-mxc/include/mach/common.h |    1 +
>  5 files changed, 116 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
> index de4fa99..6438f87 100644
> --- a/arch/arm/mach-mx5/Kconfig
> +++ b/arch/arm/mach-mx5/Kconfig
> @@ -47,6 +47,14 @@ config MACH_MX51_BABBAGE
>  	  u-boot. This includes specific configurations for the board and its
>  	  peripherals.
>  
> +config MACH_MX51_DT
> +	bool "Generic MX51 board (FDT support)"
> +	select USE_OF
> +	select SOC_IMX51
> +	help
> +	 Support for generic Freescale i.MX51 boards using Flattened Device
> +	 Tree.
> +
>  config MACH_MX51_3DS
>  	bool "Support MX51PDK (3DS)"
>  	select SOC_IMX51
> diff --git a/arch/arm/mach-mx5/Makefile b/arch/arm/mach-mx5/Makefile
> index 0d43be9..540697e 100644
> --- a/arch/arm/mach-mx5/Makefile
> +++ b/arch/arm/mach-mx5/Makefile
> @@ -18,3 +18,4 @@ obj-$(CONFIG_MACH_EUKREA_CPUIMX51SD) += board-cpuimx51sd.o
>  obj-$(CONFIG_MACH_EUKREA_MBIMXSD51_BASEBOARD) += eukrea_mbimxsd-baseboard.o
>  obj-$(CONFIG_MACH_MX51_EFIKAMX) += board-mx51_efikamx.o
>  obj-$(CONFIG_MACH_MX50_RDP) += board-mx50_rdp.o
> +obj-$(CONFIG_MACH_MX51_DT) += board-dt.o

If board-dt.c is mx51 specific, would it be sane to name it something
like board-mx51-dt.c?  We have mx53 stuff in this folder as well.

-- 
Regards,
Shawn
