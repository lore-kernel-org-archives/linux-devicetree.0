From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/14] DEVICETREE: Add bindings for PIC32 interrupt
 controller
Date: Sun, 22 Nov 2015 15:14:53 -0600
Message-ID: <20151122211453.GA13180@rob-hp-laptop>
References: <1448065205-15762-1-git-send-email-joshua.henderson@microchip.com>
 <1448065205-15762-2-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448065205-15762-2-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 05:17:13PM -0700, Joshua Henderson wrote:
> From: Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> 
> Document the devicetree bindings for the interrupt controller on Microchip
> PIC32 class devices. This also adds a header defining associated interrupts
> and related settings.
> 
> Signed-off-by: Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> ---
>  .../microchip,pic32mz-evic.txt                     |   65 ++++++
>  .../interrupt-controller/microchip,pic32mz-evic.h  |  238 ++++++++++++++++++++
>  2 files changed, 303 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
>  create mode 100644 include/dt-bindings/interrupt-controller/microchip,pic32mz-evic.h
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
> new file mode 100644
> index 0000000..12fb91f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,pic32mz-evic.txt
> @@ -0,0 +1,65 @@
> +Microchip PIC32MZ Interrupt Controller
> +======================================
> +
> +The Microchip PIC32MZ SOC contains an Enhanced Vectored Interrupt Controller
> +(EVIC) version 2. It handles internal and external interrupts and provides
> +support for priority, sub-priority, irq type and polarity.
> +
> +Required properties
> +-------------------
> +
> +- compatible: Should be "microchip,evic-v2"

This should be more specific like "microchip,pic32mz-evic". You can keep 
this one in addition if you like for matching.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
