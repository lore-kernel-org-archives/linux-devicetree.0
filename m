From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Thu, 04 May 2017 10:11:47 -0700
Message-ID: <87lgqcsg18.fsf@eliezer.anholt.net>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com> <87shklznuo.fsf@eliezer.anholt.net> <1493861983.2182.11.camel@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493861983.2182.11.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "dinguyen@kernel.org" <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Vetter, Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Loh, Tien Hock" <tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> On Wed, 2017-05-03 at 13:28 -0700, Eric Anholt wrote:
>> hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org writes:
>>=20
>> >=20
>> > From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> >=20
>> > Hi,
>> >=20
>> > The new Intel Arria10 SOC FPGA devkit has a Display Port IP
>> > component=C2=A0
>> > which requires a new driver. This is a virtual driver in which the
>> > FGPA hardware would enable the Display Port based on the
>> > information
>> > and data provided from the DRM frame buffer from the OS. Basically
>> > all
>> > all information with reagrds to resolution and bits per pixel are
>> > pre-configured on the FPGA design and these information are fed to
>> > the driver via the device tree information as part of the hardware=C2=
=A0
>> > information.
>> I started reviewing the code, but I want to make sure I understand
>> what's going on:
>>=20
>> This IP core isn't displaying contents from system memory on some
>> sort
>> of actual physical display, right?=C2=A0=C2=A0It's a core that takes som=
e input
>> video stream (not described in the DT or in this driver) and stores
>> it
>> to memory?
>
> If the IP Core you are referring to is some form of GPU then in this
> case we are using the Intel FPGA Display Port Framebuffer IP. It does
> display contents streamed from the ARM/Linux system to the Display Port
> of the physical Monitor.
>
> Below a simple illustration of the system:
>
> ARM/Linux --DMA-->Intel FPGA Display Port Framebuffer IP
> 				|
> 				|
> 			Physical Connection
> 			Display Port

The "DMA" in this diagram is the frame reader IP, right?  The frame
reader, as described in the spec, sounds approximately like a DRM plane,
so if you have that in your system then that needs to be part of this
DRM driver (otherwise you won't be putting the right things on the
screen!).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkLYNQACgkQtdYpNtH8
nuhqeQ//YLETJdRYER4rn3Pb4cClV0TAHywNbK8XLTDS5Ipw3ljmlGQMzOzbhS96
XtMASOvrhOeOJ2Ni+c0LKHGk0qgYaVs0M3LXkEA/p3aGI/Q7Jtn1DbgN5RjB8VmG
wFO1wAqvV2HgW039wnZnPykEjvl+7FzFAjGC6mJNeVRPe8AWqvYT1e2znPUyRrEM
mFIxZYKBWyRu8DMQSzAusJMzW4B3++MSz93H1F74+HcwlSy7wUfPHF8K6f+eUKKA
nk2u7ydA1YXIVTB2RuvvjE07rwvbY7XYYTfdV+nOfhv7eV59Givww/hVaMsOwiXV
+KLsqoIrZaPinnb/UufqxALDYQetlj/3hynpbfqlRYHz06a3V9IuSSWtc/sTabHD
P8+LDrpd2XoX0Mi+7++k026CdLLrUxN0GZQVN59aptJMggXDZk2TdOVS1mi8kTN4
er1GkxGfb6P4B33yO0VkqzS1bqatIJFDeicINUlvQCB/9u7oDy1l0V6lCFZOva5P
bs/y/2Gp6eJAYYebYVUvH0uWjSPWqtSJxbjZJSDLFKB7oH2K6vFxTGow9YiSyb1n
CJQpzmISv0kFE+UqqD89CrozLjHI9YL6TkT95vhWFwFf+ap6pfivYQJrGkbpAzRo
UMi80F5dMGrYt/z2I7PRQ9RdPCX8qO2f4mvblVSgAwzRH5Jh1Ng=
=57fm
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
