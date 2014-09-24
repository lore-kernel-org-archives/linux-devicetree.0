From: Mark Brown <broonie@kernel.org>
Subject: Re: regulator node names and unit-addresses? (Re: [PATCH v2 1/5]
 ARM: shmobile: kzm9d: Remove spurious regulator base addresses)
Date: Wed, 24 Sep 2014 09:27:26 +0100
Message-ID: <20140924082726.GX4015@sirena.org.uk>
References: <CAMuHMdVC2h4_Q+4BpV5iLbhfviimzrnfZ3+c6dqnegTAxBHw_g@mail.gmail.com>
 <20140924081455.GU4015@sirena.org.uk>
 <CAMuHMdWQfSLwqMMigLOZuGFJqQO03Qyw+ZHE1YAgd6mNDGmrEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6790311168108756246=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAMuHMdWQfSLwqMMigLOZuGFJqQO03Qyw+ZHE1YAgd6mNDGmrEg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms@verge.net.au>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6790311168108756246==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qRqofxetdBO9L27H"
Content-Disposition: inline


--qRqofxetdBO9L27H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2014 at 10:21:12AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 24, 2014 at 10:14 AM, Mark Brown <broonie@kernel.org> wrote:

> > As far as the regulator API is concerned the node name is completly
> > immaterial and all this stuff is just verbiage we're forced to include.
> > As far as I can tell the requirement that node names be in the form
> > "regulator" or whatever is just another thing that wasn't terribly well
> > thought through in ePAPR, they were trying to do classes I think.

> So perhaps we should just keep "regulator@0" and "regulator@1"?

I don't care what they're called so long as things work; the DT people
are the ones to ask though.

--qRqofxetdBO9L27H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUIoBtAAoJECTWi3JdVIfQcBwH/RPaghAYlu5qUpsvSrTkSIu9
ksbjo3QtgXhNyX2yLpwXla4v6zJSLcSQ8jlHBxvUeHWcGsS9LJyyi26TPuFvAA0J
zMZSNqSchAaIfpnseR0m+hTSxegOevDdaMmAEz+HdkQIFD20aBc6kpZtk85ebRZX
FYu/B5DcQIvUVssMqzW/VFwMd48IemU5KqzG8+r6rVp1Wta8EbZQdasfoRGAPji+
k8wlhyRwekQmPDyg1a2nKEga9qPCd0d146nEPDe0I8UXRdRIGD4VON7Df7tAGxr+
LvsAkYl5pCzKxMNPH7exwLASxk1i0zOx4JF/zGARqpIG6YJ5FgGXPjrjCy70jRM=
=nju0
-----END PGP SIGNATURE-----

--qRqofxetdBO9L27H--


--===============6790311168108756246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6790311168108756246==--
