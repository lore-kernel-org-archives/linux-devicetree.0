From: Florian Fainelli <florian@openwrt.org>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Mon, 08 Oct 2012 13:50:08 +0200
Message-ID: <19574322.MHE4gIJg5N@flexo>
References: <20121007015300.828366635@gmail.com>
 <20121007015405.958959522@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121007015405.958959522@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Domenico Andreoli <domenico.andreoli@linux.com>, devicetree-discuss@lists.ozlabs.org, Domenico Andreoli <cavokz@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Domenico,

On Sunday 07 October 2012 03:53:01 Domenico Andreoli wrote:
> From: Domenico Andreoli <domenico.andreoli@linux.com>
> 
> BCM476x's minimal infrastructure, Kernel's great reuse.
> 
> Look mom, no include/mach directory!

This is going to be in the commit, use something more sensible ;)

> 
> Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
> ---
[snip]
> Index: b/arch/arm/boot/dts/bcm476x.dtsi
> ===================================================================
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm476x.dtsi
> @@ -0,0 +1,31 @@
> +/include/ "skeleton.dtsi"
> +
> +/ {
> +	compatible = "brcm,bcm476x";
> +	model = "Broadcom BCM476x";
> +
> +	chosen {
> +		bootargs = "earlyprintk";
> +	};
> +
> +	amba {

I would rather explicitely mention that the peripheral base address is at 0
so something like this:

amba@0 {

to make it clear that the peripherals declared as leaf nodes of this one are
at a relative address.

> +		compatible = "arm,amba-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		vic0: interrupt-controller@80000 {
> +			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
> +			reg = <0x80000 0x1000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		vic1: interrupt-controller@81000 {
> +			compatible = "brcm,bcm476x-pl192", "arm,pl192-vic", "arm,primecell";
> +			reg = <0x81000 0x1000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +	};
> +};
> Index: b/arch/arm/configs/bcm476x_defconfig
> ===================================================================
> --- /dev/null
> +++ b/arch/arm/configs/bcm476x_defconfig
> @@ -0,0 +1,352 @@
[snip]
> +CONFIG_ARM_APPENDED_DTB=y
> +CONFIG_ARM_ATAG_DTB_COMPAT=y
> +CONFIG_ARM_ATAG_DTB_COMPAT_CMDLINE_FROM_BOOTLOADER=y
> +CONFIG_CMDLINE="root=/dev/mmcblk0p2 ro console=ttyAMA1,115200 rootwait init=/bin/bash"

remove the specific init=, let people use the defaults.
--
Florian
