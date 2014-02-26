From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 26 Feb 2014 09:00:32 +0000
Message-ID: <1393405232.16570.106.camel@kazak.uk.xensource.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	 <5306A6C0.9000206@gmail.com> <20140221141136.GI17250@pengutronix.de>
	 <1393257557.16570.94.camel@kazak.uk.xensource.com>
	 <20140225072609.GW17250@pengutronix.de>
	 <1393313764.9640.15.camel@dagon.hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393313764.9640.15.camel-ztPmHsLffjjnO4AKDKe2m+kiAK3p4hvP@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2014-02-25 at 07:36 +0000, Ian Campbell wrote:
> On Tue, 2014-02-25 at 08:26 +0100, Sascha Hauer wrote:
> > On Mon, Feb 24, 2014 at 03:59:17PM +0000, Ian Campbell wrote:
> > > On Fri, 2014-02-21 at 15:11 +0100, Sascha Hauer wrote:
> > > > Ians dts repository is a good start, but it contains a complete kernel
> > > > history and this is not very suitable as a submodule for other
> > > > projects. 
> > > 
> > > It only contains the full history for the files which it contains, not a
> > > complete kernel history. This is deliberate so that "git annotate" etc
> > > still works to tell you where a particular line came from.
> > 
> > I have cloned git://xenbits.xen.org/people/ianc/device-tree-rebasing.git.
> > .git is 843MB in size and after a 'git checkout v3.13' I see a vanilla v3.13
> > checked out. I may have done something wrong, but I don't see what it
> > could be.
> 
> There is a branch with the full Linux stuff in there too. It is needed
> in the tree doing the conversion but doesn't really need to be
> published. I pushed it in the early days without really thinking about
> the size impact. I'll remove that stuff from the published tree.

Done. The tree now has only a master branch and the vX.Y-dts tags (it is
still pushing the historical ones, they'll be there soon).

.git of a fresh clone is now 22M, which is more like it ;-)

I've moved the tree with all the conversion state aside into
device-tree-conversion.git. Most people won't need what is in there.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
