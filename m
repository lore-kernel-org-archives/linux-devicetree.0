From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5] QEMU fw_cfg DMA interface documentation
Date: Fri, 9 Oct 2015 01:38:09 +0200
Message-ID: <5616FE61.3010002@redhat.com>
References: <1444316523-21711-1-git-send-email-markmb@redhat.com>
 <1444316621-21863-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444316621-21863-1-git-send-email-markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/08/15 17:03, Marc Mar=C3=AD wrote:
> Add fw_cfg DMA interface specfication in the fw_cfg documentation.
>=20
> Signed-off-by: Marc Mar=C3=AD <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/fw-cfg.txt | 52 ++++++++++++++=
+++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Docum=
entation/devicetree/bindings/arm/fw-cfg.txt
> index 953fb64..0633aad 100644
> --- a/Documentation/devicetree/bindings/arm/fw-cfg.txt
> +++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
> @@ -38,6 +38,9 @@ The presence of the registers can be verified by se=
lecting the "signature" blob
>  with key 0x0000, and reading four bytes from the data register. The =
returned
>  signature is "QEMU".
> =20
> +If the DMA interface is available, then reading the DMA Address Regi=
ster
> +returns 0x51454d5520434647 ("QEMU CFG" in big-endian format).
> +

marking this for a later argument: (*)

>  The outermost protocol (involving the write / read sequences of the =
control and
>  data registers) is expected to be versioned, and/or described by fea=
ture bits.
>  The interface revision / feature bitmap can be retrieved with key 0x=
0001. The
> @@ -45,6 +48,51 @@ blob to be read from the data register has size 4,=
 and it is to be interpreted
>  as a uint32_t value in little endian byte order. The current value
>  (corresponding to the above outer protocol) is zero.
> =20
> +If bit 1 of the feature bitmap is set, the DMA interface is present.=
 This
> +can be used through the 64-bit wide address register.
> +
> +The address register is in big-endian format. The value for the regi=
ster is 0
> +at startup and after an operation. A write to the lower half trigger=
s an
> +operation. This means, that operations with 32-bit addresses can be =
triggered
> +with just one write, whereas operations with 64-bit addresses can be=
 triggered
> +with one 64-bit write or two 32-bit writes, starting with the higher=
 part.

Please sync this language with the "least significant half" / "most
significant half" wording that I requested after your QEMU

  [PATCH v4 2/7] fw_cfg DMA interface documentation

and that you implemented in your present QEMU

  [PATCH v5 2/6] fw_cfg DMA interface documentation

> +
> +In this register, the physical address of a FWCfgDmaAccess structure=
 in RAM
> +should be written. This is the format of the FWCfgDmaAccess structur=
e:
> +
> +typedef struct FWCfgDmaAccess {
> +    uint32_t control;
> +    uint32_t length;
> +    uint64_t address;
> +} FWCfgDmaAccess;
> +
> +The fields of the structure are in big endian mode, and the field at=
 the lowest
> +address is the "control" field.
> +
> +The "control" field has the following bits:
> + - Bit 0: Error
> + - Bit 1: Read
> + - Bit 2: Skip
> + - Bit 3: Select. The upper 16 bits are the selected index.
> +
> +When an operation is triggered, if the "control" field has bit 3 set=
, the
> +upper 16 bits are interpreted as an index of a firmware configuratio=
n item.
> +This has the same effect as writing the selector register.
> +
> +If the "control" field has bit 1 set, a read operation will be perfo=
rmed.
> +"length" bytes for the current selector and offset will be copied in=
to the
> +physical RAM address specified by the "address" field.
> +
> +If the "control" field has bit 2 set (and not bit 1), a skip operati=
on will be
> +performed. The offset for the current selector will be advanced "len=
gth" bytes.
> +
> +To check the result, read the "control" field:
> +   error bit set        ->  something went wrong.
> +   all bits cleared     ->  transfer finished successfully.
> +   otherwise            ->  transfer still in progress (doesn't happ=
en
> +                            today due to implementation not being as=
ync,
> +                            but may in the future).
> +
>  The guest kernel is not expected to use these registers (although it=
 is
>  certainly allowed to); the device tree bindings are documented here =
because
>  this is where device tree bindings reside in general.

I guess this is all coming verbatim from the QEMU spec. I think that's
okay, it doesn't speak about selector values etc, only about transport.
I think it's okay (and consistent with the current text) to have all th=
e
details here.

> @@ -56,6 +104,8 @@ Required properties:
>  - reg: the MMIO region used by the device.
>    * Bytes 0x0 to 0x7 cover the data register.
>    * Bytes 0x8 to 0x9 cover the selector register.
> +  * With DMA interface enabled: Bytes 0x10 to 0x17 cover the DMA add=
ress
> +    register.
>    * Further registers may be appended to the region in case of futur=
e interface
>      revisions / feature bits.
> =20
> @@ -66,7 +116,7 @@ Example:
>  	#address-cells =3D <0x2>;
> =20
>  	fw-cfg@9020000 {
> +		reg =3D <0x0 0x9020000 0x0 0x18>;
>  		compatible =3D "qemu,fw-cfg-mmio";
> -		reg =3D <0x0 0x9020000 0x0 0xa>;
>  	};
>  };
>=20

Please make this a bit more precise. As already mentioned by Peter (in
another part of the discussion), you can't read the DMA address registe=
r
until you know that it exists. Therefore the part I marked with (*)
above is only usable in the ioport-mapped, x86 case for feature
detection. On ARM, what we key off of primarily is the *size* of the
register block, and only if the DMA address register fits in there, can
we read the feature bitmap (for double-checking), and/or read a
signature from the DMA address register.

Therefore, I think the example device tree snippet is okay, but the hun=
k
above it should sound like:

    * Bytes 0x10 to 0x17, if they exist in the region -- and the
      feature bitmap confirms the presence of the DMA interface --
      cover the DMA address register.

The AAVMF client code does just this. (I.e., checks the size of the
region first, then reads the feature bitmap *without* DMA, then perform=
s
further reads with DMA.)

Thanks
Laszlo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
