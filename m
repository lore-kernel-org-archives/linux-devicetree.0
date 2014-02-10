From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: Devicetree Maintenance in barebox
Date: Mon, 10 Feb 2014 11:38:32 +0000
Message-ID: <1392032312.5117.49.camel@kazak.uk.xensource.com>
References: <20140207071332.GE16215@pengutronix.de>
	 <20140207141028.GT8533@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140207141028.GT8533-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-02-07 at 09:10 -0500, Jason Cooper wrote:
> Hi Sascha,
> 
> + Grant Likely, Ian Campbell, devicetree ML
> 
> This discussion started on the barebox bootloader mailinglist
> 
> On Fri, Feb 07, 2014 at 08:13:32AM +0100, Sascha Hauer wrote:
> > It's becoming more obvious that devicetree maintenance is painful
> > because we have to sync them to the kernel regularly. My hope was that
> > this would get simpler once the devicetrees get their own repository
> > outside the kernel, but it seems that won't happen anytime soon.
> 
> hmm.  Ian Campbell has a tree he is working on:
> 
>   git://xenbits.xen.org/people/ianc/device-tree-rebasing.git

This is automatically extracted out of the linux git tree (using
git-filter-branch), maintaining all the history etc. I intend to keep
this running until such a time as the DTS files are migrated out of
Linux.

For the time being though patches to this tree need to go through the
Linux tree in the normal way.

(also, as the name states it is potentially rebasing, although there
hasn't been an actual need since the early days when I was still getting
things working)

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
