From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] powerpc/dts: Move pll0/1-div4 index
Date: Mon, 20 Apr 2015 14:36:45 -0500
Message-ID: <1429558605.4352.21.camel@freescale.com>
References: <1429186105-6991-1-git-send-email-igal.liberman@freescale.com>
	 <1429249343.32545.53.camel@freescale.com>
	 <DM2PR03MB38320A3D701B771E163B8F3E6E00@DM2PR03MB383.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DM2PR03MB38320A3D701B771E163B8F3E6E00-ufbTtyGzTTRJonC5hhDUuuO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liberman Igal-B31950 <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-04-20 at 06:10 -0500, Liberman Igal-B31950 wrote:
> 
> 
> Regards,
> Igal Liberman.
> 
> > -----Original Message-----
> > From: Wood Scott-B07421
> > Sent: Friday, April 17, 2015 8:42 AM
> > To: Liberman Igal-B31950
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Subject: Re: [PATCH] powerpc/dts: Move pll0/1-div4 index
> > 
> > On Thu, 2015-04-16 at 15:08 +0300, Igal.Liberman wrote:
> > > From: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > >
> > > This patch updates pll0/1-div4 index to '3'.
> > > Originally it was '2'.
> > >
> > > The following patch adds pll0/1-div3 option:
> > > 	https://patchwork.ozlabs.org/patch/461151/
> > > After this patch, index '2' becomes pll0/1-div3.
> > >
> > > This patch based on top of the following:
> > > 	https://patchwork.ozlabs.org/patch/461811/
> > >
> > > Signed-off-by: Igal Liberman <Igal.Liberman-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > 
> > This needs to be done in the same patch as the provider change, to avoid a
> > buggy intermediate state.
> > 
> > Will there be a new binding patch coming?
> > 
> 
> OK, I'll add those changes as on patch.
> 
> Regarding the binding,
> I already submitted https://patchwork.ozlabs.org/patch/461150/

Which is an incompatible change as I noted in a comment on a different
patch.

> Do you mean that I should add comment that the driver parses the node by reading the number of input clocks and not the compatible?

No, you should make the binding document reflect how things currently
work.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
