From: Michael Zoran <mzoran-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
Subject: Minecraft_pi now works in Raspbian with arm64 kernel from
 staging-testing
Date: Mon, 20 Mar 2017 20:38:41 -0700
Message-ID: <1490067521.11105.19.camel@crowfest.net>
References: <1489937108.13607.1.camel@crowfest.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489937108.13607.1.camel-O+n0w2l5AFbk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, stefan.wahren-eS4NqCHxEME@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Just thought people might find this useful.

I think at this point it might be working from linux-next as well.

Where do I e-mail updated DT bindings to?

On Sun, 2017-03-19 at 08:25 -0700, Michael Zoran wrote:
> So this morning after testing a new firmware release for the RPI, I
> was
> able to get minecraft_pi on ARM 64 to work on Raspbian when built
> from
> the upstream staging-testing tree.
> 
> I'm including the DT I used for testing.  The firmware creates the
> simplefb node that it's been doing for testing on the RPI 3 for a
> very
> long time now.
> 
> The only issue is that it appears for now you will need to hard code
> your display settings in config.txt and you will need to set
> gpu_mem=128 or something reasonable just like most people would do in
> Raspbian.
> 
> The lastest firmware for the RPI is available at:(Where updates are
> always available)
> https://github.com/raspberrypi/firmware
> 
> This is the replacement for arch/arm64/boot/dts/broadcom/bcm2837-rpi-
> 3-
> b.dts
> 
> /dts-v1/;
> #include "bcm2837.dtsi"
> #include "bcm2835-rpi.dtsi"
> #include "bcm283x-rpi-smsc9514.dtsi"
> #include "bcm283x-rpi-usb-host.dtsi"
> 
> / {
> 	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
> 	model = "Raspberry Pi 3 Model B";
> 
> 	memory {
> 		reg = <0 0x40000000>;
> 	};
> 
> 	leds {
> 		act {
> 			gpios = <&gpio 47 0>;
> 		};
> 	};
> 
> 
> 	soc {
> 
> 		hvs@7e400000 {
> 			status = "disabled";
> 		};
> 
> 		v3d: v3d@7ec00000 {
> 			status = "disabled";
> 		};
> 
> 		vc4: gpu {
> 			status = "disabled";
> 		};
> 
>                 fb: fb {
>                         status = "disabled";
>                 };
> 
> 		vchiq: vchiq {
> 			compatible = "brcm,bcm2835-vchiq";
> 			reg = <0x7e00b840 0xf>;
> 			interrupts = <0 2>;
> 			cache-line-size = <32>;
> 			firmware = <&firmware>;
> 		};
> 
> 		audio: audio {
> 			compatible = "brcm,bcm2835-audio";
> 			brcm,pwm-channels = <8>;
> 		};
> 
> 	};
> 
> 	__overrides__ {
> 		cache_line_size = <&vchiq>, "cache-line-size:0";
> 	};
> 
> };
> 
> &uart1 {
> 	status = "okay";
> };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
