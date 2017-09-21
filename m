From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: iwg22d: Enable SDHI0 controller
Date: Thu, 21 Sep 2017 11:03:32 +0200
Message-ID: <20170921090332.GS15749@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-5-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdVFPiXe9trwprNfX=p8-OKbrcgVSrwmveYhXGm=kd2bfQ@mail.gmail.com>
 <20170921083839.GH15749@verge.net.au>
 <20170921084219.GK15749@verge.net.au>
 <TY1PR06MB089549AB7DCF1C03605EF421C0660@TY1PR06MB0895.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <TY1PR06MB089549AB7DCF1C03605EF421C0660-/PRLmSCtZ16EeHdvShrxA20DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 08:53:00AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > -----Original Message-----
> > From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> > Sent: 21 September 2017 09:42
> > To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> > Cc: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>;
> > Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Fabrizio Castro
> > <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; linux-arm-
> > kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > Subject: Re: [PATCH 4/8] ARM: dts: iwg22d: Enable SDHI0 controller
> >
> > On Thu, Sep 21, 2017 at 10:38:40AM +0200, Simon Horman wrote:
> > > On Wed, Sep 20, 2017 at 01:40:20PM +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Sep 13, 2017 at 7:05 PM, Chris Paterson
> > > > <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> > > > > From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > > >
> > > > > Enable the SDHI0 controller on iWave RZ/G1E carrier board.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > > > Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > >
> > > Thanks, applied.
> >
> > Sorry, I somehow overlooked Fabrizio's comments.
> > I have dropped this patch for now.
> 
> Thank you for doing this.
> We are working on a new patch now, I'll submit a V2 as soon as it is ready.
> Just to recap (all in one place), we found an HW issue and a SW one preventing SDHI0 from working properly at UHS SDR50 and SDR104, therefore we need a new patch to limit the speed of this interface.

Thanks for catching this, UHS can be quite troublesome in my experience.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
