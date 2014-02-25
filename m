From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Tue, 25 Feb 2014 08:26:10 +0100
Message-ID: <20140225072609.GW17250@pengutronix.de>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <5306A6C0.9000206@gmail.com>
 <20140221141136.GI17250@pengutronix.de>
 <1393257557.16570.94.camel@kazak.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393257557.16570.94.camel-ommiHX4a84BXesXXhkcM7miJhflN2719@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 24, 2014 at 03:59:17PM +0000, Ian Campbell wrote:
> On Fri, 2014-02-21 at 15:11 +0100, Sascha Hauer wrote:
> > Ians dts repository is a good start, but it contains a complete kernel
> > history and this is not very suitable as a submodule for other
> > projects. 
> 
> It only contains the full history for the files which it contains, not a
> complete kernel history. This is deliberate so that "git annotate" etc
> still works to tell you where a particular line came from.

I have cloned git://xenbits.xen.org/people/ianc/device-tree-rebasing.git.
.git is 843MB in size and after a 'git checkout v3.13' I see a vanilla v3.13
checked out. I may have done something wrong, but I don't see what it
could be.

> 
> The are a lot of merge NULL-commits which aren't strictly needed (they
> have no content and only a single parent) but I didn't manage to get git
> rewrite-branch to omit them. They are mostly harmless I think.
> 
> I'm not sure how any of that makes it unsuitable for use as a submodule
> though, the history contained in a git tree seems pretty orthogonal to
> that to me.

My concerns are only about the size of the repository. Of cause if
you're willing to wait long enough that problem is orthogonal. But
anyway, what I cloned from your repository is likely not what it should
look like.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
