From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Mon, 26 May 2014 16:19:59 +0100
Message-ID: <20140526151958.GU22111@sirena.org.uk>
References: <201405252350.40402.sergei.shtylyov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dOnbUs275AO9J6bN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201405252350.40402.sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dOnbUs275AO9J6bN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2014 at 11:50:39PM +0400, Sergei Shtylyov wrote:
> Use more compact of_property_read_{bool|u32}() calls instead of the
> of_{find|get}_property() calls.

Applied, thanks.  Always CC mailing lists on patches.

--dOnbUs275AO9J6bN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg1ubAAoJELSic+t+oim9MC4P/Rx78PgihU0iORTbuLvM5MNN
BvpaCNWqwJlyZKPD96aaHewWS1T1S8LsJ5xuYlBjqELe6Ga6RYkEndGyrgkmP5Qc
DkaISf5K10uMKnNt6RvPc6PFOu5GQG2x7R9iJMq3yyZ7SXQnretqA6bYsimTovGx
ut6iJcRLjBubIQK5TBKlaIL+R5l2tMt13Rm7OgE87FBE4qEv68iQwbqEIPpsy/qw
/GTyRiaPvr8/I9PUPQlvfVL0cCvy6Am5bCxdx7/U3HigVYZo6GbpMmae763iNzAA
tP1QxroQ9g2eT3v+3TJz4ofkR7YTUbJmh+gYC3zWhjltvVU5Lc950wQhjQzsmpky
CheDkXQbRhAwKdE+AS1U0spEOiag483PTPBPRcqs5a2v3SfMGjIQl06a6BY1r3uf
hgU5CHLk+hQmZvGrh8n1+ijAiSYvrPEdiLwNNvoghEFO5Jp6D4D0oPdAHC5Lx/8U
/ezbvER8/G/AfOROBM8hRAX7BmJzuJ21V35hOpEVqHfyco0KmBoXqERVGpbKjzZk
eVcq1YLAZfubuH0iK4nErn4nMEhbbZ7NtJ78nkzZ1JfETxHZ8yULIM3cjlo1xGXC
vy2ytJS4KrnXiovh6c6cgp5qXWaPu2NA4yp7B73hG0/D3i7bkMEfpUrcu4fTjcH3
UYlCOp7eTAQ3/xNS7y21
=C5Yr
-----END PGP SIGNATURE-----

--dOnbUs275AO9J6bN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
