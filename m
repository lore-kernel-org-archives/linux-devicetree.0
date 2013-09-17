From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 23:19:13 +0200
Message-ID: <2179723.s3DLWi0P8b@flatron>
References: <1379300274.4098.77.camel@pasglop> <5238C4D1.6060500@gmail.com> <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 17 of September 2013 14:15:52 Olof Johansson wrote:
> On Tue, Sep 17, 2013 at 2:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 
wrote:
> > On 9/17/2013 9:43 AM, Olof Johansson wrote:
> >> On Tue, Sep 17, 2013 at 09:56:39AM +0200, Tomasz Figa wrote:
> >>> I'm afraid that I must disagree. For consistency I'd rather go with
> >>> what Ben said. Please see ePAPR chapter 2.2.1.1, which clearly
> >>> defines how nodes should be named.
> >> 
> >> 2.2.1.1 is there to point out that unit address _has_ to reflect reg.
> >> 
> >> 2.2.3 says that unit addresses can be omitted.
> > 
> > 2.2.3 is talking about path names.
> > 
> > 2.2.1.1 is talking about node names.
> > 
> > 2.2.1.1 _does_ require the unit address in the node name, 2.2.3 does
> > not remove that requirement.
> 
> Sigh, that's horrible. OF clearly doesn't require it.
> 
> I guess people prefer to follow ePAPR even though it's broken? That
> means someone needs to cleanup the current dts files. Any takers?

I don't think it's broken, why do you think so? It's at least consistent. 
Probably not perfect and not complete, but IMHO a reasonable base for 
further work. (Also at least something written down that people can learn 
from and/or refer to.)

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
