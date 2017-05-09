From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Tue, 09 May 2017 09:48:31 -0700
Message-ID: <8737cenfhc.fsf@eliezer.anholt.net>
References: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b6aef857-1454-7931-2c60-6d7b55b7a0a8-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> writes:

> The Raspberry Pi startup stub files for multi-core BCM27XX processors
> make the secondary CPUs spin until the corresponding mailbox is
> written. These stubs are loaded at physical address 0x00000xxx (as seen
> by the ARMs), but this page will be reused by the kernel unless it is
> explicitly reserved, causing the waiting cores to execute random code.
>
> Use the /memreserve/ Device Tree directive to mark the first page as
> off-limits to the kernel.
>
> See: https://github.com/raspberrypi/linux/issues/1989
>
> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>

This looks great.  We're currently in the merge window, so I can't
generate a new bcm2835-dt-next yet, but I'll pick this patch up when I
do.

Thanks for submitting upstream!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkR8t8ACgkQtdYpNtH8
nuiBAQ//djx+Dt74AvMBwXWASJ3+H3NFbj6MhKMF6O7MiM7M8ejolrmxzd4TlBNc
69xQKccbKaxOW/BivmI7cs75alQld47WWN04PgpxXg2mR4szrpuW3YySgkjxXtmk
k3q2jM0JgKVL3lvNeYW6j59H96TGha/G5WYFRSBlURTnYICKqQzOTeUB2Pvs3H7j
TpTZUiT5WeefqASW97eEUN4vv96NeHEszAffuyjjfGwf2nBcHCVMnroyHzu+t7OT
Z+XKpda20mn/4ygRVO2wRt2Vr8WqYLUBCjqarr8Y4gNa6VH17ArgPm3MyT93HHlO
aHIai15210vT3QJrNUHQOvpfORhSy9TGADJ/7S2SXFfJoON65XYqpahh9xx4Yt6W
6EeZ/TbD4V06FN4nacPaJ5/HRIbCgaPjP+4ymDteUiQeEGLY1ZEFWX4XBX7I2vvu
gTeDURR42tDCJJ5ybq8BrxjXL+1ZxxMBXxUXvEEW29gUyx1Hpo4lJgLQ9JldjMj7
gzidSrrDVUZ6tDfcK4huz/GeG8yT2q3ALuUXwoPhcITmSWsfbGUAJsjyte/CzcNX
Fq894kuZDv4Ue3R5xiIAvduqzghsaaC1DMNgoopgHHYSamr0F0/71VrMje07b2LP
X/xuTCbiyHtQ+RlK9f0sECoX94NhDvvZIchWXeXAjEzrNB8+Rxg=
=aCwE
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
