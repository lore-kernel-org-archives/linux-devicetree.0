From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 04/11] ARM: bcm2835: dt: add bindings for shared
 interrupt properties
Date: Fri, 11 Mar 2016 11:23:56 +0530
Message-ID: <20160311055356.GM11154@localhost>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org>
 <1457175142-28665-5-git-send-email-kernel@martin.sperl.org>
 <87fuw1yipi.fsf@eliezer.anholt.net>
 <3503D512-7E9C-46E8-91C7-CAD828DD48D1@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3503D512-7E9C-46E8-91C7-CAD828DD48D1-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2016 at 12:23:51PM +0100, Martin Sperl wrote:
>=20
> > On 08.03.2016, at 00:24, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org> wrote:
> >=20
> > kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org writes:
> >=20
> >> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
> >>=20
> >> Add binding documentation for the new shared interrupt properties:
> >> * brcm,dma-channel-shared-mask
> >> * brcm,dma-shared-irq-index
> >>=20
> >> Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
> >> ---
> >> Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt | 6 +++=
+++
> >> 1 file changed, 6 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dm=
a.txt b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> >> index 1396078..f9e84ee 100644
> >> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> >> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> >> @@ -17,6 +17,10 @@ Required properties:
> >> - brcm,dma-channel-mask: Bit mask representing the channels
> >> 			 not used by the firmware in ascending order,
> >> 			 i.e. first channel corresponds to LSB.
> >> +- brcm,dma-channel-shared-mask: Bit mask representing the channel=
s
> >> +				that use a shared interrupt
> >> +- brcm,dma-shared-irq-index: index of which of the interrupts men=
tioned
> >> +			     above is the shared interrupt
> >=20
> > This should be under "Optional properties" since there are appropri=
ate
> > defaults for the only compatible string listed.
>=20
> Well - IMO it is actually required and the defaults are only for back=
wards
> compatibility with older device-trees, but that is easy to change=E2=80=
=A6
> >=20
> > I still don't think exposing this in the DT is necessary (it's hard=
ware
> > block internals), but I'm not writing the code so I'm fine with it
> Actually this was a request by Vinod to make this configurable via th=
e
> device-tree.

DT needs to provide the hardware details for driver to work across
generations. Driver needs to get information like this to make decision=
s and
not hard code and make driver not scale..

>=20
> > either way, really.  Regardless, it would be really good to get the
> > slave_sg part of the series in, which is really important for the
> > platform.
> Yes, then we can bring the DMA implementations for mmc/sdhost forward=
=2E
>=20
> Martin
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
