From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: s5pv310-dt: Add a basic dts file for SMDKV310
	machine
Date: Wed, 16 Feb 2011 17:34:34 -0700
Message-ID: <20110217003434.GE14124@angua.secretlab.ca>
References: <1297514825-10345-1-git-send-email-thomas.abraham@linaro.org>
	<1297514825-10345-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297514825-10345-3-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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

On Sat, Feb 12, 2011 at 06:17:00PM +0530, Thomas Abraham wrote:
> This patch adds a basic dts file for Samsung's SMDKV310 board which
> is based on the s5pv310 machine.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Structure looks good.  Some comments below, but it is getting close.

> ---
>  arch/arm/mach-s5pv310/mach-smdkv310.dts |   78 +++++++++++++++++++++++++++++++
>  1 files changed, 78 insertions(+), 0 deletions(-)
>  create mode 100755 arch/arm/mach-s5pv310/mach-smdkv310.dts
> 
> diff --git a/arch/arm/mach-s5pv310/mach-smdkv310.dts b/arch/arm/mach-s5pv310/mach-smdkv310.dts
> new file mode 100755
> index 0000000..75aa76d
> --- /dev/null
> +++ b/arch/arm/mach-s5pv310/mach-smdkv310.dts
> @@ -0,0 +1,78 @@
> +/dts-v1/;
> +
> +/ {
> +	model = "smdkv310";

You can be verbose and human-friendly here.  ie. "Samsung SMDKv310 eval board"

> +	compatible = "samsung,s5pv310","samsung,smdkv310";

The specific board should come first (most compatible) followed by the
value for the soc (less specific).

> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {

#address-cells = <1>;
#size-cells = <0>;

> +		cpu@0{
> +			compatible = "arm,cortex-a9";

reg = <0>;

> +		};
> +
> +		cpu@1 {
> +			compatible = "arm,cortex-a9";

reg = <1>;

> +		};
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x40000000 0x08000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";

initrd address should be passed via the linux,initrd-start and
linux,initrd-end properties.  U-Boot already knows how to do this so
it shouldn't be encoded in the kernel parameters list.

> +		console-defaults = <0x3c5 0x3 0x111>;

Drop console-defaults.  The configuration should be encoded in the
uart's device tree node.

> +		xtal-frequency = <24000000>;

It looks like this is misplaced.  If this is the primary frequency for
the system, then it should go either in the root node,  the soc node,
or the cpu nodes.

> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		interrupt-parent = <&GIC>;
> +		compatible = "samsung,s5pv310-soc","simple-bus";
> +		ranges;
> +
> +		GIC:gic@0x10500000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0x10500000 0x1000>;
> +			compatible = "samsung,s5pv310-gic","arm,gic";
> +		};
> +
> +		watchdog@0x10060000 {
> +			reg = <0x10060000 0x400>;
> +			interrupts = <552>;

This of course will need to be fixed up when we get the irq
infrastructure properly handling cascaded irq controllers.  It is fine
for the time being though.

> +			compatible = "samsung,s5pv310-wdt","samsung,s3c2410-wdt";
> +		};
> +
> +		serial@0x13800000 {
> +			reg = <0x13800000 0x100>;
> +			interrupts = <16 18 17>;
> +			reg-defaults = <0x3c5 0x3 0x111>;

reg-defaults doesn't sound like a very good binding.  It's better when
the properties reflect what is trying to be configured instead of a
set of magic values.  (That said, sometimes magic values are
appropriate, but even then it needs to be well documented so that
mere-mortals have a fighting chance of understanding and manipulating it).

> +			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
> +		};
> +
> +		serial@0x13810000 {
> +			reg = <0x13810000 0x100>;
> +			interrupts = <20 22 21>;
> +			reg-defaults = <0x3c5 0x3 0x111>;
> +			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
> +		};
> +
> +		serial@0x13820000 {
> +			reg = <0x13820000 0x100>;
> +			interrupts = <24 26 25>;
> +			reg-defaults = <0x3c5 0x3 0x111>;
> +			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
> +		};
> +
> +		serial@0x13830000 {
> +			reg = <0x13830000 0x100>;
> +			interrupts = <28 30 29>;
> +			reg-defaults = <0x3c5 0x3 0x111>;
> +			compatible = "samsung,s5pv310-uart","samsung,s3c2410-uart";
> +		};
> +	};
> +};
> -- 
> 1.6.6.rc2
> 
