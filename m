From: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: correct voltage selector
 Firefly-RK3399
Date: Mon, 4 Jun 2018 23:45:18 +0200
Message-ID: <1d5c4a57-c89c-07e9-e4ad-1bda2247e2be@gmx.de>
References: <20180604171523.28454-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180604171523.28454-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/04/2018 07:15 PM, Heinrich Schuchardt wrote:
> Without this patch the Firefly-RK3399 board boot process hangs after these
> lines:
> 
>    fan53555-regulator 0-0040: FAN53555 Option[8] Rev[1] Detected!
>    fan53555-reg: supplied by vcc_sys
>    vcc1v8_s3: supplied by vcc_1v8
> 
> Blacklisting driver fan53555 allows booting.
> 
> The device tree uses a value of fcs,suspend-voltage-selector different to
> any other board.
> 
> Changing this setting to the usual value is sufficient to enable booting.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> index 4f28628aa091..50940ef844a7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
> @@ -458,7 +458,7 @@
>  	vdd_cpu_b: regulator@40 {
>  		compatible = "silergy,syr827";
>  		reg = <0x40>;
> -		fcs,suspend-voltage-selector = <0>;
> +		fcs,suspend-voltage-selector = <1>;

The same value <1> is used in the legacy kernel:

https://github.com/rockchip-linux/kernel/blob/release-4.4/arch/arm64/boot/dts/rockchip/rk3399-firefly-linux.dts

	vdd_cpu_b: syr827@40 {
		compatible = "silergy,syr827";
		reg = <0x40>;
		vin-supply = <&vcc5v0_sys>;
		regulator-compatible = "fan53555-reg";
		regulator-name = "vdd_cpu_b";
		regulator-min-microvolt = <712500>;
		regulator-max-microvolt = <1500000>;
		regulator-ramp-delay = <1000>;
		vsel-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
		fcs,suspend-voltage-selector = <1>;
		regulator-always-on;
		regulator-boot-on;
		regulator-initial-state = <3>;
			regulator-state-mem {
			regulator-off-in-suspend;
		};
};

Best regards

Heinrich


>  		regulator-name = "vdd_cpu_b";
>  		regulator-min-microvolt = <712500>;
>  		regulator-max-microvolt = <1500000>;
> 
