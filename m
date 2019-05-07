From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] of_net: Add NVMEM support to of_get_mac_address
Date: Tue, 7 May 2019 11:06:43 -0500
Message-ID: <CAL_JsqKLgEjgDOHaNHbu7Bqw1gYCBMRcdO_S98nASnCxtinZ=g@mail.gmail.com>
References: <1556456002-13430-1-git-send-email-ynezz@true.cz>
 <1556456002-13430-2-git-send-email-ynezz@true.cz> <20190501201925.GA15495@bogus>
 <20190502090538.GD346@meh.true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190502090538.GD346@meh.true.cz>
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>
Cc: netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Alban Bedel <albeu@free.fr>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2019 at 4:05 AM Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>
> Rob Herring <robh@kernel.org> [2019-05-01 15:19:25]:
>
> Hi Rob,
>
> > > +   struct property *pp;
>
> ...
>
> > > +   pp =3D kzalloc(sizeof(*pp), GFP_KERNEL);
> > > +   if (!pp)
> > > +           return NULL;
> > > +
> > > +   pp->name =3D "nvmem-mac-address";
> > > +   pp->length =3D ETH_ALEN;
> > > +   pp->value =3D kmemdup(mac, ETH_ALEN, GFP_KERNEL);
> > > +   if (!pp->value || of_add_property(np, pp))
> > > +           goto free;
> >
> > Why add this to the DT?
>
> I've just carried it over from v1 ("of_net: add mtd-mac-address support t=
o
> of_get_mac_address()")[1] as nobody objected about this so far.

That's not really a reason...

> Honestly I don't know if it's necessary to have it, but so far address,
> mac-address and local-mac-address properties provide this DT nodes, so I'=
ve
> simply thought, that it would be good to have it for MAC address from NVM=
EM as
> well in order to stay consistent.

If you want to be consistent, then fill in 'local-mac-address' with
the value from nvmem. We don't need the same thing with a new name
added to DT. (TBC, I'm not suggesting you do that here.)

But really, my point with using devm_kzalloc() is just return the
data, not store in DT and free it when the driver unbinds. Allocating
it with devm_kzalloc AND adding it to DT as you've done in v4 leads to
2 entities refcounting the allocation. If the driver unbinds, the
buffer is freed, but DT code is still referencing that memory.

Also, what happens the 2 time a driver binds? The property would
already be in the DT.

>
> Just FYI, my testing ar9331_8dev_carambola2.dts[2] currently produces
> following runtime DT content:
>
>  root@OpenWrt:/# find /sys/firmware/devicetree/ -name *nvmem* -o -name *a=
ddr@*
>  /sys/firmware/devicetree/base/ahb/spi@1f000000/flash@0/partitions/partit=
ion@ff0000/nvmem-cells
>  /sys/firmware/devicetree/base/ahb/spi@1f000000/flash@0/partitions/partit=
ion@ff0000/nvmem-cells/eth-mac-addr@0
>  /sys/firmware/devicetree/base/ahb/spi@1f000000/flash@0/partitions/partit=
ion@ff0000/nvmem-cells/eth-mac-addr@6
>  /sys/firmware/devicetree/base/ahb/spi@1f000000/flash@0/partitions/partit=
ion@ff0000/nvmem-cells/wifi-mac-addr@1002
>  /sys/firmware/devicetree/base/ahb/wmac@18100000/nvmem-cells
>  /sys/firmware/devicetree/base/ahb/wmac@18100000/nvmem-mac-address
>  /sys/firmware/devicetree/base/ahb/wmac@18100000/nvmem-cell-names
>  /sys/firmware/devicetree/base/ahb/eth@1a000000/nvmem-cells
>  /sys/firmware/devicetree/base/ahb/eth@1a000000/nvmem-mac-address
>  /sys/firmware/devicetree/base/ahb/eth@1a000000/nvmem-cell-names
>  /sys/firmware/devicetree/base/ahb/eth@19000000/nvmem-cells
>  /sys/firmware/devicetree/base/ahb/eth@19000000/nvmem-mac-address
>  /sys/firmware/devicetree/base/ahb/eth@19000000/nvmem-cell-names

'nvmem-mac-address' is not a documented property. That would need to
be documented before using upstream. Though, for reasons above, I
don't think it should be.

Rob
