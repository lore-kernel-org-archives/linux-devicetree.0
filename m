From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 0/3] drm: tinydrm driver for adafruit PiTFT 3.5"
 touchscreen
Date: Thu, 25 Oct 2018 19:30:04 -0700
Message-ID: <87o9bhphhv.fsf@anholt.net>
References: <20181024184313.2967-1-eric@anholt.net> <87h8harnv4.fsf@anholt.net>
 <2e548bd7-81f3-5952-b5de-96c26c9f6b19@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1070663533=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <2e548bd7-81f3-5952-b5de-96c26c9f6b19@tronnes.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============1070663533==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Noralf Tr=C3=B8nnes <noralf@tronnes.org> writes:

> Den 25.10.2018 18.29, skrev Eric Anholt:
>> Eric Anholt <eric@anholt.net> writes:
>>
>>> I was going to start working on making the vc4 driver work with
>>> tinydrm panels, but it turned out tinydrm didn't have the panel I had
>>> previously bought.  So, last night I ported the fbtft staging
>>> driver over to DRM.
>>>
>>> It seems to work (with DT at
>>> https://github.com/anholt/linux/commits/drm-misc-next-hx8357d) --
>>> fbdev works great including rotated, and so does modetest.  However,
>>> when X11 comes up at 16bpp, I get:
>>>
>>> https://photos.app.goo.gl/8tuhzPFFoDGamEfk8
>>>
>>> If I have tinydrm set a preferred bpp of 24, X looks great.  Noralf,
>>> any ideas?
>> Also, with these patches and the format modifier patch I just sent, mesa
>> with vc4 is now working with this driver on this branch:
>>
>> https://gitlab.freedesktop.org/anholt/mesa/commits/kmsro
>
> Ah, nice to see this happening!
> Getting hw rendering was one of the advantages I saw DRM could provide
> over fbdev on these displays. Little did I know how complicated graphics
> was outside fbdev, so I was unable to realise this myself.
>
> The current solution to get hw rendering is to have a userspace process
> that continously copies the framebuffer:
> https://github.com/tasanakorn/rpi-fbcp
>
> It's used by some of the small DIY handheld game consoles that run
> emulators which requires hw rendering.
>
>> Now I wonder how we can improve performance of the SPI updates.
>
> At what SPI speed are you running? The datasheet for most of these
> display controllers list the max speed as 10MHz, but almost all of them
> can go faster. Some are reported going as high as 70-80MHz. That's for
> the pixel data transfer, not the commands. tinydrm/mipi-dbi.c sends
> commands at 10MHz and pixels at full speed (mipi_dbi_spi_cmd_max_speed()).
> Most panels I have run at 32MHz or 48MHz.

I copied the DT from the adafruit tree, which has it at 32mhz.  System
performance seems to be limited by the copy and format conversion I
think -- in particular, I wonder if we shouldn't be doing our dirty
copies in our own workqueue.  I haven't managed to get any really good
profiling data yet, though.

glxgears at 128x128 is nice and smooth, and at 480x320 it's 6fps.
That's not filling 32mhz of SPI.  On the other hand, I would have
expected the uncached reads for the 4-to-2 swapped conversion to be able
to go faster than 3.5mb/sec.  If it's the uncached reads, we could at
least use NEON for the copy to cached, and probably even do the whole
conversion in NEON with a bit more thought.

Another option: use a vc4 RCL to do RGBA8888 to RGB565, since that will
be less pressure on the bus.  But then, I suppose I should just figure
out what's going on that makes X11 at RGBA8888 break, and fix that so we
don't even have to do that conversion.

I keep hoping there's some way we could feed output from the DISPSLAVE
HVS register directly to the SPI master -- FIFO32 gets us close (two
16-bit pixels packed next to each other, leftmost in the lower 2 bytes),
but the need for byte swapping (as opposed to R/B swapping) I think
makes it impossible.

> Almost all the time is spent in the SPI transfer, so every hz counts. On
> the Pi there's byte swapping because the DMA capable SPI controller can't
> do 16-bit (tinydrm_swab16()). If I remember correctly this has negligible
> impact on performance.
>
> The SPI controller/driver on the Pi has some restrictions on the speeds
> to choose from because the divisor has to be a multiple of two
> (bcm2835_spi_transfer_one()).

That's weird.  My specs say CDIV must be a *power* of two, with lower
values rounded down.  I guess that means we might be running things
fast, not slow, though (and at 32mhz out of 250, we should be getting
the same CDIV).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlvSfCwACgkQtdYpNtH8
nuiPUw//fvXTsurPu2BCl58pMcW76ja4IHDiPu7kQQESmNRZSu9wx3jGxIUgEl2z
3hpA0r0wrxmYMk1q79DIhyq8qJbhlnc02h2Us5qLYpuBiBbpZ5hU/f/X4aTG3g7Y
6lKxg2oheTMfHXuFDrRfSN/VdY/gJvnscC7BlLyIyjVIwu8lpvcUsXhiQ/mdZw+J
OcRu1ZD45MCNmrFzGeSs6iTIf3OLr7xG8Vh0wpec4WH+h9axIfWjm9X0ldbKzFap
wFi6mQ37Qrfu1CZo9ETQ9rZR/P30jRPOEe6MEWrLLRpxQx2Rj/0jTFr5aOSWcf22
bXKMqevoVkq6e6yt7b3yxMzi8VkDLXCmj3mbZO4c0xb+KQCmjZ0e9SRwO6unmntQ
ee2rU4AkKM7wNj/1wgtgwebJzmuFknEgmWK6/u+/tJAiKr08Vsq7aWkiV1phe5L6
fk9q3eB9b3fktKo/RejxVKSrmo8f782HzuAMCP8i0vbrqNjoYENdq+duiT6lWZHa
JOPt7QwPInFXmncJ1iw1s6kons7Z7XiXkTD7UELd/v+okezdNJXclTBxuSsRK5BN
+HtPEKVxz1PdEWgYiuoLdbwYxJXbwO4Biy3slzi7xZqe1MaahulKEjZb8mE7Kls5
3QlpJhUr/pXrYIKDEJ8Awj78hIQKe06FDgcvHyQDUTXPXOZ32v8=
=5mhz
-----END PGP SIGNATURE-----
--=-=-=--

--===============1070663533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1070663533==--
