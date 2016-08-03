From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: Remove use of skeleton.dtsi from
 bcm283x.dtsi
Date: Wed, 3 Aug 2016 15:48:58 +0100
Message-ID: <20160803144858.GA29054@leverpostej>
References: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1470233565-30154-1-git-send-email-ijc@hellion.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ian Campbell <ijc@hellion.org.uk>
Cc: devicetree@vger.kernel.org, arm@kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 03:12:44PM +0100, Ian Campbell wrote:
> This file is included from DTS files under arch/arm64 too (via
> broadcom/bcm2837-rpi-3-b.dts and broadcom/bcm2837.dtsi). There is a desire
> not to have skeleton.dtsi for ARM64. See commit 3ebee5a2e141 ("arm64: dts:
> kill skeleton.dtsi") for rationale for its removal.
> 
> As well as the addition of #*-cells also requires adding the device_type to
> the rpi memory node explicitly.
> 
> Note that this change results in the removal of an empty /aliases node from
> bcm2835-rpi-a.dtb and bcm2835-rpi-a-plus.dtb. I have no hardware to check
> if this is a problem or not.
> 
> It also results in some reordering of the nodes in the DTBs (the /aliases
> and /memory nodes come later). This isn't supposed to matter but, again,
> I've no hardware to check if it is true in this particular case.
> 
> Signed-off-by: Ian Campbell <ijc@hellion.org.uk>

I also don't have the relevant hardware to test with, but this looks
generally like the right thing. So FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index caf2707..e9b47b2 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -2,6 +2,7 @@
>  
>  / {
>  	memory {
> +		device_type = "memory";
>  		reg = <0 0x10000000>;
>  	};
>  
> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
> index b982522..445624a 100644
> --- a/arch/arm/boot/dts/bcm283x.dtsi
> +++ b/arch/arm/boot/dts/bcm283x.dtsi
> @@ -2,7 +2,6 @@
>  #include <dt-bindings/clock/bcm2835.h>
>  #include <dt-bindings/clock/bcm2835-aux.h>
>  #include <dt-bindings/gpio/gpio.h>
> -#include "skeleton.dtsi"
>  
>  /* This include file covers the common peripherals and configuration between
>   * bcm2835 and bcm2836 implementations, leaving the CPU configuration to
> @@ -13,6 +12,8 @@
>  	compatible = "brcm,bcm2835";
>  	model = "BCM2835";
>  	interrupt-parent = <&intc>;
> +	#address-cells = <1>;
> +	#size-cells = <1>;
>  
>  	chosen {
>  		bootargs = "earlyprintk console=ttyAMA0";
> -- 
> 2.8.1
> 
