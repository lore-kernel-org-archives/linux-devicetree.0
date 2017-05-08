From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Mon, 08 May 2017 09:03:53 -0700
Message-ID: <87efvz2v4m.fsf@eliezer.anholt.net>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com> <87shklznuo.fsf@eliezer.anholt.net> <1493861983.2182.11.camel@intel.com> <87lgqcsg18.fsf@eliezer.anholt.net> <1494209010.2533.4.camel@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494209010.2533.4.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dinguyen@kernel.org" <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Vetter, Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Loh, Tien Hock" <tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> On Thu, 2017-05-04 at 10:11 -0700, Eric Anholt wrote:
>> "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
>>=20
>> >=20
>> > On Wed, 2017-05-03 at 13:28 -0700, Eric Anholt wrote:
>> > >=20
>> > > hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org writes:
>> > >=20
>> > > >=20
>> > > >=20
>> > > > From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> > > >=20
>> > > > Hi,
>> > > >=20
>> > > > The new Intel Arria10 SOC FPGA devkit has a Display Port IP
>> > > > component=C2=A0
>> > > > which requires a new driver. This is a virtual driver in which
>> > > > the
>> > > > FGPA hardware would enable the Display Port based on the
>> > > > information
>> > > > and data provided from the DRM frame buffer from the OS.
>> > > > Basically
>> > > > all
>> > > > all information with reagrds to resolution and bits per pixel
>> > > > are
>> > > > pre-configured on the FPGA design and these information are fed
>> > > > to
>> > > > the driver via the device tree information as part of the
>> > > > hardware=C2=A0
>> > > > information.
>> > > I started reviewing the code, but I want to make sure I
>> > > understand
>> > > what's going on:
>> > >=20
>> > > This IP core isn't displaying contents from system memory on some
>> > > sort
>> > > of actual physical display, right?=C2=A0=C2=A0It's a core that takes=
 some
>> > > input
>> > > video stream (not described in the DT or in this driver) and
>> > > stores
>> > > it
>> > > to memory?
>> > If the IP Core you are referring to is some form of GPU then in
>> > this
>> > case we are using the Intel FPGA Display Port Framebuffer IP. It
>> > does
>> > display contents streamed from the ARM/Linux system to the Display
>> > Port
>> > of the physical Monitor.
>> >=20
>> > Below a simple illustration of the system:
>> >=20
>> > ARM/Linux --DMA-->Intel FPGA Display Port Framebuffer IP
>> > 				|
>> > 				|
>> > 			Physical Connection
>> > 			Display Port
>> The "DMA" in this diagram is the frame reader IP, right?=C2=A0=C2=A0The =
frame
>> reader, as described in the spec, sounds approximately like a DRM
>> plane,
>> so if you have that in your system then that needs to be part of this
>> DRM driver (otherwise you won't be putting the right things on the
>> screen!).
>
> Would the drm_simple_display_pipe_init=C2=A0be able to handle this ? It
> seems to be displaying the proper images on screen, based on my current
> changes. There were recommendations to use the
> drm_simple_display_pipe_init instead of creating the CRTC and planes
> myself

The docs I've read for the Frame Buffer IP don't fit into any current
DRM component, since it's what we're currently calling a "writeback
connector".

I don't understand your system enough to answer.  You didn't answer if
the "DMA" block you diagrammed was the frame reader IP (or maybe the
frame reader IP comes after).  I also don't see how the frame buffer IP
could possibly be connected directly to a physical display connector.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkQlukACgkQtdYpNtH8
nujLgA/+Lw7RsiriKv9vaH1rvfdLNofhHbMIfGmgI0C5cEqNU9Li06fLZyhSrngR
dgmU798toJ7ypFnS2xbtXx+n4hkXlDIXbpGjxcQy3pXQWJabyfTx4UtxEJgPGaqW
cp0qSok0uSEoK3XYkGK7qkCLhbKP4ZrXWlRes9UeCfI22pGaT5EW70q8qPxRwHSv
lIN2PsYJH+O4kUO6to1Osf5rYMeN7QOnu7H3p9ic5gWLH5Q764CwLUddGne/UT4T
j42ViUKEjDkvat3XXsUB0DK/dGjpAtbMLxB7DLM8nxarSqRMMSAw7qpJ9luzvQqY
0EKQzeLAA51ZcduKldHheAkmPTwGlel8Xb3N6w4LykZq4WnWaAha6Y2pNaf4viqZ
7C/GJ05Ni/WZSIh5ENDHzpkH2UP/loXAMEz3iYM2CLMv+mt2nOORA+YrvkKPsvyA
C/2SlC6W+cRUF3ISjUU8aD5OQImoJoIjzzeBQBdzosSAW6r/ybxipQOe4MQwRWe1
Zk1s0GSnA48uvcvb8mv2OcTj9WtETRkkvyTOj1krR44yPt4ttu0L7H1BBfj/HeU9
GWli3Fvt/PUxQo6gst7Qqiy80Zjc47I1h+b8TP4NDXgXqa4o6Ia6QOyIGbnjnjxt
TJ89Dp6d4/J7dLTy/TJt8G78Ey+3+oOPyGcq6MmmHBngnZVcHKA=
=4CVh
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
