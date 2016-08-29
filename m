From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RESEND PATCH, v5 3/5] usb: xhci-mtk: make IPPC register optional
Date: Mon, 29 Aug 2016 11:01:02 +0300
Message-ID: <877fb0dmwx.fsf@linux.intel.com>
References: <1472094329-18466-1-git-send-email-chunfeng.yun@mediatek.com> <1472094329-18466-4-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472094329-18466-4-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
> Make IPPC register optional to support host side of dual-role mode,
> due to it is moved into common glue layer for simplification.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Mathias? Are you taking these patches?? I don't wanna take peripheral
side driver if you won't take xhci side.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJXw+u+AAoJEIaOsuA1yqREKkAP/ikhY29E16Jwp2Jywxc4yL/3
rqH7iup7K0So3dLjxjxSWM6/NPT61pMeRQ7HUAeVqhxAKjb4oV4XE2gBjo6b/O7/
OinXS5EWmCoc5kiwFvjgPM1EnWZptH9PyvFHIoX0Qa7QtLB5vMuSrmpH8m2AeTlP
WIHJICko0KGLfhsmNFz6iioQknFv+vGF9Te9NjAbg3TJD+Ib+vYVs830+D5wnzov
r+3xnrSoes1yOdJ4p/DBrHZMGOoY6lQiHeIwGb1W8fG9nIFOX+DFGCR1bj9TQ13G
colFol08GX2DYR80ialyjDkM9KcJWJBX1rPuJgc5mYFXxcNBI8OWtIo1EnvYz4RM
QF07KaKaTpaJwAK+qE66NNw/br6nyOR6tDYXrskIkkOoYdTurClAp3QEkRhhsyfo
0f/RpsovG9fLVQUzd8ChPfj9AK13z7KLA8XRgfK7D/HwHHrDRky4nXvvbO9F0HNd
AT4qRvhOCeWbsba+3LszG6bf6XsI6qnbfqwbTR2GWMEhv1XtnbB8fAPAjBOfRGb+
wsh0+71U4aBkAUonucCG7iAgXQqB4xKnmPXm8fhDzN59aHFqr+JgjJL6zDhgVL7a
UwEt2bDZCEPEaiPRdaZurYYTtpSXeFsMkABi1pZBWKcMVt6x1HntuwfV+xJY5rL3
+KQGs73PNObOQgkq+1H6
=5epm
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
