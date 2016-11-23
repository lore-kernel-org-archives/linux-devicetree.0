From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regulator: max77620: add support to configure MPOK
Date: Wed, 23 Nov 2016 16:40:53 +0000
Message-ID: <20161123164053.444jmn7tsuhf5g64@sirena.org.uk>
References: <1479405276-26452-1-git-send-email-vreddytalla@nvidia.com>
 <20161121130948.GC3917@dell>
 <20161121131121.GE3917@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="odv3gqnskzih6fw4"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161121131121.GE3917@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Venkat Reddy Talla <vreddytalla@nvidia.com>, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, svelpula@nvidia.com
List-Id: devicetree@vger.kernel.org


--odv3gqnskzih6fw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2016 at 01:11:21PM +0000, Lee Jones wrote:

> Mark if you want to take this patch, feel free.

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/=
regulator-max77620-mpok

for you to fetch changes up to 983779235a4d08f94e8cda073200423e0ff01d2e:

  regulator: max77620: add documentation for MPOK property (2016-11-23 16:2=
7:42 +0000)

----------------------------------------------------------------
regulator: max77620: Implement support for MPOK bit

Allow systems to configure the MPOK bit, controlling power OK signalling
=66rom the device.

----------------------------------------------------------------
Venkat Reddy Talla (3):
      regulator: max77620: remove unused variable
      regulator: max77620: add support to configure MPOK
      regulator: max77620: add documentation for MPOK property

 Documentation/devicetree/bindings/mfd/max77620.txt | 12 ++++++
 drivers/regulator/max77620-regulator.c             | 47 ++++++++++++++++++=
+++-
 include/linux/mfd/max77620.h                       |  2 +
 3 files changed, 60 insertions(+), 1 deletion(-)

--odv3gqnskzih6fw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYNcaUAAoJECTWi3JdVIfQergH/0LFOemzsPt6E2hc/N8UGx+d
8xR+84tItNnz3t58SoUGCXDgjxCJrYGdTF/tA6f4V5Dt9hsPQhgq1esEsUdaNwLd
6q3DSUzoQ6QcHgwK1qL/9FD+WLXkdyCngTQQucGMVEsyvFMFEQuc4DrrxV2gPQZx
9Wd9DAclCV+tMY5vB0nRgzr7ZlxTBh/8L0ih/N64pD1s1NVN4ulZ+uD+DWJsxlU+
eMjN0+LLfVs/ilGr99QeO0ICM/HlF08yJKyJeKcSj5JeKXigUTtsgBRFqX624Q4i
RRcNzKXIYPmAzVd1KLb7wdt3iGlBYizNW44wY5OKmMSW0uxFnd3YMjvw5Umm3pA=
=8HLT
-----END PGP SIGNATURE-----

--odv3gqnskzih6fw4--
