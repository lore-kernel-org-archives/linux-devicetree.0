From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation regarding attaching OF Selftest testdata
Date: Wed, 24 Sep 2014 15:41:35 +0100
Message-ID: <20140924144135.78D69C40738@trevor.secretlab.ca>
References: <1409728589-9019-1-git-send-email-gaurav.minocha.os@gmail.com>
	<20140908132007.02837C40AE5@trevor.secretlab.ca>
	<5420C852.5010905@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5420C852.5010905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Sep 2014 18:09:38 -0700, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 9/8/2014 6:20 AM, Grant Likely wrote:
> > On Wed,  3 Sep 2014 00:16:29 -0700, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> This patch add a document that explains how the selftest test data
> >>  is dynamically attached into the live device tree irrespective
> >>  of the machine's architecture.
> >>
> >> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > Applied, thanks.
> > 
> > Watch out for trailing whitespace. I had to tidy up many lines.
> 
> Is it ok to use UTF-8 characters outside the ascii range in Documentation .txt
> files?  If not, there are a few below (I'll point out at least a few inline).
> 
> The characters are all various forms of a quote or apostrophe.
> 
> I do not know what the characters in this reply will look like in anyone else's email
> client.  In thunderbird, the non-ascii UTF-8 characters in the original patch displayed
> properly.  In thunderbird, the same text in Grant's reply, prefixed with '> ' to indicate
> an email reply the non-ascii UTF-8 is mangled.  In thunderbird, if I reply to Grant's
> reply, the same mangling occurs.

Yeah, those should be fixed up. There is no reason to use non-ascii
UTF-8 quote characters in those places.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
