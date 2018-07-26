From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v6 4/4] arm: arm64: dts: add property snps incr burst type adjustment
Date: Thu, 26 Jul 2018 14:10:07 +0300
Message-ID: <87a7qe1cds.fsf@linux.intel.com>
References: <1532341959-3478-1-git-send-email-pengbo.mu@nxp.com> <1532341959-3478-4-git-send-email-pengbo.mu@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1532341959-3478-4-git-send-email-pengbo.mu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ran.wang_1@nxp.com, pengbo.mu@nxp.com
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Pengbo Mu <pengbo.mu@nxp.com> writes:

> Property "snps,incr-burst-type-adjustment =3D <x>, <y>..." for USB3.0
> DWC3.When only one value means INCRx mode with fix burst type.
> When more than one value, means undefined length burst mode, USB
> controller can use the length less than or equal to the largest
> enabled burst length.
>
> While enabling undefined length INCR burst type and INCR16 burst type,
> get better write performance on NXP Layerscape platforms: around 3%
> improvement (from 364MB/s to 375MB/s).
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Signed-off-by: Pengbo Mu <pengbo.mu@nxp.com>

will this go through arm64 tree or do you need me to pick it up?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAltZrA8ACgkQzL64meEa
mQbNthAA1avK609b6EdzdZ55k811FE+py4ljrSxVofYnM+xASfnzI/N336dAgcF6
M34NdWJh1oHF0ZKFC/O9lCm5XdKraqfUK8q4etyvDWRmhSoijDJ2QgqNkPSEpuSH
6XU9wMJSZZECww4LK+Ov9F948+BOcN2qTk1TC9eC40cExVlYRZ2RLkjfj6uARsCf
STiN4dtKTpfWha+AzCzRfnY4gQLzKUtHHm9Fr1/ws8Wgq9PXe5BsO64bVnoNa1Kd
FW4c6bckJOKxk7pa7aCaHzpihm205XN8WyOz4XUUJIpgpnK0pKJoBbNZhAXdNKJS
hGZ6pQsFNKHABKLSl9iDMnJopH7QFP6TD3I/zREOfIRLoxPg7oPwHl790x4RPskn
SEpSWi7GlJ6+C1F/K6yGvVUM7bVSNu5/JXLrlzGEM+QUVm/q2rWJj1G2aQt4urwe
M7qZRQ6kJv1RXWjJbpm2vRLCO6Z+OO2bN9Qh03F3dZd6NUWDY7DoE/t1xEW6Ws6n
eZKEohFY6FeV/B7olq/YxhhH6JvuW+oSy1ZHp2g0FUZqstVF+coMQCo0Uk8bZ1kQ
NkX7iGw2JXMjdjtDMwUfCac00Pg/oOlSwNiNJ8hXXIDR504aTRPa1wUTtkDbC3sn
0fJ2reU5N646NpaUL7gchjJbVZRuFqiOqM8ML2ji6P1H42sfTN4=
=ESN9
-----END PGP SIGNATURE-----
--=-=-=--
