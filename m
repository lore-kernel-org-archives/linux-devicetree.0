From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Add more recommended generic node names
Date: Sat, 4 Mar 2017 13:36:26 -0800
Message-ID: <c4906f48-dc13-caba-2671-72dba9905e92@gmail.com>
References: <20170120222932.14753-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120222932.14753-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 01/20/17 à 14:29, Rob Herring a écrit :
> DT usage and hardware types have evolved quite a bit and the generic
> node names list is quite out of date. Add new entries to the list based
> on dumping out node names from dts files. This is by no means complete,
> but is low hanging fruit.

FWIW:

Acked-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> 
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  source/devicetree-basics.rst | 51 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/source/devicetree-basics.rst b/source/devicetree-basics.rst
> index be80af3d825b..93cea8e82a64 100644
> --- a/source/devicetree-basics.rst
> +++ b/source/devicetree-basics.rst
> @@ -182,44 +182,95 @@ name should be one of the following choices:
>  .. hlist::
>     :columns: 3
>  
> +   * adc
> +   * accelerometer
>     * atm
> +   * audio-codec
> +   * audio-controller
> +   * backlight
> +   * bluetooth
> +   * bus
>     * cache-controller
> +   * camera
> +   * can
> +   * charger
> +   * clock
> +   * clock-controller
>     * compact-flash
>     * can
>     * cpu
> +   * cpus
>     * crypto
>     * disk
>     * display
>     * dma-controller
> +   * dsp
> +   * eeprom
> +   * efuse
> +   * endpoint
>     * ethernet
>     * ethernet-phy
>     * fdc
>     * flash
>     * gpio
> +   * gpu
> +   * gyrometer
> +   * hdmi
>     * i2c
>     * ide
>     * interrupt-controller
>     * isa
>     * keyboard
> +   * key
> +   * keys
> +   * lcd-controller
> +   * led
> +   * leds
> +   * led-controller
> +   * light-sensor
> +   * magnetometer
> +   * mailbox
>     * mdio
>     * memory
>     * memory-controller
> +   * mmc
> +   * mmc-slot
>     * mouse
> +   * nand-controller
>     * nvram
> +   * oscillator
>     * parallel
>     * pc-card
>     * pci
>     * pcie
> +   * phy
> +   * pinctrl
> +   * pmic
> +   * pmu
> +   * port
> +   * ports
> +   * pwm
> +   * regulator
> +   * reset-controller
>     * rtc
>     * sata
>     * scsi
>     * serial
>     * sound
>     * spi
> +   * sram-controller
> +   * ssi-controller
> +   * syscon
> +   * temperature-sensor
>     * timer
> +   * touchscreen
>     * usb
> +   * usb-hub
> +   * usb-phy
> +   * video-codec
>     * vme
>     * watchdog
> +   * wifi
>  
>  Path Names
>  ~~~~~~~~~~
> 


-- 
Florian
