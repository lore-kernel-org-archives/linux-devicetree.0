From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 15/23] ARM: u300: set up board power from device tree
Date: Wed, 24 Apr 2013 11:21:13 +0100
Message-ID: <20130424102113.GI5019@opensource.wolfsonmicro.com>
References: <1366624656-6648-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3821623810778298194=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366624656-6648-1-git-send-email-linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============3821623810778298194==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yvzb+MHGXtbPBi5F"
Content-Disposition: inline


--Yvzb+MHGXtbPBi5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 22, 2013 at 11:57:36AM +0200, Linus Walleij wrote:

> Hi Mark, this was especially tricky due to the absence of a
> function to get a named regulator without a device node. After
> some cleverness introducing a node for the board akin to the
> solution I did for Nomadik, this seems to be an acceptable way
> forward, any other suggestions welcome.

I would expect this to be bound based on the board name that appears in
the device tree which (given the way this stuff mostly works) I'd expect
to have a device node available.

--Yvzb+MHGXtbPBi5F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRd7ITAAoJELSic+t+oim9ZigQAIOwTW/lQRtAGDzCQbdvmsVV
Q8oCehdi1O07DJWR5jcB2Vd5cKZCIqHmbAMEisrmoof0PTh3yUZNu4P00Yevn6/B
YIK57eSshcmWi5N+j7Ul83RYhu34UwhM1sxzkz+4BqLeJvLJd8RKxUFd3tbuXEH9
VWmB9S+Mxfo8/rC1ZMTQPbj8AEYDj1HO5I+T8+QNwabmil+xuP0tw3wsQorKgpE0
/N1AzurPlwdoB2wFxRLxu8btNTtTxzqXB2lntPdGsqtQkKdBHwtzyc4GuA2vdax+
MIr0384S+vLwq5EXPWpthNQbcf5/IScxB/RjfxpJGtJTCZwjI13q1PIC/ePkWwSv
a2CkDbY/nYHUxITsTats/77U0CwAstXzxhjoZT5QTalrdkdjPoiLHdOduNvetmSC
7nogrfOZoOtUOHbPtmpRCiYccYZYkRfFpmsAfPiO1cQcm6U3VsqBQfg0Tpf11BzJ
72//0R+XOcnKK45QIX1HEb566bDovD6p4OYVnw9BKOZKTyuntZ4gupXuJFbGPtD0
PXp4J25JGO6MBOOFUSXowSd+ol+/HiUJPM4giKjMsk+cz0g0E22+gaLBtEkFUd+9
lQQzkiyWUNvTGJQenD1VzVK/CQsgxYe0spVni/uM7Q/dGsIkUEQxr8ABAIYSVc4q
hE698zLtv4AVI4RzUNsi
=aKbe
-----END PGP SIGNATURE-----

--Yvzb+MHGXtbPBi5F--

--===============3821623810778298194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============3821623810778298194==--
