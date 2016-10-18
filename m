From: Albert ARIBAUD <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width
 property
Date: Tue, 18 Oct 2016 22:03:34 +0200
Message-ID: <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
        <20160927055957.427-2-albert.aribaud@3adev.fr>
        <20161003185143.GA27634@rob-hp-laptop>
        <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob and Geert,

Le Mon, 3 Oct 2016 21:57:58 +0200, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> a écrit :

> On Mon, Oct 3, 2016 at 8:51 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Sep 27, 2016 at 07:59:57AM +0200, Albert ARIBAUD (3ADEV) wrote:  
> >> Introduce spi-bus-width property for bus subnodes, to
> >> specify per-bus capability to use NORMAL, FAST, DUAL,
> >> and/or QUAD reads.
> >>
> >> Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)  
> >
> > Make this a common property.  

@Rob: do you mean common to all slaves, i.e. described
in ./Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt?

> They already exist:
> 
> Documentation/devicetree/bindings/spi/spi-bus.txt:
> - spi-tx-bus-width - (optional) The bus width (number of data wires)
> that is used for MOSI. Defaults to 1 if not present.
> - spi-rx-bus-width - (optional) The bus width (number of data wires)
> that is used for MISO. Defaults to 1 if not present.
> 
> The above are for normal/dual/quad.
> 
> "Fast" is not a property of the bus, but of the SPI slave, right? Cfr.
> 
> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
> - m25p,fast-read : Use the "fast read" opcode to read data from the
> chip instead of the usual "read" opcode. This opcode is not supported
> by all chips and support for it can not be detected at runtime.
>                    Refer to your chips' datasheet to check if this is
> supported by your chip.
> 
> Gr{oetje,eeting}s,

@Geert: the problem here is that on the board for which I wrote this
patch, only one of the two NOR slaves can do quad SPI; the other one
can do dual at best. Setting a bus property would prevent the
quad-capable device from doing actual quad reads.

The fsl-quadspi driver already supports per-NOR read and erase commands
to support heterogeneous NOR setups. A per-NOR bus width property would
make sense in this light.

Cordialement,
Albert ARIBAUD
3ADEV
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
