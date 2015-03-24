From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] drivers: soc: sunxi: Introduce SoC
 driver to map SRAMs
Date: Tue, 24 Mar 2015 08:19:44 -0700
Message-ID: <20150324151944.GA4951@lukather>
References: <1426877569-11493-1-git-send-email-hdegoede@redhat.com>
 <1426877569-11493-2-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBM43Y2UAKGQEDQRKJIA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426877569-11493-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Mar 20, 2015 at 07:52:45PM +0100, Hans de Goede wrote:
> From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> 
> The Allwinner SoCs have a handful of SRAM that can be either mapped to be
> accessible by devices or the CPU.
> 
> That mapping is controlled by an SRAM controller, and that mapping might not be
> set by the bootloader, for example if the device wasn't used at all, or if
> we're using solutions like the U-Boot's Falcon Boot.
> 
> We could also imagine changing this at runtime for example to change the
> mapping of these SRAMs to use them for suspend/resume or runtime memory rate
> change, if that ever happens.
> 
> These use cases require some API in the kernel to control that mapping,
> exported through a drivers/soc driver.
> 
> This driver also implement a debugfs file that shows the SRAM found in the
> system, the current mapping and the SRAM that have been claimed by some drivers
> in the kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> [hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org: Changed compat string to sun4i-a10-sram-controller, as
>  the sram controller is identical on sun4i, sun5i & sun7i, added devicetree
>  binding documentation, fixed some checkpatch warnings]
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/soc/sunxi/sram.txt         |  64 ++++++
>  drivers/soc/Kconfig                                |   1 +
>  drivers/soc/Makefile                               |   1 +
>  drivers/soc/sunxi/Kconfig                          |  12 ++
>  drivers/soc/sunxi/Makefile                         |   1 +
>  drivers/soc/sunxi/sunxi_sram.c                     | 235 +++++++++++++++++++++
>  include/linux/soc/sunxi/sunxi_sram.h               |  24 +++
>  7 files changed, 338 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sunxi/sram.txt
>  create mode 100644 drivers/soc/sunxi/Kconfig
>  create mode 100644 drivers/soc/sunxi/Makefile
>  create mode 100644 drivers/soc/sunxi/sunxi_sram.c
>  create mode 100644 include/linux/soc/sunxi/sunxi_sram.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/sunxi/sram.txt b/Documentation/devicetree/bindings/soc/sunxi/sram.txt
> new file mode 100644
> index 0000000..6e1bc80
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sunxi/sram.txt
> @@ -0,0 +1,64 @@
> +Allwinnner sun4i / sun5i / sun7i SoC SRAM controllers
> +-----------------------------------------------------
> +
> +Required properties:
> +- compatible : "allwinner,sun4i-a10-sram-controller"
> +- reg : sram controller register offset + length
> +
> +SRAM nodes
> +----------
> +
> +Besides a node for the SRAM controller the devicetree must also contain a
> +node for each SRAM block controlled by the controller.
> +
> +Required sram node properties:
> +- compatible : "allwinner,sun4i-a10-sram"
> +- allwinner,sram-name : should be one of
> +  * "A1"
> +  * "A2"
> +  * "A3-A4"
> +  * "D"
> +
> +Example
> +-------
> +
> +/*
> + * Note we use the address were mmio register start, not where
                              ^ where

> + * the SRAM blocks starts, this cannot be changed because doing
                      ^ start

> + * doing so would be a devicetree ABI change.

One doing too many ? :)

> + */
> +soc@01c00000 {
> +	compatible = "simple-bus";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;
> +
> +	sram@00000000 {
> +		compatible = "allwinner,sun4i-a10-sram";
> +		reg = <0x00000000 0x4000>;
> +		allwinner,sram-name = "A1";
> +	};
> +
> +	sram@00004000 {
> +		compatible = "allwinner,sun4i-a10-sram";
> +		reg = <0x00004000 0x4000>;
> +		allwinner,sram-name = "A2";
> +	};
> +
> +	sram@00008000 {
> +		compatible = "allwinner,sun4i-a10-sram";
> +		reg = <0x00008000 0x4000>;
> +		allwinner,sram-name = "A3-A4";
> +	};
> +
> +	sram@00010000 {
> +		compatible = "allwinner,sun4i-a10-sram";
> +		reg = <0x00010000 0x1000>;
> +		allwinner,sram-name = "D";
> +	};
> +
> +	sram-controller@01c00000 {
> +		compatible = "allwinner,sun4i-a10-sram-controller";
> +		reg = <0x01c00000 0x30>;
> +	};
> +};
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 76d6bd4..5d0f55d 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -1,6 +1,7 @@
>  menu "SOC (System On Chip) specific Drivers"
>  
>  source "drivers/soc/qcom/Kconfig"
> +source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/ti/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
>  
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 063113d..170bba3 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -3,6 +3,7 @@
>  #
>  
>  obj-$(CONFIG_ARCH_QCOM)		+= qcom/
> +obj-$(CONFIG_ARCH_SUNXI)	+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-$(CONFIG_SOC_TI)		+= ti/
>  obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
> diff --git a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
> new file mode 100644
> index 0000000..212c634
> --- /dev/null
> +++ b/drivers/soc/sunxi/Kconfig
> @@ -0,0 +1,12 @@
> +#
> +# Allwinner sunXi SoC drivers
> +#
> +config SUNXI_SRAM
> +        tristate "Allwinner sunXi SRAM Controller"
> +        depends on ARCH_SUNXI
> +	default y

The indentation is off.

Also, that could probably be turned into an hidden option, with a
default y, so that we are sure that it's always going to be there.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--liOOAslEiF7prFVr--
