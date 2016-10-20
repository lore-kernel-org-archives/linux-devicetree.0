From: Albert ARIBAUD <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Subject: Re: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width
 property
Date: Thu, 20 Oct 2016 09:17:38 +0200
Message-ID: <20161020091738.37596c14.albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
        <20160927055957.427-2-albert.aribaud@3adev.fr>
        <20161003185143.GA27634@rob-hp-laptop>
        <CAMuHMdW6WJBj3TiXU0mmwKJmcwp28HEVUSD17-7RH7-UXFtX1g@mail.gmail.com>
        <20161018220334.6452fc5b.albert.aribaud@3adev.fr>
        <CAMuHMdW-L=Wc7mcs6s_N+joEZ8hX7DLHoY_YU0wuvnM=3DN8ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdW-L=Wc7mcs6s_N+joEZ8hX7DLHoY_YU0wuvnM=3DN8ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Le Wed, 19 Oct 2016 08:57:27 +0200, Geert Uytterhoeven
<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> a écrit :

> > The fsl-quadspi driver already supports per-NOR read and erase commands
> > to support heterogeneous NOR setups. A per-NOR bus width property would
> > make sense in this light.  
> 
> spi-[tx]x-bus-width is already a property for the SPI slave, not for
> the whole bus.
> So you can use 4 for the quad-capable device, and 1 or 2 for the other.

My bad, then -- I'll use these.

> Gr{oetje,eeting}s,
> 
>                         Geert

Cordialement,
Albert ARIBAUD
3ADEV
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
