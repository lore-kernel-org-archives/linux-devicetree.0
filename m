From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Tue, 28 Oct 2014 13:08:58 -0500
Message-ID: <1414519738.23458.84.camel@snotra.buserror.net>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
	 <EA33D307-CCDA-4A30-9386-46FA832FE0CA@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EA33D307-CCDA-4A30-9386-46FA832FE0CA-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Emil Medve <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, corbet-T1hC0tSOHrs@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-10-28 at 09:36 -0500, Kumar Gala wrote:
> On Oct 22, 2014, at 9:09 AM, Emil Medve <Emilian.Medve-KZfg59tc24xl57MIdRCFDg@public.gmane.org>=
 wrote:
>=20
> > The Buffer Manager is part of the Data-Path Acceleration Architectu=
re (DPAA).
> > BMan supports hardware allocation and deallocation of buffers belon=
ging to
> > pools originally created by software with configurable depletion th=
resholds.
> > This binding covers the CCSR space programming model
> >=20
> > Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> > Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
> > ---
> > .../devicetree/bindings/powerpc/fsl/bman.txt       | 98 +++++++++++=
+++++++++++
> > 1 file changed, 98 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/bm=
an.txt
>=20
> Should these really be in bindings/powerpc/fsl, aren=E2=80=99t you gu=
ys using this on ARM SoCs as well?

The hardware on the ARM SoCs is different enough that I'm not sure the
same binding will cover it.  That said, putting things under <arch>
should be a last resort if nowhere else fits.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
