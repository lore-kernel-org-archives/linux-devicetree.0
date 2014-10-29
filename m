From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Wed, 29 Oct 2014 17:16:36 -0500
Message-ID: <1414620996.23458.141.camel@snotra.buserror.net>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
	 <EA33D307-CCDA-4A30-9386-46FA832FE0CA@codeaurora.org>
	 <1414519738.23458.84.camel__4795.38602890006$1414521743$gmane$org@snotra.buserror.net>
	 <54515ECB.70404@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <54515ECB.70404@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: Kumar Gala <galak@codeaurora.org>, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Geoff.Thorpe@Freescale.com, corbet@lwn.net, linux-doc@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-10-29 at 16:40 -0500, Emil Medve wrote:
> Hello Scott,
>=20
>=20
> On 10/28/2014 01:08 PM, Scott Wood wrote:
> > On Tue, 2014-10-28 at 09:36 -0500, Kumar Gala wrote:
> >> On Oct 22, 2014, at 9:09 AM, Emil Medve <Emilian.Medve@freescale.c=
om> wrote:
> >>
> >>> The Buffer Manager is part of the Data-Path Acceleration Architec=
ture (DPAA).
> >>> BMan supports hardware allocation and deallocation of buffers bel=
onging to
> >>> pools originally created by software with configurable depletion =
thresholds.
> >>> This binding covers the CCSR space programming model
> >>>
> >>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> >>> Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
> >>> ---
> >>> .../devicetree/bindings/powerpc/fsl/bman.txt       | 98 +++++++++=
+++++++++++++
> >>> 1 file changed, 98 insertions(+)
> >>> create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/=
bman.txt
> >>
> >> Should these really be in bindings/powerpc/fsl, aren=E2=80=99t you=
 guys using this on ARM SoCs as well?
> >=20
> > The hardware on the ARM SoCs is different enough that I'm not sure =
the
> > same binding will cover it.  That said, putting things under <arch>
> > should be a last resort if nowhere else fits.
>=20
> OTC started ported the driver to the the ARM SoC and the feedback has
> been that the driver needed minimal changes. The IOMMU has been the o=
nly
> area of concern, and a small change to the binding has been suggested

Do we need something in the binding to indicate device endianness?

If this binding is going to continue to be relevant to future DPAA
generations, I think we really ought to deal with the possibility that
there is more than one datapath instance, by having phandles and/or a
parent container to connect the related components.

-Scott


