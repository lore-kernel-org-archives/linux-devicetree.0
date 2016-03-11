From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Subject: Re: [PATCH v3 04/11] ARM: bcm2835: dt: add bindings for shared interrupt properties
Date: Fri, 11 Mar 2016 09:51:59 +0100
Message-ID: <E60A6B56-0F3F-465C-8BF7-59EF35D41070@martin.sperl.org>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org> <1457175142-28665-5-git-send-email-kernel@martin.sperl.org> <20160310085714.GA31313@svinekod>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160310085714.GA31313@svinekod>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On 10.03.2016, at 09:57, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
>=20
> Hi,
>=20
> As a general note, please put DT bindings patches before any patches
> implementing them, as per
> Documentation/devicetree/bindings/submitting-patches.txt.
>=20
> That makes it possible to review a series in-order.
>=20
> On Sat, Mar 05, 2016 at 10:52:15AM +0000, kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org wro=
te:
>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>>=20
>> Add binding documentation for the new shared interrupt properties:
>> * brcm,dma-channel-shared-mask
>> * brcm,dma-shared-irq-index
>>=20
>> Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>> ---
>> Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt | 6 +++++=
+
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.=
txt b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
>> index 1396078..f9e84ee 100644
>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
>> @@ -17,6 +17,10 @@ Required properties:
>> - brcm,dma-channel-mask: Bit mask representing the channels
>> 			 not used by the firmware in ascending order,
>> 			 i.e. first channel corresponds to LSB.
>> +- brcm,dma-channel-shared-mask: Bit mask representing the channels
>> +				that use a shared interrupt
>=20
> Generally we don't like masks in DT (though I see this is in keeping =
with
> another property above). I won't push strongly here.
>=20
> I take it that this is a fixed HW property rather than a software con=
figuration
> option?

This is fixed HW property - the mask/mapping was originally proposed
to be =E2=80=9Chardcoded=E2=80=9D inside the driver.

Maybe some background on the dma-channel-mask property:
it is changed during loading the dt by the firmware
to mask out the channels that the firmware is using.

>=20
>> +- brcm,dma-shared-irq-index: index of which of the interrupts menti=
oned
>> +			     above is the shared interrupt
>=20
> What is the usual order of the interrupts? How are they expected to b=
e parsed
> if this is in the middle of the list, for example?
>=20
> I think this needs a more thorough description.

The reason that it was done this way is mostly because of DT-backwards
compatibility the 11th irq is the shared interrupt -there were some
wrong assumptions by the original author on the interrupts
(i.e there is a dedicated interrupt per channel).

Just hardcoding it inside the driver was not what Vinod wanted - even
if the design stayed fixed for now 3 different chips:
bcm2835, bcm2836 and bcm2837

Alternative options that have been considered:
* there is unfortunately no =E2=80=9Cinterrupt-names=E2=80=9D property =
(like it exists for
  reg, dma), because then I would have preferred to used:
     interrupts =3D <...>, <...>, =E2=80=A6;
     interrupt-name =3D =E2=80=9Cdma0=E2=80=9D, =E2=80=9Cdma1=E2=80=9D,=
 ..., =E2=80=9Cdma10=E2=80=9D, =E2=80=9Cdmashared=E2=80=9D, =E2=80=9Cdm=
aall=E2=80=9D;
  with something like this we could probably have avoided both properti=
es
  and just added a legacy mapping
  This would require some changes to the irq framework (which I wanted
  to avoid)
* I could have also written a custom parser in the driver to allow:
     interrupt-shared =3D <&int X>;
   but I would guess something like this to be frowned upon...
* a total restructure of the DT to a more expressive format so that=20
  each channel would need to be described separately (with the=20
  corresponding custom dt parser).
  The big advantage here would be that we can define the reg and irq
  range for each channel separately.
  Could look something like:
     dma: dma@7e0070fe0 {
        reg =3D <0x7e0070fe0 0x20>;
        compatible =3D "brcm,bcm2835-dma=E2=80=9D;
        interrupts =3D <irq-shared> <irq-all>;
        dma0: dma@7e007000 {
	  reg =3D <0x7e007000 0x24>;
          interrupts =3D <irq-dma0>;
        };
        dma1: dma@7e007100 {
	  reg =3D <0x7e007100 0x24>;
          interrupts =3D <irq-dma1>;
        };
   	...
        dma10: dma@7e007a00 {
	  reg =3D <0x7e007a00 0x24>;
          interrupts =3D <irq-dma10>;
        };
        /* channel with shared interrupts */
        dma11: dma@7e007b00 {
	  reg =3D <0x7e007b00 0x24>;
	  /* no irq - use shared */
        };
        dma14: dma@7e007b00 {
	  reg =3D <0x7e007b00 0x24>;
	  /* no irq - use shared */
        };
	/*
         * dma channel 15 is a different type:
	 * only triggers irq-all (with all its problems)
         * is in a different memory location
         */
	dma15: dma@7ee05000 {
	  reg =3D <0x7ee05000 0x24>;
	  /* potentially mark the use of the =E2=80=9Call=E2=80=9D irq */
        };
     };
  It would make the device tree a lot longer (at least 60 lines) for
  minimal gains.
  In addition it is a lot of effort for something that has been fixed
  for 3 chip designs (bcm2835, bcm2836 and bcm2837)

  Something like this has been proposed as an option end of
  January, but there was never a feedback if something like
  this was preferred.

Please give guidance on the preferred solution.

We really would like to get the slave-dma feature into the kernel
so that we can start using it with the mmc/sdhost implementation.

Thanks,
	Martin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
