From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Date: Fri, 22 Aug 2014 10:48:25 -0600
Message-ID: <20140822164825.GA1733@obsidianresearch.com>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com>
 <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
 <53F5D8D9.7040604@suse.de>
 <f166a186-301c-4288-97cf-71f8173c07e7@BN1AFFO11FD010.protection.gbl>
 <20140822162048.GB8477@obsidianresearch.com>
 <d31d72f2-acac-4aa3-b992-fc244ac6db4e@BY2FFO11FD005.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d31d72f2-acac-4aa3-b992-fc244ac6db4e-neA4ZlFjCT0Oyg+UkvAylWYJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 22, 2014 at 09:31:20AM -0700, S=F6ren Brinkmann wrote:

> > >  - the marvell compatible strings are used in our vendor tree. Th=
ey
> > >    aren't used anywhere but in our vendor tree. I though keeping =
them is
> > >    nice since it identifies the PHY fully. And in case that level=
 of
> > >    detail is needed at some point it is already there.
> >=20
> > DT is complex enough already, don't include useless compatible stri=
ngs
> > in mainline - people will see and tend to blindly copy. Ideally you=
r
> > vendor tree would use the standard property :|
>=20
> There are different opinions on this. I also heard to just add such
> strings, so in case this level of differentiation becomes necessary a=
t
> some later point, it is already existing.

In some cases, yes, and they should be docuemented in the binding, of
course.

But there is already a standard compatible string format to uniquely
identify a phy, so in this case another string is not justified, and
just creates confusion about what is correct.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
