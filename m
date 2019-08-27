From: Sven Eckelmann <sven-KaDOiPu9UxWEi8DpZVb4nw@public.gmane.org>
Subject: Re: [PATCH 10/49] ath11k: add debug.c
Date: Tue, 27 Aug 2019 09:35:54 +0200
Message-ID: <4441194.D8eDD6Tzdi@bentobox>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org> <2708501.D2hezO5Rnt@bentobox> <80bdedf3740960e0ce05b02a77d1b457@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2493492.G6y1Xp12sA"; micalg="pgp-sha512"; protocol="application/pgp-signature"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <80bdedf3740960e0ce05b02a77d1b457-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anilkumar Kolli <akolli-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--nextPart2493492.G6y1Xp12sA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 27 August 2019 09:33:39 CEST Anilkumar Kolli wrote:
[...]
> >     [ 4312.884650] The reading for sensor 4 is 0x002041f7
> >     [ 4312.891499] The reading for sensor 5 is 0x002051f4
> >     [ 4312.896415] Couldn't get reading for sensor 6
> >     [ 4312.901189] Couldn't get reading for sensor 7
> >     [ 4312.905561] The reading for sensor 8 is 0x002081e0
> >     [ 4312.909902] The reading for sensor 9 is 0x002091f7
> >     [ 4312.914645] Couldn't get reading for sensor 10
> >     [ 4312.919364] The reading for sensor 11 is 0x0020b1fa
> >     [ 4312.923791] The reading for sensor 12 is 0x0020c1fa
> >     [ 4312.928621] Couldn't get reading for sensor 13
> >     [ 4312.933425] The reading for sensor 14 is 0x0020e1f4
> >     [ 4312.937941] The reading for sensor 15 is 0x0020f1e7
> >     [ 4313.942700] Rebooting in 3 seconds..
> > 
> > Maybe can be fixed by a different kernel (for the remoteproc). But I 
> > don't
> > have this kernel at the moment.
> > 
> 
> The write of an "assert", sends 'WMI_FORCE_FW_HANG_CMDID' WMI command to 
> target firmware.
> This WMI command forces the target to assert.

Yes, but it shouldn't kill the complete system.

Kind regards,
	Sven

--nextPart2493492.G6y1Xp12sA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl1k3VoACgkQXYcKB8Em
e0a9MA//dLviXuRMjJGR01qJslAHx12n9IorBsRkDov60rQnOk+6rClZmgUHW4xI
RSNvzfGlTy9IH+vbmdsNKfK8ixnw9g4m8L5wxwzjGSjEOmerQOxHSsnOu9zTZnWG
AXlgdDSWfI06nx42aehdzZ9P6dgh0jpHIdc3m3t+qdhKsi4Tp3wA0aGyWdwaw2Qd
Ok34en5klPN629oEUEVIiPqvpr2xymiKrSnGx3F1cxXY7+hG9JtDhXj9jgVUlSXi
F76GSE5y/oEwZ0rCvziqismYir/xJntI7e2PX1IOLC3LirFkJvGY1J80ZaQRmyas
DQqt069SZL3bzsQn/FnQ/kgPJM6iTW0JkmThyLwPiy0ITJUQBQxJpUALP/kRPcrg
7L9c3uox6qMu/PKwUsgS/uxVWQ6t0X0BYX5ZQkl9pgM81gd0UG6CIov2x0tybkzX
rVCyVfVWPIA2OKbiExwZG201zghNu56Gzl7+lhWZFFy4FNBZUwcilONDHhECfuEi
0wrVx9UCMrxDMC8BZHa2mQV6+Bu9qbBz1eogQbtbtWk5A37iiQsvwGUZTU8q756p
I0BR+ZcBlW09kd9oyWOdXGnvOYjmyasT4uZatCYEWwdplXcfHCuA3oRrt3b61SsJ
f12M3O/Umhq0rBL/bx/ZxNeZF4F2msSDi0PW+w6mFdGaPqgwLpc=
=I7YO
-----END PGP SIGNATURE-----

--nextPart2493492.G6y1Xp12sA--
