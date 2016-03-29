From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: bcm2835: add CPU node for ARM core
Date: Tue, 29 Mar 2016 11:13:51 +0100
Message-ID: <20160329101351.GC26574@leverpostej>
References: <1459182081-30819-1-git-send-email-stefan.wahren@i2se.com>
 <20160329094158.GB26574@leverpostej>
 <56FA5332.4050707@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FA5332.4050707-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 29, 2016 at 12:04:34PM +0200, Stefan Wahren wrote:
> Am 29.03.2016 um 11:41 schrieb Mark Rutland:
> > On Mon, Mar 28, 2016 at 04:21:20PM +0000, Stefan Wahren wrote:
> >> This patch adds the CPU node of the BCM2835 into the DT.
> >>
> >> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/bcm2835.dtsi |   11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
> >> index b83b326..e87aba1 100644
> >> --- a/arch/arm/boot/dts/bcm2835.dtsi
> >> +++ b/arch/arm/boot/dts/bcm2835.dtsi
> >> @@ -3,6 +3,17 @@
> >>  / {
> >>  	compatible = "brcm,bcm2835";
> >>  
> >> +	cpus {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		cpu@0 {
> >> +			device_type = "cpu";
> >> +			compatible = "arm,arm1176jzf-s", "arm,arm1176";
> >> +			reg = <0x0>;
> >> +		};
> >> +	};
> > Minor nit: the "arm,arm1176" fallback isn't documented, nor used
> > elsewhere, so it can/should be dropped.
> 
> This fallback came from arch/arm/boot/dts/s3c64xx.dtsi

Ah, indeed. I failed to spot that when grepping. For consistency, we
should probably clean that up.

> I will send a V2 without the fallback.

Cheers!

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
