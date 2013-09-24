From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: Add Chunghwa Picture Tubes Ltd. vendor prefix
Date: Tue, 24 Sep 2013 20:47:55 +0200
Message-ID: <20130924184754.GC9911@mithrandir>
References: <1380012714-19073-1-git-send-email-treding@nvidia.com>
 <1380012714-19073-2-git-send-email-treding@nvidia.com>
 <5241CC20.1010800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5241CC20.1010800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2013 at 11:30:08AM -0600, Stephen Warren wrote:
> On 09/24/2013 02:51 AM, Thierry Reding wrote:
> > Chunghwa Picture Tubes Ltd. isn't listed on the stock exchange and just
> > Chunghwa is too generic, so use the official abbreviation "CPTT" as the
> > vendor prefix.
>=20
> cptt is not very mnemonic. If plain "chungwa" is too generic (could you
> expand upon that?), would "chungwapt" be better?

Well, there are Chunghwa Post and Chunghwa Telecom. I guess none of
these make devices that would ever need to be represented in a device
tree, but you never know.

I'm having some trouble understanding the criteria on how to choose a
good vendor prefix. As I mentioned in another subthread I remember some
discussion that concluded that the stock symbol should be used if one
existed. That's not the case for Chunghwa so I looked for some sort of
specific abbreviation. cptt is what Chunghwa Picture Tubes uses for
their website (http://www.cptt.com.tw) and seemed like a good fit. If
something mnemonic is preferred, perhaps we should just go with plain
"chunghwa". If it turns out that the newspaper or telecom company ever
do ship a product that needs a device tree representation we can always
come up with a variant then.

Thierry

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQd5aAAoJEN0jrNd/PrOhaHYP/0wioN7+qz+nVr+Lme/xmk4T
nQucBk6TZvUs2ya9vGqH+6nowhRmWN3mm/bedlbaHpF6ZtU2/EoZ9ewt3ujWuztW
t7blRp1BDDWxF/iIjGd0dWRvtM/AI8WkmFCL9pc6Mds6W14oyWLal5GQgPANsEBD
q/TcWNOGwrtHCdUvPGLPuAWbNvCH3kWXSG0n9FjbtlAZCGtg3KREutL/Bk/YpNCr
nSHcxKFLFO73T9LSErsry8G3SucDOuvb2vgJ4h1ciUAinIeSN+wyT/5LpWAT+gPO
i/8SYZRTbaQgUuqrzdaxKaNTIMtQPw/yHbHwS436JPO+1hOf3G2bwUOU+T8KL8NX
/YFIQVfPJn5BYu6aPUWMlxEaV4I2wIHQym2QuxpAhQuXdR15E184PkrhfoybVL/f
OiyX8UL6s6Bb4xUEtaxA2seUwq+hSdp1IaPmzMooyhjKsp5nwtR3ESENnQg5LEHP
yMnQeuIpIND6q973VraaldS/PzUpWIcvoRMr01c6iEWS9UMgDTGfnWHfoebd5ZQN
Ux+iqAsAmET4s3gK9tJPnRqzgcfYmDimWlh1Bh9JLzG49RQxQErFQnwF0SBGQC6T
T8FTlF6/6V6+FjQ+vpVJIEz4HRXWi8zVQnlGBQhuTWnB/L8JpYaXrA49lDubVhxE
9SGeLElGmfRuBZRWHw8C
=QvfT
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
