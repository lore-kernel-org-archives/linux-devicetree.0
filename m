From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: gpu: add bindings for the ARM Mali
 Midgard GPU
Date: Wed, 19 Apr 2017 11:02:44 +0200
Message-ID: <5481965.3RkcDb038R@phil>
References: <cover.1492588180.git.guillaume.tucker@collabora.com>
 <96021d989387d9aaff039efebd66aa3bfe667941.1492588180.git.guillaume.tucker@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <96021d989387d9aaff039efebd66aa3bfe667941.1492588180.git.guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 19. April 2017, 09:06:17 CEST schrieb Guillaume Tucker:
> The ARM Mali Midgard GPU family is present in a number of SoCs
> from many different vendors such as Samsung Exynos and Rockchip.
> 
> Import the device tree bindings documentation from the r16p0
> release of the Mali Midgard GPU kernel driver:
> 
>   https://developer.arm.com/-/media/Files/downloads/mali-drivers/kernel/mali-midgard-gpu/TX011-SW-99002-r16p0-00rel0.tgz
> 
> The "compatible" property strings have been redesigned to explicitly
> list all the Mali Midgard GPU types and include optional vendor ones.
> 
> The "clock-names" property has been dropped as only one clock is used
> by the Mali Midgard driver which now needs to call clk_get with NULL.
> 
> The "interrupt-names" property values have been converted to
> lower-case: "job", "mmu" and "gpu".
> 
> The following optional bindings have been omitted in this initial
> version as they are only used in very specific cases:
> 
>   * snoop_enable_smc
>   * snoop_disable_smc
>   * jm_config
>   * power_model
>   * system-coherency
>   * ipa-model
> 
> The example has been simplified accordingly.
> 
> The copyright and GPL licence header has been removed as deemed not
> necessary.
> 
> CC: John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  .../devicetree/bindings/gpu/arm,mali-midgard.txt   | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> new file mode 100644
> index 000000000000..917c4f8d178f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> @@ -0,0 +1,57 @@
> +ARM Mali Midgard GPU
> +====================
> +
> +Required properties:
> +
> +- compatible :
> +  * Must be one of the following:
> +    + "arm,mali-t60x"
> +    + "arm,mali-t62x"
> +    + "arm,mali-t720"
> +    + "arm,mali-t760"
> +    + "arm,mali-t820"
> +    + "arm,mali-t830"
> +    + "arm,mali-t860"
> +    + "arm,mali-t880"
> +  * And, optionally, one of the vendor specific compatible:
> +    + "amlogic,meson-gxm-mali"

Please add a "rockchip,rk3288-mali" as well :-) , as I don't trust that the
generic compatible will be enough for all time and having that already
defined makes fixing the per soc things later a lot easier.


Thanks
Heiko


> +
> +- reg : Physical base address of the device and length of the register area.
> +
> +- interrupts : Contains the three IRQ lines required by Mali Midgard devices.
> +
> +- interrupt-names : Contains the names of IRQ resources in the order they were
> +  provided in the interrupts property. Must contain: "job", "mmu", "gpu".
> +
> +
> +Optional properties:
> +
> +- clocks : Phandle to clock for the Mali Midgard device.
> +
> +- mali-supply : Phandle to regulator for the Mali device. Refer to
> +  Documentation/devicetree/bindings/regulator/regulator.txt for details.
> +
> +- operating-points : Refer to Documentation/devicetree/bindings/power/opp.txt
> +  for details.
> +
> +
> +Example for a Mali-T602:
> +
> +gpu@fc010000 {
> +	compatible = "arm,mali-t60x", "arm,mali-midgard";
> +	reg = <0xfc010000 0x4000>;
> +	interrupts = <0 36 4>, <0 37 4>, <0 38 4>;
> +	interrupt-names = "job", "mmu", "gpu";
> +	clocks = <&pclk_mali>;
> +	mali-supply = <&vdd_mali>;
> +	operating-points = <
> +		/* KHz   uV */
> +		533000 1250000,
> +		450000 1150000,
> +		400000 1125000,
> +		350000 1075000,
> +		266000 1025000,
> +		160000  925000,
> +		100000  912500,
> +	>;
> +};
> 
