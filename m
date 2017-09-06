From: Alban <albeu@free.fr>
Subject: Re: [PATCH] MIPS: ath79: support devicetree selection
Date: Wed, 6 Sep 2017 14:20:05 +0200
Message-ID: <20170906142005.67586253@avionic-0141>
References: <b78cb3ef8df8531efdb7b011743ad3f38978015d.1503070362.git.rocco.folino@gmail.com>
        <20170906111435.GA1856@linux-mips.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nd3vumMaUNjHQFp.SuYcp1b"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170906111435.GA1856@linux-mips.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Rocco Folino <rocco.folino@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Antony Pavlov <antonynpavlov@gmail.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

--Sig_/nd3vumMaUNjHQFp.SuYcp1b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 6 Sep 2017 13:14:35 +0200
Ralf Baechle <ralf@linux-mips.org> wrote:

> On Fri, Aug 18, 2017 at 05:32:42PM +0200, Rocco Folino wrote:
>=20
> > Allow to choose devicetrees from Kconfig.
> >=20
> > Signed-off-by: Rocco Folino <rocco.folino@gmail.com>

I don't really see the point of this patch. Building the dtb doesn't
take any significant time, so why add this extra complexity?

Alban

--Sig_/nd3vumMaUNjHQFp.SuYcp1b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZr+f1AAoJEHSUmkuduC28u3wP/22JVWYsobIfzp53onycqX4Z
+95PCOASEajOP4VnvSCTBehpR5cdgSmTvIxj7XMvhIJTc7hdkn+ON9dd7W/Puj6a
hTj48GiBxvUiuwutzGO+wQqU92njkE7ctchlaLEKNauxy6rhAfgW4n0oTG1NuiwJ
OsQOet5qjjmbLOj6NMt/0SNlH5hc6l7RQN7c5EM7c6GWvXqookvR5wvx/1Yh3VDw
/eRxjW23ijBHZ7EaMf/a/7U7dP805aoooEUDTx8zngBrFK7byBO0tu/DytH9AdRx
a6cR1m7s5vEYjqL/VvniKQSgZA7IDuobeJhLHej73Za/BgsjLJwv/5Mf3Pv6bfD1
lL1j0Z3tz/JDqqv4nfOZLaek8t5SPOyPlECQ3MdEevftGLijtqGRMRCK8a0yp7hZ
mmEanpynF5wS2yz28I1Xc0JtnjmCB3eZd/Oe+3GYmJGP5Z8OL0PucYlh5MtYokfd
tkzdPNjyJbhlyjrcjsV5p57asjxvth5Xq39fIjWbQmrMEVRsvgkQsAXha9gz1H7Y
GhkueBbeTrBctYVnskqR+0pAaZIzrqzOn3QjwJLl6ca9kbv+TrmulA8tIjE3rHWR
9rz0ijBT8Yvf43IabghuOJzR9/m0d4RFA62ZeUWlBtAll2Uh7eCHT3ectdIVt8cn
aRlkLR0FEEp9kUzyrGIt
=nQcJ
-----END PGP SIGNATURE-----

--Sig_/nd3vumMaUNjHQFp.SuYcp1b--
