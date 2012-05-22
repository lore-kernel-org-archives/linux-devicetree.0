From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 05/12] usb: chipidea: add imx driver binding
Date: Tue, 22 May 2012 13:35:17 +0300
Message-ID: <20120522103516.GR30559@arwen.pp.htv.fi>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-6-git-send-email-richard.zhao@freescale.com>
 <201205220630.57007.marex@denx.de>
 <20120522045120.GL6206@b20223-02.ap.freescale.net>
 <87fwasbkt7.fsf@ashishki-desk.ger.corp.intel.com>
 <20120522100624.GP30559@arwen.pp.htv.fi>
 <20120522103139.GD32035@b20223-02.ap.freescale.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8815973555533131863=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120522103139.GD32035-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8815973555533131863==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Uw+RRa3pmtkgiNaD"
Content-Disposition: inline


--Uw+RRa3pmtkgiNaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 06:31:40PM +0800, Richard Zhao wrote:
> On Tue, May 22, 2012 at 01:06:26PM +0300, Felipe Balbi wrote:
> > Hi,
> >=20
> > On Tue, May 22, 2012 at 12:56:52PM +0300, Alexander Shishkin wrote:
> > > > Do you think it's a good idea to let user select binding driver dir=
ectly
> > > > and the binding driver config depends on chipidea config?
> > >=20
> > > I don't have a strong opinion on this, although I prefer it the way it
> > > is now, because, imo:
> > >=20
> > >   * in case of =3Dm (and that's the only sane way of compiling it any=
way),
> > >     these all are compiled as modules, which you simply don't install=
 if
> > >     you don't want them;
> > >   * all of them get compile-tested every time you change something in
> > >     the driver, which is a good thing;
> >=20
> > only true for $(ARCH) builds. I would like to see these drivers being
> > compile tested on linux-next on all arches. Thus the patches I just
> > sent.
> The idea is great. But
> - how can I make sure it pass for all arch? There' 27 folder in arch/.
> - it's hard to predict one driver depends on what.
> - for embedded kernel, people like built-in drivers, and people will
>   have things they don't need at all.

that's true to some extent, but until we know for sure that all of that
is compiling fine and all dependencies are properly handled, I wouldn't
like to see Kconfig or Makefile being abused. That has happened before
and will happen again if we allow it.

My suggestion to Alex is to remove all dependencies for at least a
couple of merge windows and only add dependencies for stuff which
actually matters; like only building the PCI glue layer when CONFIG_PCI
is defined instead of when ARCH_X86 is defined and so on.

When it gets to a product, that can be easily optimized and when we have
decided what's the best way to place the choices, we will do so. Until
then, we like to use linux-next for compile testing everything.

--=20
balbi

--Uw+RRa3pmtkgiNaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPu2vjAAoJEIaOsuA1yqRENLcP/jXATOypgmoCq0Sn5mKz517b
W4SPlq3GhrXeHb107IA3SHRm12dawy/Fv4X9cQ1bz2y2aRQjZ7dnUVIeHZ2FCdL0
irUtLLg7ddKMcl9C9EEcxrDf2GB6eWR5IFfv94l/paYOsmpJ+eusrq4e2Eqzx4ce
YM2lBDNnJ0FdE0oGhvLKfNjnHrdElv1yrQdrqoGJD9jQMG2x22/90vObaPaqU4nb
BcMNYukGigXUzfqueLhHDZLUSOTqLczOI9Z8oBWhBb5IobrZPjEg8+QRKafNOzV/
xuj5e/bMesW5k0uA+5v+YtlNOf1p1pFNYgzzuQjIi+FiENkmGEz268T6iT8xkDDc
lAxfF11R22E1cnCnpur4hY4Mi1lXWQnFQ6qxcxbzIUwl4X+8Txjmfn97cNEZyUkE
RfrraJ6KOmPj4xZ2Gr9aL2f5MkT7fRa8ocDucLWZwagxymtT5SD5BinHfLozhr7j
3eMklrVMRWH/i+1+2hNVLRoPDAJnftQhT3JjmyR1VEVXZqyhFZMX4FxvfPoMrJ0F
8K1XUyQca1ytpAtUg8O2bLHJm36UDKQ1Uz5JO8q7p0f0cumeh7/cmugqc2k/Uj0R
ct/fnZ8I7dXTpTepxix4NvmfdGi9fZehRNZD3traX6lCG6ILaP8APXgIbS4rulQZ
d/STspkEZgL2kgwKwTMZ
=PPeW
-----END PGP SIGNATURE-----

--Uw+RRa3pmtkgiNaD--

--===============8815973555533131863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8815973555533131863==--
