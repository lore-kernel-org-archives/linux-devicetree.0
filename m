From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Mon, 24 Feb 2014 15:59:17 +0000
Message-ID: <1393257557.16570.94.camel@kazak.uk.xensource.com>
References: <20140217180544.GU7862@titan.lakedaemon.net>
	 <5306A6C0.9000206@gmail.com> <20140221141136.GI17250@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140221141136.GI17250-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2014-02-21 at 15:11 +0100, Sascha Hauer wrote:
> Ians dts repository is a good start, but it contains a complete kernel
> history and this is not very suitable as a submodule for other
> projects. 

It only contains the full history for the files which it contains, not a
complete kernel history. This is deliberate so that "git annotate" etc
still works to tell you where a particular line came from.

The are a lot of merge NULL-commits which aren't strictly needed (they
have no content and only a single parent) but I didn't manage to get git
rewrite-branch to omit them. They are mostly harmless I think.

I'm not sure how any of that makes it unsuitable for use as a submodule
though, the history contained in a git tree seems pretty orthogonal to
that to me.

TBH, I'm not sure what the requirements for a submodule are -- IME when
something is used as a submodule it is up to the outer git tree to call
into the inner build system in the correct way, whatever that may be.

Ian.

--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
