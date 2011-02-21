From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 21 Feb 2011 16:37:07 +0800
Message-ID: <AANLkTi=_jQEhUqW8cs+DK4eD4wtDDYkLW7TrMaVUuAim@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-2-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1298016730-22761-2-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> =A0arch/arm/mach-mx5/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06 +++
> =A0arch/arm/mach-mx5/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/arm/mach-mx5/board-dt.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 64 +++++++++=
++++++++++++++++++++++
> =A0arch/arm/mach-mx5/clock-mx51-mx53.c =A0 =A0 | =A0 45 +++++++++++++++++=
++++-
> =A0arch/arm/plat-mxc/include/mach/common.h | =A0 =A01 +
> =A05 files changed, 116 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-mx5/Kconfig b/arch/arm/mach-mx5/Kconfig
> index de4fa99..5fbbd36 100644
> --- a/arch/arm/mach-mx5/Kconfig
> +++ b/arch/arm/mach-mx5/Kconfig
> @@ -47,6 +47,12 @@ config MACH_MX51_BABBAGE
> =A0 =A0 =A0 =A0 =A0u-boot. This includes specific configurations for the =
board and its
> =A0 =A0 =A0 =A0 =A0peripherals.
>
> +config MACH_MX51_DT
> + =A0 =A0 =A0 bool "Generic MX51 board (FDT support)"
> + =A0 =A0 =A0 select USE_OF
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Support for generic Freescale MX51 boards using Flatten=
ed Device Tree.
> +

We may at least need to select SOC_IMX51 here, otherwise it does not
even build if MACH_MX51_DT is the only machine being selected (e.g.
none of any other mx51 machine being selected together).

And tab is being used throughout the file for indentation, but you
are using spaces here.

> =A0config MACH_MX51_3DS
> =A0 =A0 =A0 =A0bool "Support MX51PDK (3DS)"
> =A0 =A0 =A0 =A0select SOC_IMX51

-- =

Regards,
Shawn
