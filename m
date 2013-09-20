From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] [PATCH] ARM: sunxi: doc: Add sun7i (A20) interrupt
 table
Date: Fri, 20 Sep 2013 13:39:56 +0100
Message-ID: <20130920123956.GI17453@e106331-lin.cambridge.arm.com>
References: <1379675560-30656-1-git-send-email-oliver+list@schinagl.nl>
 <1379675560-30656-2-git-send-email-oliver+list@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379675560-30656-2-git-send-email-oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oliver Schinagl <oliver+list-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "maxime-ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime-ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-sunxi-hgOgZXxJVMEY/9To+DJ4pgC/G2K4zDHf@public.gmane.org" <linux-sunxi-hgOgZXxJVMEY/9To+DJ4pgC/G2K4zDHf@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org" <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org" <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2013 at 12:12:40PM +0100, Oliver Schinagl wrote:
> From: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
> 
> This patch adds some documentation about the Allwinner sun7i (A20) using
> the GIC.
> 
> Signed-off-by: Oliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

NAK.

This information is not a binding, and it's not a property of the
interrupt controller. It's the integration of a full SoC, which should
be described full in a dtsi where it can actually be used.

The only other SoCs that have this are other sunxi variants, and I see
no reason to have them here either.

Thanks,
Mark.

> ---
>  .../interrupt-controller/sunxi/sun7i-a20.txt       | 102 +++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sunxi/sun7i-a20.txt
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sunxi/sun7i-a20.txt b/Documentation/devicetree/bindings/interrupt-controller/sunxi/sun7i-a20.txt
> new file mode 100644
> index 0000000..e5e59df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sunxi/sun7i-a20.txt
> @@ -0,0 +1,102 @@
> +Allwinner A20 (sun7i) interrupt sources
> +---------------------------------------
> +The sun7i interrupt controller is actually a standard arm GIC one. For more
> +information see Documentation/devicetree/bindings/arm/gic.txt
> +
> +Interrupts are offset by 32, skipping the SGI and PPI's. The IRQ numbers here
> +is what is expected in the drivers device tree table.
> +
> +The interrupt sources available for the Allwinner A20 SoC are the
> +following ones:
> +
> +0: ENMI
> +1: UART0
> +2: UART1
> +3: UART2
> +4: UART3
> +5: IR0
> +6: IR1
> +7: I2C0
> +8: I2C1
> +9: I2C2
> +10: SPI0
> +11: SPI1
> +12: SPI2
> +13: SPDIF
> +14: AC97
> +15: TS
> +16: I2S0
> +17: UART4
> +18: UART5
> +19: UART6
> +20: UART7
> +21: KEYPAD
> +22: TIMER0
> +23: TIMER1
> +24: TIMER2
> +25: TIMER3
> +26: CAN
> +27: DMA
> +28: PIO
> +29: TOUCH_PANEL
> +30: AUDIO_CODEC
> +31: LRADC
> +32: MMC0
> +33: MMC1
> +34: MMC2
> +35: MMC3
> +36: MEMSTICK
> +37: NAND
> +38: USB0
> +39: USB1
> +40: USB2
> +41: SCR
> +42: CSI0
> +43: CSI1
> +44: LCDCTRL0
> +45: LCDCTRL1
> +46: MP
> +47: DEFEBE0
> +48: DEFEBE1
> +49: PMU
> +50: SPI3
> +51: TZASC
> +52: PATA
> +53: VE
> +54: SS
> +55: EMAC
> +56: SATA
> +57: GPS
> +58: HDMI
> +59: TVE
> +60: ACE
> +61: TVD
> +62: PS2_0
> +63: PS2_1
> +64: USB3
> +65: USB4
> +66: PLE_PFM
> +67: TIMER4
> +68: TIMER5
> +69: GPU_GP
> +70: GPU_GPMMU
> +71: GPU_PP0
> +72: GPU_PPMMU0
> +73: GPU_PMU
> +74: GPU_PP1
> +75: GPU_PPMMU1
> +76: GPU_RSV0
> +77: GPU_RSV1
> +78: GPU_RSV2
> +79: GPU_RSV3
> +80: GPU_RSV4
> +81: HS_TIMER0
> +82: HS_TIMER1
> +83: HS_TIMER2
> +84: HS_TIMER3
> +85: GMAC
> +86: HDMI1
> +87: I2S1
> +88: I2C3
> +89: I2C4
> +90: I2S2
> -- 
> 1.8.1.5
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
