From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
Date: Wed, 9 Jan 2019 11:57:54 +0100
Message-ID: <20190109105754.vvqx6uvsktvxeq7a@ninjato>
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3617666679457328161=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190109104922.z6g772vgncdqqbqt@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org


--===============3617666679457328161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="phwlhbwhrxbkakdi"
Content-Disposition: inline


--phwlhbwhrxbkakdi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz

No mmc2 initialized. That should work regardless of eMMC. Probably
something wrong in the DT somewhere.


--phwlhbwhrxbkakdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlw107IACgkQFA3kzBSg
KbZUJA//YTnAX1C+RWIs26zxjrhGtZVQqNchtRQVPrtAgcDh9swKWcOpLbIcEH1W
cb9Ly2QqkKMNMh271IW2SxkaocaQ7vTKl1lwGP3MqKfHc2MB8EWcmOjzRGiASD+P
/LSilcxUpxb2yweyUH/2V/DNSVU1oNgFTn6ux44LqlZEtHgXMxFQY4jXaYrBZ3Mu
2FhnFx6m7NCXYA9bTPZz1eEOsWHxEfCrCJzRqLP29zhg0RiBmOYcwy5GNyaFZfuT
kS1QqD0AwmF17WmekCOBNTKgMKnMHJxIs3yjE7FMDTUKR94eNL9eok2PiXZt8JSv
N1aMmw+5ISR0ZPDn5mlq0H52vCyTRmHu9R6Z1phJdR5MaSh8+ELP1C5GPxudMpfS
BKUzEIN2aX5BmlLhGrDMAhlv3vutKQp03/6Y4ZTXZPhyiDqA1oY4YFuTUCt+/8ny
21sBlIHd+LvU0H3exLLz1yOb3D72unvbNhNVixlmS4LY9qLAXcfTf1bsp/Dt48q3
cCKjmCGElASTJDfxL4PcN5z72eevgKHlIzeMDu/22ZAUVsOK/0mjYN102uONyaTb
nlHG1pndronLO35R1ncv9AqiCKm8bEyjvvBkDFQpE4oCPC0Xl5S3eRpB40LphHjE
17zX5/0YgUZ5hL+roYh96FQB1y8P+kh3XXx7BR6F7j/wJDppdNQ=
=6CtJ
-----END PGP SIGNATURE-----

--phwlhbwhrxbkakdi--


--===============3617666679457328161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3617666679457328161==--
