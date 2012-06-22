From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] of: fix a few typos in the binding documentation
Date: Fri, 22 Jun 2012 07:49:42 +0200
Message-ID: <20120622054942.GI5642@pengutronix.de>
References: <1335171443-15371-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20120518142148.GC3710@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120518142148.GC3710-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: Artem Bityutskiy <artem.bityutskiy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Randy,

expanding the audience a bit ...

On Fri, May 18, 2012 at 04:21:48PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 23, 2012 at 10:57:23AM +0200, Uwe Kleine-K=F6nig wrote:
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mtd/atmel-nand.txt |    2 +-
> >  Documentation/devicetree/bindings/mtd/partition.txt  |    2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > =

> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/atmel-nand.txt
> > index a200695..0c1bccd 100644
> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > @@ -3,7 +3,7 @@ Atmel NAND flash
> >  Required properties:
> >  - compatible : "atmel,at91rm9200-nand".
> >  - reg : should specify localbus address and size used for the chip,
> > -	and if availlable the ECC.
> > +	and if available the ECC.
> >  - atmel,nand-addr-offset : offset for the address latch.
> >  - atmel,nand-cmd-offset : offset for the command latch.
> >  - #address-cells, #size-cells : Must be present if the device has sub-=
nodes
> > diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Docu=
mentation/devicetree/bindings/mtd/partition.txt
> > index f114ce1..6e1f61f 100644
> > --- a/Documentation/devicetree/bindings/mtd/partition.txt
> > +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> > @@ -35,4 +35,4 @@ flash@0 {
> >  	uimage@100000 {
> >  		reg =3D <0x0100000 0x200000>;
> >  	};
> > -];
> > +};
> this patch didn't appear in next yet (looking at next-20120518). Do you
> have concerns? Or do you think someone else should take and/or ack the
> patch?
ping

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
