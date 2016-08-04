From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: device tree verification tools
Date: Thu, 4 Aug 2016 07:18:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1608040718110.3293@hadrien>
References: <alpine.DEB.2.10.1607262241240.3426@hadrien> <87vazh8ln8.fsf@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vazh8ln8.fsf-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Thu, 4 Aug 2016, Stewart Smith wrote:

> Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org> writes:
> > I saw that there will be a microconference on device trees at Linux
> > Plumbers.  Unfortunately, I won't be able to attend, due to another event
> > at the same time, but I was wondering what is the status of verification
> > tools for device tree specifications?
>
> For a few checks that we want to do for OpenPower systems, we've been
> adding tests to the FirmWare Test Suite (FWTS)
> https://wiki.ubuntu.com/FirmwareTestSuite - which does actually catch a
> case where we messed it up and have something that's technically invalid
> (i.e. we could have used this a couple of years ago when the mistake was
> initially made).

Thanks for the information.  Is it easy to see in there what tests are
done?

thanks,
julia

>
> --
> Stewart Smith
> OPAL Architect, IBM.
>
>
