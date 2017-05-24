From: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt/bindings: display: fix display-timing reference
Date: Wed, 24 May 2017 15:37:36 +0300
Message-ID: <20170524123735.fm2nyr6rpyfsomdq@sapphire.tkos.co.il>
References: <eabeec88c2831eb8541b78a4977ee7342b810b39.1494922745.git.baruch@tkos.co.il>
 <20170523144756.6gfagkwfy7ocogqe@rob-hp-laptop>
 <20170524122322.ebopabnddozamqit@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170524122322.ebopabnddozamqit-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Wed, May 24, 2017 at 02:23:22PM +0200, Daniel Vetter wrote:
> On Tue, May 23, 2017 at 09:47:56AM -0500, Rob Herring wrote:
> > On Tue, May 16, 2017 at 11:19:04AM +0300, Baruch Siach wrote:
> > > Fixes: 14da3ed8dd08 ("devicetree/bindings: display: Document common panel properties")
> > > Cc: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> > > Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Signed-off-by: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/display/panel/panel-common.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> We now have a pile of acks on these patches, but no one to push them.
> Seems like it's for the panel tree, but Thierry isn't on cc afaics.
> 
> Someone needs to take care of this (and no it's no going to be me).

Thanks for looking into this.

Just for the record, Thierry has been on To/Cc of all messages in this thread, 
accept yours.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org - tel: +972.2.679.5364, http://www.tkos.co.il -
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
