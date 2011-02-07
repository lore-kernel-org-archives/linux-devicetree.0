From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: DT: Add a basic dts file for SMDKV310 machine
Date: Mon, 7 Feb 2011 11:04:12 +1100
Message-ID: <20110207000412.GA28953@yookeroo>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
	<1296998250-21856-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1296998250-21856-3-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 06, 2011 at 06:47:28PM +0530, Thomas Abraham wrote:
> This patch adds a basic dts file for Samsung's SMDKV310 machine.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-s5pv310/mach-smdkv310.dts |   38 +++++++++++++++++++++++++++++++
>  1 files changed, 38 insertions(+), 0 deletions(-)
>  create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
> 
> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
> new file mode 100755
> index 0000000..74d80bf
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
> @@ -0,0 +1,38 @@
> +/dts-v1/;
> +
> +/ {
> +	model = "smdkv310";
> +	compatible = "samsung,smdkv310";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x40000000 0x08000000>;
> +	};

Uh.. where are the cpus?

> +	chosen {
> +		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";
> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";

It's generally a good idea to list the specific soc model before "simple-bus".

> +		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;
> +
> +		GIC:gic@0x10500000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0x10500000 0x1000>;
> +			compatible = "arm,gic";
> +		};
> +
> +		watchdog@0x10060000 {
> +			reg = <0x10060000 0x400>;
> +			interrupts = <552>;
> +			interrupt-parent = <&GIC>;
> +			compatible = "samsung,s3c2410-wdt";
> +		};
> +	};
> +};

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
