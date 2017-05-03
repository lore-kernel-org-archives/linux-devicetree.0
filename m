From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Wed, 03 May 2017 13:28:47 -0700
Message-ID: <87shklznuo.fsf@eliezer.anholt.net>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493086006-4392-1-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org writes:

> From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>
> Hi,
>
> The new Intel Arria10 SOC FPGA devkit has a Display Port IP component=20
> which requires a new driver. This is a virtual driver in which the
> FGPA hardware would enable the Display Port based on the information
> and data provided from the DRM frame buffer from the OS. Basically all
> all information with reagrds to resolution and bits per pixel are
> pre-configured on the FPGA design and these information are fed to
> the driver via the device tree information as part of the hardware=20
> information.

I started reviewing the code, but I want to make sure I understand
what's going on:

This IP core isn't displaying contents from system memory on some sort
of actual physical display, right?  It's a core that takes some input
video stream (not described in the DT or in this driver) and stores it
to memory?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkKPX8ACgkQtdYpNtH8
nuixDRAAqrbNjJhk07JjPMpGvtEt92wS0gfIfORJGtWcoB3/9ePweM5lvFTey+RA
153Y8WAQ2qv93VtxArdmIOcFSmx7wtimilWHq6NL//I01aB1MGRiC2Z3iRDk5rER
g2fDdMO6mQCx4YFW1jr7bcDmgbc7DYW4L5QvwvS4L/gxic1374ixQngs0aNh/js8
FTTCAvATFecwnUUtzMd/HY96PULr4FDKcn84Yqq5xD1yKWUIKqZz2qbnFRAkx9dJ
7EeQOQjtigzNVIxEfXuz/AmpMi9epiCq4xPi2lwaPgeiDkFiAThk3PIi5aFB7V1h
p0GTcmEVMLzIw4jioqCfHPr7NU7Lqo0VgY1yrY/zL+6ICfwhcp0m12ZJI0sAdpm0
3qE3RFk7Cp9aEL5CDb5oDonVGTEPgM9wks9MXSwQrhPd79OZ2SrUa2rvE91r+Rpc
9XitFV1rXQmu736hTBSUmaj8omkb31Hm6pTnNkEONXB3vBTxc1cx1WIfaGSO+g1Q
n08VnqccaJS6aaJzW/c+fJnkR+W7TzhsuAE17PmuZ4ea351NORfopzrTVgXDMSc5
uzBRfuoQFmav4lBI7wf6+ACcaSQ2lZIYmoyaxlbkcbuNYHljUfnOtELjBmybdtCg
LTW86Eq/+dD2859PzJ6TzoR5vLNrKmtu8YCW3GZtBiIsE6qzgVE=
=KdYS
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
