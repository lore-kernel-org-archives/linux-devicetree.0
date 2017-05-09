From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Tue, 09 May 2017 09:40:45 -0700
Message-ID: <8760hanfua.fsf@eliezer.anholt.net>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com> <87shklznuo.fsf@eliezer.anholt.net> <1493861983.2182.11.camel@intel.com> <87lgqcsg18.fsf@eliezer.anholt.net> <1494209010.2533.4.camel@intel.com> <87efvz2v4m.fsf@eliezer.anholt.net> <1494300270.5383.29.camel@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494300270.5383.29.camel-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dinguyen@kernel.org" <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Vetter, Daniel" <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Loh, Tien Hock" <tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> On Mon, 2017-05-08 at 09:03 -0700, Eric Anholt wrote:
>> "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
>>=20
>> >=20
>> > On Thu, 2017-05-04 at 10:11 -0700, Eric Anholt wrote:
>> > >=20
>> > > "Ong, Hean Loong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:
>> > >=20
>> > > >=20
>> > > >=20
>> > > > On Wed, 2017-05-03 at 13:28 -0700, Eric Anholt wrote:
>> > > > >=20
>> > > > >=20
>> > > > > hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org writes:
>> > > > >=20
>> > > > > >=20
>> > > > > >=20
>> > > > > >=20
>> > > > > > From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
>> > > > > >=20
>> > > > > > Hi,
>> > > > > >=20
>> > > > > > The new Intel Arria10 SOC FPGA devkit has a Display Port IP
>> > > > > > component=C2=A0
>> > > > > > which requires a new driver. This is a virtual driver in
>> > > > > > which
>> > > > > > the
>> > > > > > FGPA hardware would enable the Display Port based on the
>> > > > > > information
>> > > > > > and data provided from the DRM frame buffer from the OS.
>> > > > > > Basically
>> > > > > > all
>> > > > > > all information with reagrds to resolution and bits per
>> > > > > > pixel
>> > > > > > are
>> > > > > > pre-configured on the FPGA design and these information are
>> > > > > > fed
>> > > > > > to
>> > > > > > the driver via the device tree information as part of the
>> > > > > > hardware=C2=A0
>> > > > > > information.
>> > > > > I started reviewing the code, but I want to make sure I
>> > > > > understand
>> > > > > what's going on:
>> > > > >=20
>> > > > > This IP core isn't displaying contents from system memory on
>> > > > > some
>> > > > > sort
>> > > > > of actual physical display, right?=C2=A0=C2=A0It's a core that t=
akes
>> > > > > some
>> > > > > input
>> > > > > video stream (not described in the DT or in this driver) and
>> > > > > stores
>> > > > > it
>> > > > > to memory?
>> > > > If the IP Core you are referring to is some form of GPU then in
>> > > > this
>> > > > case we are using the Intel FPGA Display Port Framebuffer IP.
>> > > > It
>> > > > does
>> > > > display contents streamed from the ARM/Linux system to the
>> > > > Display
>> > > > Port
>> > > > of the physical Monitor.
>> > > >=20
>> > > > Below a simple illustration of the system:
>> > > >=20
>> > > > ARM/Linux --DMA-->Intel FPGA Display Port Framebuffer IP
>> > > > 				|
>> > > > 				|
>> > > > 			Physical Connection
>> > > > 			Display Port
>> > > The "DMA" in this diagram is the frame reader IP, right?=C2=A0=C2=A0=
The
>> > > frame
>> > > reader, as described in the spec, sounds approximately like a DRM
>> > > plane,
>> > > so if you have that in your system then that needs to be part of
>> > > this
>> > > DRM driver (otherwise you won't be putting the right things on
>> > > the
>> > > screen!).
>> > Would the drm_simple_display_pipe_init=C2=A0be able to handle this ? It
>> > seems to be displaying the proper images on screen, based on my
>> > current
>> > changes. There were recommendations to use the
>> > drm_simple_display_pipe_init instead of creating the CRTC and
>> > planes
>> > myself
>> The docs I've read for the Frame Buffer IP don't fit into any current
>> DRM component, since it's what we're currently calling a "writeback
>> connector".
>>=20
> While running my own test (since the intel-gpu-tools doesn't seems
> applicable.) The drm_simple_display_pipe_init seems to be simple enough
> for displaying a matchbox console. The use case for this driver is only
> part of the enablemennt of the reference design board so that users of
> the Arria10 devkit can use this as base for their own designs.
>
>> I don't understand your system enough to answer.=C2=A0=C2=A0You didn't a=
nswer
>> if
>> the "DMA" block you diagrammed was the frame reader IP (or maybe the
>> frame reader IP comes after).=C2=A0=C2=A0I also don't see how the frame =
buffer
>> IP
>> could possibly be connected directly to a physical display connector.
>
> The FPGA FrameBuffer 2 soft IP reads the information provided to it
> from the Linux Kernel via the platform device register provided in the
> DT. The Linux driver here allocates a chunk of coherent memory that
> directly maps to the SDRAM. The FPGA soft IP would stream the display
> out to the Display Port based on the information that was written to
> the SDRAM.

Your "FPGA soft IP" that's reading pixels from an area of memory (a DRM
plane does this) and outputting that to a display port (a DRM CRTC and
encoder does this) would make a lot of sense as a DRM driver.

However, this piece of hardware that takes in pixels in a stream from
elsewhere and stores it to memory doesn't make sense to me as a DRM
driver.

I can't really offer more advice until I understand what's generating
the pixels that the FrameBuffer IP is storing.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkR8Q0ACgkQtdYpNtH8
nuiPWA//UeO9aBp45ZJNpdz/g23fiwggz9GWmXfY/QMcAtUAbhYX47rt7emfmzOh
OADJ7depEJ8z3YiB6SAWXlwTjZTbArtIRF/P3lEufX0mVtKtq34NBUuHV2xzQDP3
h5Bq46CmNZf96pe02gISQYCaU9uNcVrzSi/EDfztyF0SXLZbzaThoikbu+ReAhWA
qYusd1jX3MXYfnQPNnj/3v2NL3xSV0QaG0xJQIUeyfn2k7Af0gANpcmF3yiu7y+A
luEW9tkZ3DaXuDiTH2IQZDlInzbVo+wV5LmhOA2Vh2Y08uqDF9iQeOACGHi6Xjkg
5HBbYJsfJaaCuaQcewLT/7MOvqzK3TxWAjDX9eHllSGCaNxrbt7fNKL4ytLAcTgM
zALWTakC1FaXhIyMCtqYXUtE4ZxJwXHJsL1mXwnZ7nH1Joj+bgo6lUyEWqcCkHUf
rRsNno+igQgrwUnpp46xFANl9Px9glHRH8v7GFC8CCXU9vfUVQiR4+8waf51fir0
7Vnhswl2T+Si+PcHGmsW0rMFRV4zqqICbJEc262RvnuPpB3vMX2c3/3QvN9un+JB
2v0lKk5U+YQ0vupJWbiZG4pdwUSx19b03CnyKbTVNCnDIoqbktuD465Rv1UxOaWC
PxmuUXy7dDHPAguYkmmPpfDVM4P2cpXxLfYKAbxWPjByXSCGDrY=
=wwI5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
