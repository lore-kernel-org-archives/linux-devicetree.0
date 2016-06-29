From: Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [V4, 2/3] powerpc/opal: Add #define to get rc from an
 ASYNC_COMP opal_msg
Date: Wed, 29 Jun 2016 10:38:52 +1000
Message-ID: <20160629103852.17ffdd59@dyn253.ozlabs.ibm.com>
References: <1467088857-14477-2-git-send-email-sjitindarsingh@gmail.com>
	<3rf48446rPz9sD5@ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3rf48446rPz9sD5-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 28 Jun 2016 21:58:28 +1000 (AEST)
Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org> wrote:

> On Tue, 2016-28-06 at 04:40:56 UTC, Suraj Jitindar Singh wrote:
> > An opal_msg of type OPAL_MSG_ASYNC_COMP contains the return code in
> > the params[1] struct member. However this isn't intuitive or
> > obvious when reading the code and requires that a user look at the
> > skiboot documentation or opal-api.h to verify this.
> > 
> > Add a #define to get the return code from an opal_msg and update
> > call sites accordingly.  
> 
> Thanks for cleaning this up.
> 
> Two gripes though :)
> 
> >  arch/powerpc/include/asm/opal-api.h            | 4 ++++  
> 
> opal-api.h is supposed to be a subset of the skiboot version.
> 
> So something like this should go in the kernel's opal.h, which has
> all the kernel prototypes etc. which aren't part of the OPAL API. I
> think this routine should fall under that.
Will move this
> 
> > diff --git a/arch/powerpc/include/asm/opal-api.h
> > b/arch/powerpc/include/asm/opal-api.h index 9bb8ddf..7433cf0 100644
> > --- a/arch/powerpc/include/asm/opal-api.h
> > +++ b/arch/powerpc/include/asm/opal-api.h
> > @@ -387,6 +387,10 @@ struct opal_msg {
> >  	__be64 params[8];
> >  };
> >  
> > +#define GET_OPAL_MSG_ASYNC_COMP_RC(msg)	(msg.msg_type ==
> > OPAL_MSG_ASYNC_COMP ? \
> > +
> > be64_to_cpu(msg.params[1]) : \
> > +					OPAL_PARAMETER)
> > +  
> 
> You forgot the 7th commandment!
> 
>  "Never use a #define when a static inline would work"
> 
> :)
> 
> A few reasons:
>   - it's less shouty.
>   - you get type checking.
>   - you don't have to wrap lines with \
>     etc.
> 
> cheers
Thanks, will change this
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
