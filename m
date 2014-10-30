From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 1/4] dt/bindings: Introduce the FSL QorIQ DPAA BMan
Date: Thu, 30 Oct 2014 09:51:23 -0500
Message-ID: <1414680683.23458.148.camel@snotra.buserror.net>
References: <1413986972-621-1-git-send-email-Emilian.Medve@Freescale.com>
	 <EA33D307-CCDA-4A30-9386-46FA832FE0CA@codeaurora.org>
	 <1414519738.23458.84.camel__4795.38602890006$1414521743$gmane$org@snotra.buserror.net>
	 <54515ECB.70404@Freescale.com>
	 <1414620996.23458.141.camel__29590.7804662876$1414621051$gmane$org@snotra.buserror.net>
	 <5451BF49.6050106@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5451BF49.6050106@Freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Emil Medve <Emilian.Medve@Freescale.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Geoff.Thorpe@Freescale.com, corbet@lwn.net, linux-doc@vger.kernel.org, linuxppc-dev@ozlabs.org, robh+dt@kernel.org, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-10-29 at 23:32 -0500, Emil Medve wrote:
> Hello Scott,
>=20
>=20
> On 10/29/2014 05:16 PM, Scott Wood wrote:
> > On Wed, 2014-10-29 at 16:40 -0500, Emil Medve wrote:
> >> Hello Scott,
> >>
> >>
> >> On 10/28/2014 01:08 PM, Scott Wood wrote:
> >>> On Tue, 2014-10-28 at 09:36 -0500, Kumar Gala wrote:
> >>>> On Oct 22, 2014, at 9:09 AM, Emil Medve <Emilian.Medve@freescale=
=2Ecom> wrote:
> >>>>
> >>>>> The Buffer Manager is part of the Data-Path Acceleration Archit=
ecture (DPAA).
> >>>>> BMan supports hardware allocation and deallocation of buffers b=
elonging to
> >>>>> pools originally created by software with configurable depletio=
n thresholds.
> >>>>> This binding covers the CCSR space programming model
> >>>>>
> >>>>> Signed-off-by: Emil Medve <Emilian.Medve@Freescale.com>
> >>>>> Change-Id: I3ec479bfb3c91951e96902f091f5d7d2adbef3b2
> >>>>> ---
> >>>>> .../devicetree/bindings/powerpc/fsl/bman.txt       | 98 +++++++=
+++++++++++++++
> >>>>> 1 file changed, 98 insertions(+)
> >>>>> create mode 100644 Documentation/devicetree/bindings/powerpc/fs=
l/bman.txt
> >>>>
> >>>> Should these really be in bindings/powerpc/fsl, aren=E2=80=99t y=
ou guys using this on ARM SoCs as well?
> >>>
> >>> The hardware on the ARM SoCs is different enough that I'm not sur=
e the
> >>> same binding will cover it.  That said, putting things under <arc=
h>
> >>> should be a last resort if nowhere else fits.
> >>
> >> OTC started ported the driver to the the ARM SoC and the feedback =
has
> >> been that the driver needed minimal changes. The IOMMU has been th=
e only
> >> area of concern, and a small change to the binding has been sugges=
ted
> >=20
> > Do we need something in the binding to indicate device endianness?
>=20
> As I said, I didn't have enough exposure to the ARM SoC so I can't
> answer that
>=20
> > If this binding is going to continue to be relevant to future DPAA
> > generations, I think we really ought to deal with the possibility t=
hat
> > there is more than one datapath instance
>=20
> I'm unsure how relevant this will be going forward. In LS2 B/QMan is
> abstracted/hidden away behind the MC (firmware).

This is why I was wondering whether the binding would be at all the
same...

>  I wouldn't over-engineer this without a clear picture of what multip=
le
> data-paths per SoC even means at this point

I don't think it's over-engineering.  Assuming only one instance of
something is generally sloppy engineering.  Linux doesn't need to
actually pay attention to it until and unless it becomes necessary, but
it's good to have the information in the device tree up front.

> > by having phandles and/or a parent container to connect the related
> > components.
>=20
> Connecting the related components is beyond the scope of this binding=
=2E
> It will soon hit the e-mail list(s) as part of upstreaming the Ethern=
et
> driver

So you want us to merge this binding without being told how this works?
Or by "soon" do you mean before this binding is accepted?

-Scott


