From: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v2] QEMU fw_cfg DMA interface documentation
Date: Wed, 2 Sep 2015 09:20:12 +0100
Message-ID: <CAJSP0QXgiMo0ahzRQ=2iMXVmiO+R27Re17c966LX1T_Q=Rdgow@mail.gmail.com>
References: <1441012133-8154-1-git-send-email-markmb@redhat.com>
	<1441012303-8261-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441012303-8261-1-git-send-email-markmb@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Marc_Mar=C3=AD?= <markmb@redhat.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Drew <drjones@redhat.com>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>, Laszlo <lersek@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Graf <agraf@suse.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 31, 2015 at 10:11 AM, Marc Mar=C3=AD <markmb@redhat.com> wr=
ote:
> Add fw_cfg DMA interface specfication in the fw_cfg documentation.
>
> Signed-off-by: Marc Mar=C3=AD <markmb@redhat.com>
> ---
>  Documentation/devicetree/bindings/arm/fw-cfg.txt | 51 ++++++++++++++=
+++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/fw-cfg.txt b/Docum=
entation/devicetree/bindings/arm/fw-cfg.txt
> index 953fb64..766ddbe 100644
> --- a/Documentation/devicetree/bindings/arm/fw-cfg.txt
> +++ b/Documentation/devicetree/bindings/arm/fw-cfg.txt
> @@ -45,6 +45,53 @@ blob to be read from the data register has size 4,=
 and it is to be interpreted
>  as a uint32_t value in little endian byte order. The current value
>  (corresponding to the above outer protocol) is zero.
>
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
> +
> +In this register, a physical RAM address to a FWCfgDmaAccess structu=
re should
> +be written. This is the format of the FWCfgDmaAccess structure:
> +
> +typedef struct FWCfgDmaAccess {
> +    uint32_t control;
> +    uint32_t length;
> +    uint64_t address;
> +} FWCfgDmaAccess;

I think including the selector field would be nice to avoid extra
register accesses, but I'm not that familiar with fw_cfg so maybe
there's a reason not to include that field.

> +The fields of the structure are in big endian mode, and the field at=
 the lowest
> +address is the "control" field.
> +
> +The "control" field has the following bits:
> + - Bit 0: Error
> + - Bit 1: Read
> + - Bit 2: Skip
> +
> +When an operation is triggered, if the "control" field has bit 1 set=
, a read
> +operation will be performed. "length" bytes for the current selector=
 and
> +offset will be copied into the address specified by the "address" fi=
eld.

Minor clarification:
s/address/physical RAM address/

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
