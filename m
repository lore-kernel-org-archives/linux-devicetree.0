From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/panel: add simple-panel description using DT
Date: Tue, 13 May 2014 09:51:50 +0200
Message-ID: <20140513075148.GF6754@ulmo>
References: <1399645002-18000-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0182420846=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1399645002-18000-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris BREZILLON <boris.brezillon@free-electrons.com>
Cc: devicetree@vger.kernel.org, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0182420846==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b8GWCKCLzrXbuNet"
Content-Disposition: inline


--b8GWCKCLzrXbuNet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2014 at 04:16:40PM +0200, Boris BREZILLON wrote:
> Hello Thierry,
>=20
> I noticed you're describing each new panel with a new entry in the
> of_platform_match table and a new compatible string.
> I guess you have a good reason to do it this way, because retrieving
> panel description from DT would be pretty easy (see this series ;-)).
>=20
> Could tell me why you chose this approach ?

The reason is that devicetree mandates that a device be identified using
a compatible value and that compatible value should be as specific as
possible. That compatible value should give the device driver enough
information to know everything it needs (resolution, timings, physical
dimension).

Having all of that data in the device tree is redundant.

Thierry

--b8GWCKCLzrXbuNet
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTcc8UAAoJEN0jrNd/PrOhiZMQAIoGWc2IIgvBGMoZpjoIDsyv
NOlEVgH6+ytY1HUJAffHcqhMGit44xD2xoxE09i/DQYmemJOXFUNDJhk9KBT8VpM
9FrB3u0HNi5HeZZ55G/ZunS7dO3A00rzjsNZY0OD5dUPncVkmmE5VKpxncwTZH27
57RjL7x6XtYf/EiGLdaOZdkdEUGyKLvPUPJBY3+/TREcbr0MmeMx0nkaXUOYGicU
0uJNso/v0cuZAXRfMXMMusBuZEUmh5Xu83DnHg/qr3sK0GuDwn7qMIzE1ouHee89
ZTVikewTA+TEpzkguhPjjyXuFhFHs+Vx4hD1idQ/baeIXXsmVs3yYVyiENU9gxyB
usCkVNXyhBLsxKPhLcZlSU+VE518Jxx4K5ObVz+ZZAQyepVKVMzFHf0e70f6iUas
0ulWXRJNhCBg1Ud/VAcnjk1zY4HyEmCmVmdNAAlkSmRoVlZrZHP6w7R0KuI8uFuz
dbj7liOtbjzxvJwOriJHJZ60ZkLEUdpwNOsHuqmLNAdjHb+3QUhCGp2gZwlB8xOS
rkP2J2MaxVHAY/uvuPEvkM0rgBMbUdxuVsEwKWw9ThtOlMoYIB0npTretwsq0GOX
7575RB2t+1t50zLjH2pekFKVbqTW5PL5G03cJO0ZrEs+A/HTWaMOvE1/vgynPFOm
y7qncQqVc3bUokSqA/l/
=ggt9
-----END PGP SIGNATURE-----

--b8GWCKCLzrXbuNet--

--===============0182420846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0182420846==--
