From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 6/6] ARM: dts: bcm283x: Add missing GPIO line names
Date: Mon, 21 Jan 2019 12:27:23 -0800
Message-ID: <871s554uz8.fsf@anholt.net>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
 <1547297008-2740-7-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7657847242977051009=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-7-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: Gottfried Haider <gottfried.haider@gmail.com>, devicetree@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============7657847242977051009==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The GPIO sysfs is deprecated and disabled in the defconfig files.
> So in order to motivate the usage of the new GPIO character device API
> add the missing GPIO line names for Raspberry Pi 2 and 3. In the lack
> of full schematics i would leave all undocumented pins as unnamed.

I didn't cross-check the GPIOs against schematics this time, but I trust
your attention to detail on this.

Series is:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlxGKysACgkQtdYpNtH8
nujUHA/+MJTcTE82y75LgXa7DY7+ZVSnD6afFFuBLYyRiwxt9JKN3nG4I5DM+NzH
FHpHgtZwaddCYpZfb0s12xnirlqaekLZf3LJkBlbEVP3jFT7Qr42dVJqrDXunyVX
7QCCs+4X/0Z0MlejJFUQxGvgKIt+of/6XPIRjcn8o5nOMaGxcgJYclnpKiBcykLq
L06DNsLzluH4gYYfTMGSOi+MFnqza22ePVDc/JJYVqKz4ihTaurow4EOPfhZ54dd
cI5QikGmSSwN4P2Am9pLC6dhfh69jynZpvVjcvfcnZhqdYFoZ6LPMm7mGOjFhuyR
sRonMvh95jWhhDtxuuqrX2AeOXCqbXYDLpEjw5XpKyg57eVBvtnnME/iBlNPMNaS
Pj3oEl8nRb9JbR2s9CtBfwi7R7kB9fFm55yveS7e1x3gNultjStgNaTXcWdCL71l
RyhPYKzvNAKX/CsR9Tl6G3OgiiEsMwNtVc0CPLdptiU1pt8ZCRX5epustVlNtqgu
3V7yaPv6pY16bZpyTlw4eS2K8LYcGWAr5yzvD6pPjfvOVx2GjoZsnYY3xXjoYH+q
CGlj98/LgRgGCgmWHHgNrC/wc8/0sSirp1rgs7vksdsDrXOAkv9LXKvAlHzV9q+g
0ImAwJibcNAYj7me1i6lC4jguA4mn68q6AUhnoLRjG+xyxMRqYk=
=sgYs
-----END PGP SIGNATURE-----
--=-=-=--


--===============7657847242977051009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7657847242977051009==--
