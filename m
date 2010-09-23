From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/7] Samsung: SMDKV210 Added Basic DTS file The DTS
	file which descibes the SMDKV210 board is introduced. Support for VIC,
	Tiner and Uart are enabled at present.
Date: Thu, 23 Sep 2010 13:39:06 -0600
Message-ID: <20100923193906.GB17400@angua.secretlab.ca>
References: <1284977950-30687-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1284977950-30687-1-git-send-email-shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 20, 2010 at 03:49:10PM +0530, Shaju Abraham wrote:

Hi Shaju,

Thanks for this series.  First of, as Jon mentioned, please format
your patches so that the first line is a short one-line description of
the patch, followed by a blank line, followed by the detailed
description.

Comments below.

> Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/v210.dts |  147 ++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 147 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/boot/dts/v210.dts
> 
> diff --git a/arch/arm/boot/dts/v210.dts b/arch/arm/boot/dts/v210.dts
> new file mode 100644
> index 0000000..7cd219f
> --- /dev/null
> +++ b/arch/arm/boot/dts/v210.dts
> @@ -0,0 +1,147 @@
> +/dts-v1/;
> +
> +/ {
> +	model = "smdkv210";

The manufacturer name should also appear in the 'model' property

> +	compatible = "samsung,smdkv210";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&VIC0>;
> +	
> +	aliases{
> +		vic0=&VIC0;

This alias isn't actually needed as far as I can see.

> +	};
> +
> +
> +	memory {
> +		name = "memory";
> +		device_type = "memory";
> +		reg = <0x20000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "root=/dev/nfs rw nfsroot=192.168.0.10:/opt/ubuntu-taiwan/ ip=192.168.0.1:192.168.0.10:192.168.0.10:255:255:255:0:eth0
> +				console=ttySAC2,115200 init=/linuxrc";

It's generally a bad idea to put default bootargs into the device tree
source file.  It is okay for the moment, but will need to be removed
later when the firmware starts passing the bootargs natively.

> +	};
> +
> +	soc {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "simple-bus";
> +		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;

A single range that translates the entire address range can be
specified simply as an empty ranges property, like so:

	ranges;

> +		
> +		watchdog@0xE2700000{

should be: 'watchdog@e2700000 {'.  In the node name the address should
be lowercase and the '0x' prefix should not be used.

> +			compatible = "samsung,s3c2410-wdt";
> +			reg = <0xE2700000 0x2000>;

Nitpick; use lowercase in addresses.

> +			interrupts = <27 >;

Nitpick; inconsistent whitespace.

> +			interrupt-parent = <&VIC0>;
> +		};
> +
> +
> +		VIC0:vic0@f2000000 {

Node names should reflect what the device is for, not what the
specific device is.  So this node name should be: "VIC0:
interrupt-controller@f2000000 {"

> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0xf2000000 0x1000>;
> +			virtual-reg = <0xf4000000>;

Don't specify virtual-reg unless firmware is setting it the MMU in a
way that the kernel must reuse (which would be unusual).  You can
probably drop this property.

> +			compatible = "arm,vic";

The compatible property for SoC devices should also include the exact
device in addition to the generic specification.  Something like
"samsung,s3c2410-vic".  Also, arm,vic may be too generic a name.  The
exact core name may is a better choice; ie: "arm,pl192".  So, for all
the interrupt controller nodes, compatible should look like this:

	compatible = "samsung,s3c2410-vic", "arm,pl192";


Finally, documentation needs to be added to devicetree.org to document
the "arm,vic" binding.

> +			irq-src = <0xffffffff>;

What does irq-src mean?

> +		};
> +		VIC1:vic1@f2100000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0xf2100000 0x1000>;
> +			virtual-reg = <0xf4010000>;

ditto

> +			interrupt-parent = <&VIC0>;
> +			irq-src = <0xffffffff>;
> +			compatible = "arm,vic";
> +		};
> +		VIC2:vic2@f2200000{
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0xf2200000 0x1000>;
> +			virtual-reg = <0xf4020000>;
> +			interrupt-parent = <&VIC1>;
> +			irq-src = <0xffffffff>;
> +			compatible = "arm,vic";
> +		};
> +		VIC3:vic3@f2300000 {
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +			reg = <0xf2300000 0x1000>;
> +			virtual-reg = <0xf4030000>;
> +			interrupt-parent = <&VIC2>;
> +			irq-src = <0xffffffff>;
> +			compatible = "arm,vic";
> +		};
> +		uart@0xe2900000 {

Use generic name 'serial' instead of 'uart'.  Drop the '0x'.

So, this should be: serial@e2900000.  Ditto for the rest of the uart
nodes.

> +			reg = <0xe2900000 0x1000>;
> +			virtual-reg = <0xf5000000>;

remove virtual-reg

> +			interrupts = <10>;
> +			interrupt-parent = <&VIC1>;
> +			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";

Use 's3c2410-uart' instead of 's3c-uart'.  Don't use the underscore
'_' character in compatible values.  Only claim compatibility with an
older part if there already is a binding documented for the older
part.  Ditto for the rest of the uart nodes.

> +		};
> +		uart@0xe2900400 {
> +			reg = <0xe2900400 0x1000>;
> +			virtual-reg = <0xf5000400>;
> +			interrupts = <11>;
> +			interrupt-parent = <&VIC1>;
> +			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
> +		};
> +		uart@0xe2900800 {
> +			reg = <0xe2900800 0x1000>;
> +			virtual-reg = <0xf5000800>;
> +			interrupts = <12>;
> +			interrupt-parent = <&VIC1>;
> +			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
> +		};
> +		uart@0xe2900c00 {
> +			reg = <0xe2900c00 0x1000>;
> +			virtual-reg = <0xf5000c00>;
> +			interrupts = <13>;
> +			interrupt-parent = <&VIC1>;
> +			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
> +		};
> +
> +		timer0@e2500000 {

Should be simply 'timer@e2500000'.  It should not be called 'timer0'.
Same goes for timers 1 through 4.

> +			reg = <0xe2500000 0x1000>;
> +			virtual-reg = <0xf0300000>;
> +			interrupts = <21 11>;

Just to double check; this property says that the timer has two
interrupt output lines.  Correct?

> +			compatible = "samsung,s3c-timer","samsung,s5p-timer";

Same comments for timers as made for uart compatible property.

> +
> +		};
> +		timer1@e2500000 {
> +			reg = <0xe2500000 0x1000>;
> +			virtual-reg = <0xf0300000>;
> +			interrupts = <22 12>;
> +			compatible = "samsung,s3c-timer","samsung,s5p-timer";
> +
> +		};
> +		timer2@e2500000 {
> +			reg = <0xe2500000 0x1000>;
> +			virtual-reg = <0xf0300000>;
> +			interrupts = <23 13>;
> +			compatible = "samsung,s3c-timer","samsung,s5p-timer";
> +
> +		};
> +		timer3@e2500000 {
> +			reg = <0xe2500000 0x1000>;
> +			virtual-reg = <0xf0300000>;
> +			interrupts = <24 14>;
> +			compatible = "samsung,s3c-timer","samsung,s5p-timer";
> +
> +		};
> +
> +		timer4@e2600000 {
> +			reg = <0xe2600000 0x1000>;
> +			virtual-reg = <0xf5200000>;
> +			interrupts = <25 15>;
> +			compatible = "samsung,s3c-timer","samsung,s5p-timer";
> +
> +		};
> +		SROM@e2600000 {
> +			reg = <0xe8000000 0x1000>;
> +			virtual-reg = <0xf5100000>;

What is 'SROM'?  This node is missing a compatible property.

g.
