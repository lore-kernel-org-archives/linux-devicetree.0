From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 2/2] powerpc: Update of_remove_property() call sites to
 remove null checking
Date: Thu, 05 May 2016 16:50:31 +1000
Message-ID: <1462431031.12473.3.camel@ellerman.id.au>
References: <1461821695-19204-1-git-send-email-sjitindarsingh@gmail.com>
	 <1461821695-19204-2-git-send-email-sjitindarsingh@gmail.com>
	 <57292702.5070507@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57292702.5070507-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Suraj Jitindar Singh <sjitindarsingh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2016-05-03 at 15:32 -0700, Tyrel Datwyler wrote:
> On 04/27/2016 10:34 PM, Suraj Jitindar Singh wrote:
> > diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> > index ceb18d3..a560a98 100644
> > --- a/arch/powerpc/platforms/pseries/mobility.c
> > +++ b/arch/powerpc/platforms/pseries/mobility.c
> > @@ -191,8 +191,8 @@ static int update_dt_node(__be32 phandle, s32 scope)
> >  				break;
> >  
> >  			case 0x80000000:
> > -				prop = of_find_property(dn, prop_name, NULL);
> > -				of_remove_property(dn, prop);
> > +				of_remove_property(dn, of_find_property(dn,
> > +							prop_name, NULL));
> >  				prop = NULL;
> >  				break;
> > 
> 
> You haven't removed a NULL check here, as suggested by the changelog,
> but instead made a cosmetic change to the code that still leaves behind
> a now unnecessary "prop = NULL;" to bit rot.

Yeah I think you're right. Though it's not very clear how prop is used in that
function.

Please one of you send me an incremental to remove the prop = NULL;

cheers

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
