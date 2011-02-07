From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: DT: Add a basic dts file for SMDKV310 machine
Date: Sun, 6 Feb 2011 23:54:11 -0700
Message-ID: <20110207065411.GC24685@angua.secretlab.ca>
References: <1296998250-21856-1-git-send-email-thomas.abraham@linaro.org>
	<1296998250-21856-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1296998250-21856-3-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
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

Should include the soc in this compatible list:

	compatible = "samsung,smdkv310", "samsung,s5pv310";

Also, every 'compatible' value specified in this file should also have
documentation in Documentation/devicetree/bindings.

> +	#address-cells = <1>;
> +	#size-cells = <1>;

It's usually a good idea to have a "interrupt-parent = <&GIC>;" here
so that all child nodes inherit it as the default interrupt
controller.

Also, missing a 'cpus' node.

> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x40000000 0x08000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/ram0 rw ramdisk=8192 initrd=0x41000000,8M console=ttySAC1,115200 init=/linuxrc";

initrd base address will get passed via the linux,initrd-start and
linux,initrd-end properties which are automatically populated by
u-boot.  Drop initrd from the boot args.

> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";

Should also specify the soc with something like:

		compatible = "samsung,s5pv310-soc", "simple-bus";

> +		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;

You can specify that the entire ranges is translated simply by
specifying an empty ranges property like so:

		ranges;

> +
> +		GIC:gic@0x10500000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0x10500000 0x1000>;
> +			compatible = "arm,gic";

Be specific about the device on all the device nodes, followed by a
list of the compatible devices.  Should be something like:

	compatible = "samsung,s5pv310-soc", "arm,gic";

> +		};
> +
> +		watchdog@0x10060000 {
> +			reg = <0x10060000 0x400>;
> +			interrupts = <552>;
> +			interrupt-parent = <&GIC>;

By putting the interrupt-parent property in the root node, this
interrupt-parent property can be dropped.

> +			compatible = "samsung,s3c2410-wdt";

compatible needs to first specify the exact device
(samsung,s5pv310-wdt?) followed by the compatible device.  I assume
the wdt in the s5pv310 is compatible with the one in the s3c2410,
correct?  Or am I missing something?

> +		};
> +	};
> +};
> -- 
> 1.6.6.rc2
> 
> 
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
