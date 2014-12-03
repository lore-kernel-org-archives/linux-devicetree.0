From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 02/11] mfd: syscon: Add Atmel Matrix bus DT binding
 documentation
Date: Wed, 3 Dec 2014 15:52:35 +0100
Message-ID: <20141203155235.5c5b4a2d@bbrezillon>
References: <1417429647-3419-1-git-send-email-boris.brezillon@free-electrons.com>
	<1417429647-3419-3-git-send-email-boris.brezillon@free-electrons.com>
	<547F1F11.5090803@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <547F1F11.5090803-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jean-Jacques Hiblot <jjhiblot-dLKeG7h1OhBDOHtkgc7UlQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

On Wed, 3 Dec 2014 15:32:49 +0100
Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:

> Le 01/12/2014 11:27, Boris Brezillon a =C3=A9crit :
> > The Matrix registers are provided to configure internal bus behavio=
r on
> > at91 SoCs.
> > Some registers might be access by several drivers (e.g. to configur=
e
> > external memory bus timings), hence we declare this register set as=
 a
> > syscon device.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/mfd/atmel-matrix.txt       | 24 ++++++++++=
++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/atmel-mat=
rix.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt=
 b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> > new file mode 100644
> > index 0000000..e56e27a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> > @@ -0,0 +1,24 @@
> > +* Device tree bindings for Atmel Bus Matrix
> > +
> > +The Bus Matrix registers are used to configure Atmel SoCs internal=
 bus
> > +behavior (master/slave priorities, undefined burst length type, ..=
=2E)
> > +
> > +Required properties:
> > +- compatible:		Should be one of the following
> > +			"atmel,at91sam9260-matrix", "syscon"
> > +			"atmel,at91sam9261-matrix", "syscon"
> > +			"atmel,at91sam9263-matrix", "syscon"
> > +			"atmel,at91sam9263-matrix", "syscon"
>=20
> Same string as the preceding one: shouldn't it be at91sam9rl?

Indeed, and macro definitions for the 9rl are also missing in the
atmel-matrix.h header.

Thanks,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
