From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 4/6] clk: sunxi-ng: mux: Add clk notifier functions
Date: Thu, 25 Aug 2016 22:31:17 +0200
Message-ID: <20160825203117.GE32598@lukather>
References: <20160825062200.17206-1-wens@csie.org>
 <20160825062200.17206-5-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160825062200.17206-5-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 02:21:58PM +0800, Chen-Yu Tsai wrote:
> On sunxi we support cpufreq by changing the clock rate of PLL-CPU.
> It's possible the clock output of the PLL goes out of the CPU's
> operational limits when the PLL's multipliers / dividers are changed
> and it hasn't stabilized yet. This would result in the CPU hanging.
>=20
> To circumvent this, we temporarily switch the CPU mux clock to another
> stable clock before the rate change, and switch it back after the PLL
> stabilizes. This is done with clk notifiers registered on the PLL.
>=20
> This patch adds common functions for notifiers to reparent mux clocks.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv1WVAAoJEBx+YmzsjxAgMw4QAJvwkMmFL1BYVOSwjQtK79mb
qAvOBmrSe2dhr7rwZq7BmuKlRqk/AELCcQRCJxRlcK1qimJ+36gliBTLxDRdNml/
uHkk7IjCu8DHXQH8BHsdhleZEi+cyDnI/HgdDrVfdn4kpVL5hK13ad/VQA+k9t7J
GhMFqJQgGlIh0zYVOpOIPBhARXq3paEQ8y1Hie3QA+YMhZArGsi7qmRWyfa0Fegy
yONSvQ1TxKNzVetOI1PIKhmcvJPCQv5O//1cr6p21EVFRwq8uSAnpbeEWqvzCUmY
9Jz20d14WwvaS9ibcho2kk+kWUs1z/3Mv8B+wAxIipz0kMR6qs+eI2K2t5jH4exD
ymwiTLFOgYz54TgDanm5Acm1Bt/xuJN89l2526KFNrFbrQaAU9KTgRw7NG2KPOdx
zBqXLmw1TzRNMTngraKMGNiaLdwrU6rGD7MkUjGldbUGQxuMpRXIVuuu9TPulfaN
qGtqhW8VI0Yq1Qq/JFutTktpIUWhVmLOpt028Wpd19sGA2l8t7uiBfdOhyxha+Ks
cCbzC84CU76iva8V7+5nfiKb3GfSgh0aJ2oYrHwJj+lvpC0qnZl4skYiAPmiKwyg
VA9AFkHa/lxHFNwHqvsu6K8NMquDLftCO4UIS2r9Gse/GRCnl+rI3veqPo37v4Qe
0lSu4KMp8N1Yk5+7Dmue
=3zYY
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
