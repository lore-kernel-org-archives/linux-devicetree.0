From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/13] dt-bindings: Add vendor prefix for Microsemi
 Corporation
Date: Tue, 28 Nov 2017 17:22:45 +0100
Message-ID: <20171128162245.GH21126@piout.net>
References: <20171128152643.20463-1-alexandre.belloni@free-electrons.com>
 <20171128152643.20463-2-alexandre.belloni@free-electrons.com>
 <20171128161014.GG27409@jhogan-linux.mipstec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171128161014.GG27409-4bYivNCBEGSP4qXr0kR+DFHK5/nzsB32@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/11/2017 at 16:10:14 +0000, James Hogan wrote:
> On Tue, Nov 28, 2017 at 04:26:31PM +0100, Alexandre Belloni wrote:
> > Microsemi Corporation provides semiconductor and system solutions for
> > aerospace & defense, communications, data center and industrial markets.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
> Nit: Usually the Cc list goes before the --- line so that it is included
> in the git history (i.e. these people had the opportunity to comment).
> 

Ok, it depends on the maintainer, some people prefer leaving that out of commit log.
I'm fine with adding those back in.

> Cheers
> James
> 
> > 
> > 
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 0994bdd82cd3..7b880084fd37 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -219,6 +219,7 @@ motorola	Motorola, Inc.
> >  moxa	Moxa Inc.
> >  mpl	MPL AG
> >  mqmaker	mqmaker Inc.
> > +mscc	Microsemi Corporation
> >  msi	Micro-Star International Co. Ltd.
> >  mti	Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
> >  multi-inno	Multi-Inno Technology Co.,Ltd
> > -- 
> > 2.15.0
> > 
> > 



-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
