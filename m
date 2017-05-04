From: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RFC] Documentation/devicetree: Add specification for FSI
 busses
Date: Thu, 4 May 2017 16:02:34 -0500
Message-ID: <eb310c6a-0b41-aecd-2ae5-025a8f64b152@linux.vnet.ibm.com>
References: <1493704508-27119-1-git-send-email-jk@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493704508-27119-1-git-send-email-jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/02/2017 12:55 AM, Jeremy Kerr wrote:
> This change introduces a proposed layout for describing FSI busses in
> the device tree. While the bus is probe-able, we'd still like a method
> of describing subordinate (eg i2c) busses that are behind FSI devices.
>
> The FSI core will be responsible for matching probed slaves & engines to
> their device tree nodes, so the FSI device drivers' probe() functions
> will be passed a struct device with the appropriate of_node populated
> where a matching DT node is found.
>
> RFC at this stage, so I'd welcome any feedback.
>
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> ---
> +
> +Full example
> +------------
> +
> +    /* The GPIO-based FSI master node, describing the top level of the
> +     * FSI bus
> +     */
> +    gpio-fsi {
> +        compatible = "fsi-master-gpio", "fsi-master";
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        /* A FSI slave (aka. CFAM) at link 0, ID 0. */
> +        cfam@0,0 {
> +            reg = <0 0>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +
> +            /* FSI engine at 0xc00, using a single page. In this example,
> +             * it's an I2C master controller, so subnodes describe the
> +             * I2C bus.
> +             */
> +            i2c-controller@c00 {
> +                reg = <0xc00 0x400>;
> +
> +                /* Engine-specific data. In this case, we're describing an
> +                 * I2C bus, so we're conforming to the generic I2C binding
> +                 */
> +                compatible = "ibm,fsi-i2c";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                /* I2C endpoint device: an Atmel EEPROM */
> +                eeprom@50 {
> +                    compatible = "atmel,24c256";
> +                    reg = <0x50>;
> +                    pagesize = <64>;
> +                };

I have no problem with this as an example, but it isn't exactly how the 
tree will look under the p8/p9 fsi-attached i2c master. We will instead 
need a list of ports on the master. Then you could put actual devices 
(eeproms, etc) under the ports if desired.

Looks like good documentation to me though. This is working well for my 
I2C driver in combination with your latest FSI patches, Jeremy.

Acked-by: Eddie James <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

> +            };
> +        };
> +    };

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
