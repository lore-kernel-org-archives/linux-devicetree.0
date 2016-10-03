From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Date: Mon, 3 Oct 2016 21:57:58 +0200
Message-ID: <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr> <20160927055957.427-2-albert.aribaud@3adev.fr>
 <20161003185143.GA27634@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161003185143.GA27634@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "Albert ARIBAUD (3ADEV)" <albert.aribaud-iEu9NFBzPZE@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 3, 2016 at 8:51 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:
>> Introduce spi-bus-width property for bus subnodes, to
>> specify per-bus capability to use NORMAL, FAST, DUAL,
>> and/or QUAD reads.
>>
>> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>
> Make this a common property.

They already exist:

Documentation/devicetree/bindings/spi/spi-bus.txt:
- spi-tx-bus-width - (optional) The bus width (number of data wires) that is
                      used for MOSI. Defaults to 1 if not present.
- spi-rx-bus-width - (optional) The bus width (number of data wires) that is
                      used for MISO. Defaults to 1 if not present.

The above are for normal/dual/quad.

"Fast" is not a property of the bus, but of the SPI slave, right? Cfr.

Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
- m25p,fast-read : Use the "fast read" opcode to read data from the chip instead
                   of the usual "read" opcode. This opcode is not supported by
                   all chips and support for it can not be detected at runtime.
                   Refer to your chips' datasheet to check if this is supported
                   by your chip.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
