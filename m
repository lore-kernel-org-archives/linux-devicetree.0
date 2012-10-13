From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 1/6] dts: exynos: add device tree support for exynos5 hdmi
Date: Sat, 13 Oct 2012 15:40:48 +0200
Message-ID: <10309437.yhpP5BHNDs@flatron>
References: <1350074555-26018-1-git-send-email-rahul.sharma@samsung.com> <1350074555-26018-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1350074555-26018-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

On Saturday 13 of October 2012 02:12:30 Rahul Sharma wrote:
> This patch adds support for device tree based discovery for exynos5
> hdmi. Hdmi node is also renamed with "exynos5-hdmi".
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/drm/exynos/hdmi.txt        |   22
> ++++++++++++++++++++ arch/arm/boot/dts/exynos5250-smdk5250.dts         
> |    4 +++ arch/arm/boot/dts/exynos5250.dtsi                  |    6
> +++++ arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +
>  5 files changed, 35 insertions(+), 0 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt new file mode
> 100644
> index 0000000..8b0fa7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/exynos/hdmi.txt
> @@ -0,0 +1,22 @@
> +Device-Tree bindings for drm hdmi driver
> +
> +Required properties:
> +- compatible: value should be "samsung,exynos5-hdmi".
> +- reg: physical base address of the hdmi and length of memory mapped
> +	region.
> +- interrupts: interrupt number to the cpu.
> +- hpd-gpio: following information about the hotplug gpio pin.
> +	a) phandle of the gpio controller node.
> +	b) pin number within the gpio controller.
> +	c) pin function mode.
> +	d) optional flags and pull up/down.
> +	e) drive strength.
> +
> +Example:
> +
> +	hdmi {
> +		compatible = "samsung,exynos5-hdmi";
> +		reg = <0x14530000 0x100000>;
> +		interrupts = <0 95 0>;
> +		hpd-gpio = <&gpx3 7 0xf 1 3>;
> +	};
> \ No newline at end of file
> diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> b/arch/arm/boot/dts/exynos5250-smdk5250.dts index a352df4..2a478ab
> 100644
> --- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
> +++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
> @@ -166,4 +166,8 @@
>  	spi_2: spi@12d40000 {
>  		status = "disabled";
>  	};
> +
> +	hdmi {
> +		hpd-gpio = <&gpx3 7 0xf 1 3>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> b/arch/arm/boot/dts/exynos5250.dtsi index f69e389..eea84a3 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -492,4 +492,10 @@
>  			#gpio-cells = <4>;
>  		};
>  	};
> +
> +	hdmi {

I guess it's discussable, but I would follow the convention of adding 
@ADDR to every node with reg property.

> +		compatible = "samsung,exynos5-hdmi";
> +		reg = <0x14530000 0x100000>;
> +		interrupts = <0 95 0>;
> +        };

Indentation of the closing bracket looks incorrect.

Rest of the patch looks fine.

Best regards,
Tomasz Figa
