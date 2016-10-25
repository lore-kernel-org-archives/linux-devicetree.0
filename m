From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC v2] ARM: memory: da8xx-ddrctl: new driver
Date: Tue, 25 Oct 2016 13:23:46 -0700
Message-ID: <7hoa28tbxp.fsf@baylibre.com>
References: <1477402876-22472-1-git-send-email-bgolaszewski@baylibre.com>
        <1477402876-22472-2-git-send-email-bgolaszewski@baylibre.com>
        <7hy41ctipa.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7hy41ctipa.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Kevin Hilman's message of "Tue, 25
        Oct 2016 10:57:37 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
>
>> Create a new driver for the da8xx DDR2/mDDR controller and implement
>> support for writing to the Peripheral Bus Burst Priority Register.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../memory-controllers/ti-da8xx-ddrctl.txt         |  20 +++
>>  drivers/memory/Kconfig                             |   8 +
>>  drivers/memory/Makefile                            |   1 +
>>  drivers/memory/da8xx-ddrctl.c                      | 175 +++++++++++++++++++++
>>  4 files changed, 204 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>>  create mode 100644 drivers/memory/da8xx-ddrctl.c
>>
>> diff --git
>> a/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> new file mode 100644
>> index 0000000..7e271dd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
>> @@ -0,0 +1,20 @@
>> +* Device tree bindings for Texas Instruments da8xx DDR2/mDDR memory controller
>> +
>> +The DDR2/mDDR memory controller present on Texas Instruments da8xx SoCs features
>> +a set of registers which allow to tweak the controller's behavior.
>> +
>> +Documentation:
>> +OMAP-L138 (DA850) - http://www.ti.com/lit/ug/spruh82c/spruh82c.pdf
>> +
>> +Required properties:
>> +
>> +- compatible:		"ti,da850-ddr-controller" - for da850 SoC based boards
>> +- reg:			a tuple containing the base address of the memory
>> +			controller and the size of the memory area to map
>> +
>> +Example for da850 shown below.
>> +
>> +ddrctl {
>> +	compatible = "ti,da850-ddr-controller";
>> +	reg = <0xB0000000 0x100>;
>> +};
>
> Axel's series for the USB PHY reminded me that the PHY also has some
> config registers in this same area, and his series creates a syscon for
> a similar range of registers.
>
> Could you create a syscon for the SYSCFG0 registers, which would then
> be used by ths driver and your other drivers/bus driver?  Then the
> binding  would just reference the sysconf via phandle, and your driver
> can use syscon_regmap_lookup_by_phandle()

Nevermind. I though that the config register in this driver was also in
SYSCFG0, but I see now that it's in the reg region of the DDR controller
itself, so no syscon is needed.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
