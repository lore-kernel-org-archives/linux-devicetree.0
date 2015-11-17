From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] DT: nvmem: Add NXP LPC18xx EEPROM memory binding
 documentation
Date: Mon, 16 Nov 2015 18:11:56 -0600
Message-ID: <20151117001156.GA12542@rob-hp-laptop>
References: <1447690798-14641-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1447690798-14641-2-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447690798-14641-2-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 16, 2015 at 01:19:55PM -0300, Ariel D'Alessandro wrote:
> Add the devicetree binding document for NXP LPC18xx EEPROM memory.
> 
> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/nvmem/lpc1857-eeprom.txt   | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
> new file mode 100644
> index 0000000..809df68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/lpc1857-eeprom.txt
> @@ -0,0 +1,28 @@
> +* NXP LPC18xx EEPROM memory NVMEM driver
> +
> +Required properties:
> +  - compatible: Should be "nxp,lpc1857-eeprom"
> +  - reg: Must contain an entry with the physical base address and length
> +    for each entry in reg-names.
> +  - reg-names: Must include the following entries.
> +    - reg: EEPROM registers.
> +    - mem: EEPROM address space.
> +  - clocks: Must contain an entry for each entry in clock-names.
> +  - clock-names: Must include the following entries.
> +    - eeprom: EEPROM operating clock.
> +  - resets: Should contain a reference to the reset controller asserting
> +    the EEPROM in reset.
> +  - interrupts: Should contain EEPROM interrupt.
> +
> +Example:
> +
> +  eeprom: eeprom@4000e000 {
> +    compatible = "nxp,lpc1857-eeprom";
> +    reg = <0x4000e000 0x1000>,
> +          <0x20040000 0x4000>;
> +    reg-names = "reg", "mem";
> +    clocks = <&ccu1 CLK_CPU_EEPROM>;
> +    clock-names = "eeprom";
> +    resets = <&rgu 27>;
> +    interrupts = <4>;
> +  };
> -- 
> 2.6.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
