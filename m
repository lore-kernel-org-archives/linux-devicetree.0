From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 0/9] ARM: bcm283x: RPi 3 B+ support and other improvements
Date: Fri, 13 Apr 2018 13:01:19 -0700
Message-ID: <878t9qzxio.fsf@anholt.net>
References: <1523640478-4448-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1933039627649845637=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523640478-4448-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Alexander Graf <agraf@suse.de>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1933039627649845637==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> The main focus of the patch series is to provide support for the new
> Raspberry Pi 3 B+ . The rest are parts which missed the merge window for =
4.17.
>
> Since there are still some issues with LAN78XX, also apply Phil Elwell's
> patches [1] and Dave Stevenson's patches [2] before testing. But they are=
 not
> required for the function of this series.=20=20=20=20

This series all looks great to me, and is:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlrRDI8ACgkQtdYpNtH8
nuiodg//aWmu2OoNwGK1WBpyDM9WMJlE0d32vgpm9V+tZ7KomKXaAn9ZZMxhqcL+
zV4YhtxAODq0Ch/VA0wrHsPlna0J+mZA6pieKbSZD2PHSOQoiiYyWk66tUX66GE4
8FzhDls8Er6XsQilhPAaBnH1X/R87xc00ui9p3xOcgBOFLtnTtiCtUXIi6+/QGNU
8ko/3SfTG4duWSATwUoHa/Lxs8rZ09OBlmNGrEX0AuXLtNpEJWBRSnEs8/heG47s
96LUv1UQ0RfDT/Gq85qAe/1uZWwKREZm1sYcsPK3J6w8/yCDwkYci67IS9nhvGr/
G8YyVAV3xHD72x/jSLpkiI0Yzl/bmK6Yaa6OsxcOw6Rut1St9IOjTWSBzCUKWIpb
Cj3GG7bwwiA3oqAMVXuSu64jj/CPpv+XWh/ws+9v14MhRMtxYARBc/IUQsLY+e3K
C6Fvza0wsfwlroAfAzhm5sGb7ulbK7gGI1syjOV83N7wXPsbquZztCeRhknb5Smg
SeBfJ8qdjx/5jv/ohkVNbEafHNLJmJly1oPGeLRdNheJvlWgifOUy68noYp4r+zq
ZIkCWrjAk3HvfZY8pxfu7gdl2LwXYk3elW93u6cN+jqHGz6hna0K43bTiPk+D8P0
ujnwJkNPBjBppWAr/r2bSwNJkFfcpioGMlyG9nbnAe5NJkNs7z0=
=IP9J
-----END PGP SIGNATURE-----
--=-=-=--


--===============1933039627649845637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1933039627649845637==--
