From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: sunxi: Add basic support for
 Allwinner A80 SoC
Date: Wed, 24 Sep 2014 15:28:23 +0200
Message-ID: <20140924132823.GV15315@lukather>
References: <1411311493-24344-1-git-send-email-wens@csie.org>
 <20140924064124.GS15315@lukather>
 <CAGb2v659fps1WAqkdnbnTtHxAdCZQy+rYXDC90Y44pPtcxnsFg@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="22hJjvOmZW2O/jbw"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBW4OROQQKGQEI34OLGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v659fps1WAqkdnbnTtHxAdCZQy+rYXDC90Y44pPtcxnsFg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, ctl <ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--22hJjvOmZW2O/jbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2014 at 06:40:42PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Wed, Sep 24, 2014 at 2:41 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Chen-Yu,
> >
> > On Sun, Sep 21, 2014 at 10:58:07PM +0800, Chen-Yu Tsai wrote:
> >> Hi everyone,
> >>
> >> This patch series adds very basic support for Allwinner's A80 SoC,
> >> a big.LITTLE architecture with 4 Cortex-A7s and 4 Cortex-A15s.
> >>
> >> Development is done on the A80 Optimus Board, the defacto development
> >> board for the A80, with the accompanying SDK as a reference.
> >>
> >> So far I've been unable to get the board to boot from MMC, or
> >> using Android fastboot. I'm using Allwinner's FEL mode to load
> >> the bootloader and kernel+dtb image over USB. Notes on my attempts
> >> can be found here: http://linux-sunxi.org/User:Wens#A80_Optimus
> >
> > It looks very nice, thanks a lot. You'll find a minor comments inline.
> >
> > One thing I forgot to ask you about when doing the A23, and that would
> > nice to do is to update the documentation we have in
> > Documentation/arm/sunxi/README with the A23 and A80 infos you've been
> > able to gather.
>=20
> I'll add the A80 datasheet in v2, and do a separate series for A23, A31,
> and A31s docs.

Ah, yes, the A31 and A31s didn't have links to the user manuals...

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--22hJjvOmZW2O/jbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIsb3AAoJEBx+YmzsjxAgY1AQAK4qa4LYIYOCFXSyN9BASvYb
OJ1wq39nHZz6KNdsxKkVyF/UNo7sSOiRXM2qSa+Qaw7l2HMA+GS02ZGiIQ7OBdz4
zTc0EPnoER8T/qkiX7fA6EhUre+Nx/nqwlHRjdj9nGx9rpx4Pw+D8qzRJfUWNJTr
fR25dNYSuUriwaha02lsVialbLJfTusmq+MwS7pHkWJvGFXnUdNmp96XkUmqHf+7
XVXMPkCpQuzXXNvVoG1wCIjEWPILq5wG4iZpke5dpPt2PFpj7z3liVpheXrVJ9TS
y4cZneniyFzhePlC/Zka4zjk4kTZhkrRRH/qMI9+vEMWU9orOnEi9rYXaoWnpSzH
0qJ5mNEUcF+Hr/v7w1s3c37fXSh17HOeyYeO+rlOuS8SJbgXUjbJf1tsfg2K80uC
krzktIiJsIuATT1mJLA46eTxC8/OMdqACFMfemczc7UkPb5IoH7P+bY5ED9FnpjP
VsYa0evS173RHU6RO5XfHfeydlJayHp1rpIWcNIh/nz2DDl+ALzYBiV7Qs+8F5AK
Bb3C1zbFjnnAT0xeRANPiUNaInVKEni9ceg3h8npUCzgG3Ez+5eDCIzqzZ5Ht7hb
LEun9SZo4otUCCFdxN2ZJabeAyx4V8DsJtLOOsGiCZG7iWXKeBpbXSxHBn7Qk53m
beIjVGEqdkdM5s7VU1n/
=DjAZ
-----END PGP SIGNATURE-----

--22hJjvOmZW2O/jbw--
