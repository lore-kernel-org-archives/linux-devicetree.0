From: Marc =?UTF-8?B?TWFyw60=?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] QEMU fw_cfg DMA interface documentation
Date: Wed, 2 Sep 2015 10:33:11 +0200
Message-ID: <20150902103311.5335d469@markmb_rh>
References: <1441012133-8154-1-git-send-email-markmb@redhat.com>
	<1441012303-8261-1-git-send-email-markmb@redhat.com>
	<CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2 Sep 2015 09:20:12 +0100
Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Mon, Aug 31, 2015 at 10:11 AM, Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> =
wrote:
> > Add fw_cfg DMA interface specfication in the fw_cfg documentation.
> >
> > Signed-off-by: Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/fw-cfg.txt | 51
> > +++++++++++++++++++++++- 1 file changed, 50 insertions(+), 1
> > deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt
> > b/Documentation/devicetree/bindings/arm/fw-cfg.txt index
> > 953fb64..766ddbe 100644 ---
> > a/Documentation/devicetree/bindings/arm/fw-cfg.txt +++
> > b/Documentation/devicetree/bindings/arm/fw-cfg.txt @@ -45,6 +45,53
> > @@ blob to be read from the data register has size 4, and it is to
> > be interpreted as a uint32_t value in little endian byte order. The
> > current value (corresponding to the above outer protocol) is zero.
> >
> > +If bit 1 of the feature bitmap is set, the DMA interface is
> > present. This +can be used through the 64-bit wide address register=
=2E
> > +
> > +The address register is in big-endian format. The value for the
> > register is 0 +at startup and after an operation. A write to the
> > lower half triggers an +operation. This means, that operations with
> > 32-bit addresses can be triggered +with just one write, whereas
> > operations with 64-bit addresses can be triggered +with one 64-bit
> > write or two 32-bit writes, starting with the higher part. +
> > +In this register, a physical RAM address to a FWCfgDmaAccess
> > structure should +be written. This is the format of the
> > FWCfgDmaAccess structure: +
> > +typedef struct FWCfgDmaAccess {
> > +    uint32_t control;
> > +    uint32_t length;
> > +    uint64_t address;
> > +} FWCfgDmaAccess;
>=20
> I think including the selector field would be nice to avoid extra
> register accesses, but I'm not that familiar with fw_cfg so maybe
> there's a reason not to include that field.

It's just simplicity. If you want to read a few times from the same
field (like in ACPI tables, read the data size and then the data), you
need a way to enable and disable the selector and manage the current
offset for that entry. This is already provided with the "old"
interface.

Moreover, if, for some reason, both systems are being used
simultaneously, some way of interacting both selectors and offsets is
needed.

I think the overhead of writing the selector apart is not that big,
compared to the trouble of adding a new one.

Thanks
Marc
=20
> > +The fields of the structure are in big endian mode, and the field
> > at the lowest +address is the "control" field.
> > +
> > +The "control" field has the following bits:
> > + - Bit 0: Error
> > + - Bit 1: Read
> > + - Bit 2: Skip
> > +
> > +When an operation is triggered, if the "control" field has bit 1
> > set, a read +operation will be performed. "length" bytes for the
> > current selector and +offset will be copied into the address
> > specified by the "address" field.
>=20
> Minor clarification:
> s/address/physical RAM address/
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
