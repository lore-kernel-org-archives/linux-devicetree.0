From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Wed, 4 Dec 2013 20:27:28 +0000
Message-ID: <20131204202728.GF29268@sirena.org.uk>
References: <20131127172806.GC2291@e103592.cambridge.arm.com>
 <20131128203322.GB14689@mithrandir>
 <20131128211009.GA26447@obsidianresearch.com>
 <20131128222232.GF14689@mithrandir>
 <20131128233147.GA19387@obsidianresearch.com>
 <20131129023554.GA14239@kroah.com>
 <20131204184345.GA29268@sirena.org.uk>
 <20131204190312.GA5070@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RHnfto7yGd+QdmRl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131204190312.GA5070-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--RHnfto7yGd+QdmRl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2013 at 11:03:12AM -0800, Greg KH wrote:
> On Wed, Dec 04, 2013 at 06:43:45PM +0000, Mark Brown wrote:

> > If you look at the hardware design decisions this stuff tends to be
> > totally sensible; there's a bunch of factors at play (complexity, area
> > and isolation tend to be other ones).  There's a lot of the stuff that
> > we're complaining about where they can reasonably question why this is
> > so complex for us.  That doesn't mean that everything that it's possible
> > to do is sensible but there's definitely limitations on the kernel side
> > here.

> The main reason it's so "complex" is the drive for people to have a "one
> kernel image for multiple systems" and hence the need to have DT handle
> all of this.  I don't think that requirement has been pushed back on the
> hardware engineers yet, and they are still thinking that a custom image
> per chip is ok.

No, the single system image stuff is orthogonal here and is basically
irrelevant for many use cases - it's essential for servers and so on but
most consumer electronics guys pretty much don't care and this stuff is
as much a problem for them as anyone else.  We've always struggled with
these things even when building for specific hardware, DT is just
another way to write the data structure here.  When people are talking
about figuring out the DT first here what they're taking about is as
much working out what we need to abstract first as anything else.

This isn't a million miles away from the stuff we've dealt with using
probe deferral in terms of fitting into the device model, at least at a
high level, though it is harder to sidestep the issues here.

> > These firmwares have tended to be ROMed or otherwise require expensive
> > validation to change for sometimes sensible reasons, keeping the amount
> > of code that's painful to change low will tend to make people happier if
> > a change is needed.  Most people like the risk mitigation.

> I love it how it's so easy to make the kernel be the part of the whole
> system stack that is simpler to change than any other :)

Dammn open source license :)

> I'm all for making Linux be the "firmware" and deal with these very
> low-level issues directly, but again, this drives in the face of your
> self-stated goal of "one image per architecture" for the kernel.  You
> kind of can't have it both ways it seems, so someone needs to make up
> their mind as to what it's going to be...

I think you're confusing me with someone else...  in any case, I don't
see why there should be any conflict here.

--RHnfto7yGd+QdmRl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSn5AtAAoJELSic+t+oim9zrcP+QHYHPFkgNSbsv/RAv9y4I08
nDDxNxDGsjHX5ix0wjkVAHwzQ3M1lJUdbC32NOg7Pi89fJUplBS6s2lYd1LIcpS7
xhjto7CBylNuExsXlM/N6H9YBR+4TtGAyg8GUPm+Lsa58DxoeBQ/nR9us9Ym/YX7
SQvleePbt5i7X6VsRaChuyqWbTzUdnv/2qumnKwu4zggtZNf5rqPBfIflBAv7VPT
3TQo5NBsftZBRvJs+3gAoQMxe6cQWCahGDiMzZTvCfrZi3ulaFvtMbnAseqmbHI9
dZxky5J9CEuiGbvDvR9Whc4u4Y27mDr/mKepl27d1SWk8wba9e7ziFBivEM/q/Xy
YlQlv5WiVulHGlQbo+1kslk2RpbngNT7BRshraWe+ps/SyybS+4xqk1eJSL5BURh
kfOfI6Xcwkr9S6Ibyb9iTAJy6O65mlJMG0091DwNGVMPe3p/6LCjcga4cIvUFM3n
C2ZTTAm+Z2Ann3zdgoTQYfU/hq+ysTTP0Na7LDY1d8am3JfwzuEdMlBRcQp4oRH8
zQqkqgBUD2H6z3PpewLA69ly8QHiCzy7cQhROnkn1PYJER3+roPdDf+dwCwv6CJb
UtRlG2krwWtaUEFjFkvg8dpbX0vxsmnBJ1lxBKMhlzchZ8mAl7NmpCJc5tUdKqZW
UQbas73mp3ZKxRqr+8kz
=pBKg
-----END PGP SIGNATURE-----

--RHnfto7yGd+QdmRl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
