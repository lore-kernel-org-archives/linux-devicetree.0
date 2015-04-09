From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] dt/bindings: qoriq-clock: Add binding for FMan clock mux
Date: Thu, 9 Apr 2015 18:54:13 -0500
Message-ID: <1428623653.22867.562.camel@freescale.com>
References: <1428379720-3247-1-git-send-email-igal.liberman@freescale.com>
	 <1428446404.22867.479.camel@freescale.com>
	 <DM2PR03MB383BB3A8993435B4F7D2EFDE6FC0@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB383BB3A8993435B4F7D2EFDE6FC0-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-04-08 at 03:54 -0500, Liberman Igal-B31950 wrote:
> Hi Scott
> 
> Regards,
> Igal Liberman.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Wednesday, April 08, 2015 1:40 AM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [PATCH] dt/bindings: qoriq-clock: Add binding for FMan clock
> > mux
> > 
> > On Tue, 2015-04-07 at 07:08 +0300, Igal.Liberman wrote:
> > > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >
> > > Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/clock/qoriq-clock.txt      |   59
> > ++++++++++++++++++++
> > >  1 file changed, 59 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > index df4a259..a7e84ce 100644
> > > --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> > > @@ -65,6 +65,7 @@ Required properties:
> > >  		It takes parent's clock-frequency as its clock.
> > >  	* "fsl,qoriq-platform-pll-1.0" for the platform PLL clock (v1.0)
> > >  	* "fsl,qoriq-platform-pll-2.0" for the platform PLL clock (v2.0)
> > > +	* "fsl,fman-clk-mux" for the Frame Manager clock.
> > 
> > Is there any versioning required on this?
> > 
> 
> I don't think we need versioning here.

Even though we needed it on the other nodes?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
