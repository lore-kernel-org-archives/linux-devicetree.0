From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4.7 fix] ARM: dts: sunxi: Add pll3 to simplefb nodes
 clocks lists
Date: Wed, 22 Jun 2016 11:52:03 +0200
Message-ID: <20160622095203.GT26668@lukather>
References: <1466456242-22841-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6293865375946725239=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1466456242-22841-1-git-send-email-hdegoede@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6293865375946725239==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/7+LvQqw8N5lf/3J"
Content-Disposition: inline


--/7+LvQqw8N5lf/3J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 10:57:22PM +0200, Hans de Goede wrote:
> Now that we've a clock node describing pll3 we must add it to the
> simplefb nodes clocks lists to avoid it getting turned off when
> simplefb is used.
>=20
> This fixes the screen going black when using simplefb.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/7+LvQqw8N5lf/3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXal/DAAoJEBx+YmzsjxAghUgP/RVaeuwz6esTldGOMFRbNIOY
u+k++ue7qyOj4kjwxSO2WJ2CUQzGu8nIHmXoshzxh2wsIz6P0KKPRCWEQ9ZBS14d
wC8DAoi3r64SF8VUeicYOl0skLjacsV1jW+hkQyVKPqy7rt3JnhD5Agk8qG/0/tv
BCT99S5tA6yvUqcU0qUix47WW7MoJP+6IMgCwu2+TQYHzQxLCA1o1Ni7K9DIzxb3
gYAvAVCUpEU1UrQD+vsIwl81JQ3waOzJywjFoAZQs4hFktnshCzKalMi5Xh1QlKi
Zz9keo+v6Iq6LSEax8mTao/YD5Nlm58foeVyXl+MYng4JSLSb33WMP9Ml3J50Umk
7jIlkuN3AnAS6NkaF0a7g8Kp0pWQPIzccYJ0NzwvEGiMTEQAIczeQ9Rc3vOrGnpn
Mx0VRIigIQCWf9btuKrGoIKoMTwSl2nioBucDtD/9TA/FPZB4pktTZKNT7VPUqNg
t2WMEZpVB6ykmwrSHCpaXFwsQODMTC6e3OWaEhyrcj6uPYkdLqxOoh93ge124e7j
MjsFfGnEO/kFpKg/KnMWjT59KQ9c7RMwDs+laYZLYEu+B+7xTQq3tYFeYJi+8nEE
t22POwlnNTspr/ZkoIKtoSZIayTxvgKGw2w6gaxBmOK5N9wDB/mAAV1ys6/e1re8
kwFCcUxP6tQWLOzjJCdM
=linK
-----END PGP SIGNATURE-----

--/7+LvQqw8N5lf/3J--


--===============6293865375946725239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6293865375946725239==--
