From: Rocco Folino <rocco.folino-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] MIPS: ath79: support devicetree selection
Date: Wed, 6 Sep 2017 14:01:44 +0200
Message-ID: <20170906120144.GA20147@void>
References: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
 <20170906111435.GA1856@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170906111435.GA1856-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 06, 2017 at 01:14:35PM +0200, Ralf Baechle wrote:
> On Fri, Aug 18, 2017 at 05:32:42PM +0200, Rocco Folino wrote:
> 
> > Allow to choose devicetrees from Kconfig.
> > 
> > Signed-off-by: Rocco Folino <rocco.folino-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/mips/ath79/Kconfig         | 44 +++++++++++++++++++++++++++++++++++++++++
> >  arch/mips/boot/dts/qca/Makefile | 10 +++++-----
> >  2 files changed, 49 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/mips/ath79/Kconfig b/arch/mips/ath79/Kconfig
> > index dfc60209dc63..b43d116187af 100644
> > --- a/arch/mips/ath79/Kconfig
> > +++ b/arch/mips/ath79/Kconfig
> > @@ -1,5 +1,49 @@
> >  if ATH79
> >  
> > +menu "Atheros AR71XX/AR724X/AR913X devicetree selection"
> > +
> > +config DTB_ATH_DPT_MODULE
> > +	bool "DPTechnics DPT-Module"
> > +	select SOC_933X
> 
> There is no symbol SOC_933X.  Did you mean SOC_AR933X?

Yes, right

> 
> Anyway, your patch does more than the changelog ("Allow to choose
> devicetrees from Kconfig") says, so please either fix the changelog
> or split that into multiple patches with proper changelogs.

Ok, I'll fix everything in the v2

thanks for the comments.

Rocco
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
