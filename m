From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: Start using standard gpios property and
 deprecate some custom properties
Date: Mon, 16 Dec 2013 21:40:57 +0000
Message-ID: <20131216214057.GG3185@sirena.org.uk>
References: <1386965234-26461-1-git-send-email-tony@atomide.com>
 <20131216183615.GK3185@sirena.org.uk>
 <20131216194023.GE26293@atomide.com>
 <20131216201102.GP3185@sirena.org.uk>
 <20131216210512.GF26293@atomide.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+GiWpZ/vZzfY9+ZQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131216210512.GF26293-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--+GiWpZ/vZzfY9+ZQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2013 at 01:05:13PM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> [131216 12:12]:

> > This is the first time anyone's mentioned this so it probably isn't that
> > serious an issue and bear in mind that the patch was also handling all
> > the named GPIO specifiers too.

> I've certainly debugged this same exact issue twice already and that
> probably means that same issue has been debugged tens or hundreds
> of times by other people.

That surprises me to be honest, but then the fact that the convention
was even defined surprises me.  Like I say you're the first person to
mention it; I suspect you might write more DTs than most.

> Personally I don't see any value for a regulator describing the names of
> the GPIOs in the binding, it's really up to the driver to make sense of
> them. Especially if there are one or more similar GPIOs. We're not

Devices like PMICs frequently have a *lot* of possible pin functions
some of which can get mapped onto GPIOs (in either direction), many of
which are going to be fixed by system design and generally all muxed
onto a much smaller set of physical pins.  If you try to specify those
through an unnamed gpios property you end up with a very large array
(say 30 elements, more wouldn't be too surprising) most of which will be
empty.  That is not at all usable, it's error prone to write and very
hard to read even with the preprocessor support that only got added
quite recently.

> naming interrupts either.

There's typically a much more limited set of interrupts a device can
have (and many of the more optional ones end up getting expressed via
the GPIO binding since you also need to read the state to use them) so
they don't run into the issue so much.

> > In any case, the thing is that there's a difference between parsing both
> > and deprecation - deprecation implies an intention to remove the old one
> > which would just reintroduce the problem the other way around since
> > people are likely to drop or forget the plural, use old DTs and so on.
> > Adding a gpios property in parallel with plain gpio is fine and what I
> > was mostly suggesting.

> Deprecation _may_ imply that it will get removed, but not always.
> Naturally we're going to have to keep the old bindings in place since
> they were merged. I can changed that to obsoleted if that's any better.

Yes, that's better.

> > Exactly, I think it's way more trouble than it's worth to try to change
> > for named single element lists.  The standard property makes more sense.

> I don't think there should be any named GPIOs. If we want names, then
> the GPIO usage should be possible to group quite easily rather than create
> a new property for everything. Something like "enable-gpio" comes to mind.

I don't understand the difference between your suggestion and named
GPIOs.

--+GiWpZ/vZzfY9+ZQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSr3NlAAoJELSic+t+oim9iDYP/i+jDxlPFZvahRT3hl1G5ZRR
zneNmRGVvQ+GVHW2ZclI5s0eLPSNv0lKKl97n4QHRsIzvAGcSspBCg/WYda1gdp6
Eaje6FL9McpglsU0lkOY/3SpGzPJPsdMWilqPn7E+dywv7HwClus8ugPSS9i7Hpz
itpodSiHNUSrWYWSneTvZZOBWBXRoLrX2EkIS137plmz4EmZ7vKXI3uwigzPi3QO
OohJW4573SE1RvKHQ1oSyKGR7fpVOJFnFLwAYxvD8yxkMbHyQx4zlH1gWA4nShkl
L7I35AtJiVErlmvCBzpXFqWBLoduKh0xna8e473tg+3E9jqBuaqCsR/xVTnhblnC
m/xbzlHQdDIDHyqtY5+go5dvlMyHKk2bQsKJLnLolo6NJ795Lc7j7uU0vCzW+Fa6
bv44Z5NHPc4371fyoCodLRJAkaYrIMYhH29YLfjmgsyBo9v0kIeC9YseRgR56Ach
/X/8IT5lM1Yz6FlPCGTldXJLQZh3wSXAU9/PwMs41Lq9L1yWnP/qkLVATXMLVmfA
ibmLpMijrd2AmW9PLpwR0NMpmNnM3NStljUAd5s7/dpPbx5yLzkiS9+nP3i23PI9
dnF9K06KV2kGTZFE+Dk+4mNveE191u1iyPMpCfy6KBFUcpV/1S56VejPayBXyJQZ
aB9SjJuUPjVCX/tdHl98
=Xy8L
-----END PGP SIGNATURE-----

--+GiWpZ/vZzfY9+ZQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
