From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 6/8] arm64: renesas: document Eagle board bindings
Date: Thu, 21 Sep 2017 11:07:58 +0200
Message-ID: <20170921090754.GT15749@verge.net.au>
References: <20170915194442.464361390@cogentembedded.com>
 <20170920205233.jjncu7fzi6cmoggq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170920205233.jjncu7fzi6cmoggq@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 03:52:33PM -0500, Rob Herring wrote:
> On Fri, Sep 15, 2017 at 10:43:24PM +0300, Sergei Shtylyov wrote:
> > Document the Eagle device tree bindings, listing it as a supported board.
> > 
> > This allows to use checkpatch.pl to validate .dts files referring to the
> > Eagle board.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > 
> > ---
> > Changes in version 2:
> > - renamed the patch.
> > 
> >  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> > ===================================================================
> > --- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
> > +++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> > @@ -59,6 +59,8 @@ Boards:
> >      compatible = "renesas,bockw", "renesas,r8a7778"
> >    - Draak (RTP0RC77995SEB0010S)
> >      compatible = "renesas,draak", "renesas,r8a77995"
> > +  - Eagle (RTP0RC77970SEB0010S)
> > +    compatible = "renesas,eagle", "renesas,r8a77970";
> 
> You're not consistent here with the ';'.
> 
> Otherwise,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Thanks, applied with Rob and Geert's tags and without the ';'.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
