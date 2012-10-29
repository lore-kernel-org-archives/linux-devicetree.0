From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 13/15] SPEAr13xx: update kconfig for PCIe selection
Date: Mon, 29 Oct 2012 19:03:17 +0530
Message-ID: <CAOh2x==OzbwA+4ArPG+yJuZHaQ-v_2VS8YNuFYH36ZqrkZLn3A@mail.gmail.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
	<d13ec089ce3a327746ddf20674a0c1f5d22acb88.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <d13ec089ce3a327746ddf20674a0c1f5d22acb88.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: Pratyush Anand <pratyush.anand@st.com>
Cc: arnd@arndb.de, shiraz.hashim@st.com, spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net
List-Id: devicetree@vger.kernel.org

On Mon, Oct 29, 2012 at 12:31 PM, Pratyush Anand <pratyush.anand@st.com> wrote:
> Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
> ---
>  arch/arm/mach-spear13xx/Kconfig |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-spear13xx/Kconfig b/arch/arm/mach-spear13xx/Kconfig
> index eaadc66..4817314 100644
> --- a/arch/arm/mach-spear13xx/Kconfig
> +++ b/arch/arm/mach-spear13xx/Kconfig
> @@ -16,5 +16,17 @@ config MACH_SPEAR1340
>         select PINCTRL_SPEAR1340
>         help
>           Supports ST SPEAr1340 machine configured via the device-tree
> +

change irrelevant to your patch

>  endmenu
> +
> +config SPEAR13XX_PCI
> +       bool "PCI Express support"

cant this be module

> +       select PCI
> +       select PCIEPORTBUS
> +       select ARCH_SUPPORTS_MSI
> +       select PCI_MSI
> +       select NEED_MACH_IO_H
> +       help
> +         Support SPEAr13xx PCIe Dual controler as a host

s/controler/controller

> +
>  endif #ARCH_SPEAR13XX
> --
> 1.7.5.4
>
