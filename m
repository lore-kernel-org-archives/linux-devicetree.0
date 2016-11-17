From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] usb: dwc2: Add binding for AHB burst
Date: Thu, 17 Nov 2016 13:27:24 +0200
Message-ID: <874m36tkgz.fsf@linux.intel.com>
References: <cover.1479339900.git.johnyoun@synopsys.com> <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7fa1c1c4d703c435d698cdf140c9d43163347f1d.1479339900.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> Add the "snps,ahb-burst" binding and read it in.
>
> This property controls which burst type to perform on the AHB bus as a
> master in internal DMA mode. This overrides the legacy param value,
> which we need to keep around for now since several platforms use it.
>
> Some platforms may see better or worse performance based on this
> value. The HAPS platform is one example where all INCRx have worse
> performance than INCR.
>
> Other platforms (such as the Canyonlands board) report that the default
> value causes system hangs.
>
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

it's getting rather late for this merge window. I still need an ack by
Rob or any of the devicetree folks.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlgtlBwACgkQzL64meEa
mQbYqw//UeTRUhFG4LRUwfZ2WYNI7WOHhO93QevEuRvbplI4UFaJYesW7Sx9kSSZ
zoS4neKkM42qbbg35cNSoRELv3uWuvlomv6C3mdoUv6e8YLiTm7P+/lXYhIrygCz
tqv24EiUyrA2R1KiJFJxDY+Bhv1YFa27KAm+/+jwX4o/eU6SZa//HJL4p0sFkMNX
bkrpXMUhVgzfSJZlmvj4AxMzOF4aVvcAUFlA0mOPjxBQBCWX7XVz9HWLWqu4qhn9
odXsuvBOOW69Vf9ywWCzhzh7IP4MsLPbyXvrrNzLWDt6n5+ffkDsULaXii1dJ83i
xfnpoRCqwVOOkUkgJQ/AGH9igo5tR0I6iFO7cuLp8CjzCSh6YzJidXMPEJIhs38D
RBnwENaaaCdi4JaSk27P1jpkZLo+u4n60tnOjdjDLWP4B/a0d8slI5mRtZlG/cFB
FcKMXcACX2J+kxc9BmX75Efmt0SvckjEN3DfsUKRbDe4Yk35oYcznVwTG0R4531e
yeidVh8yEI2EoUi5eF56vrBHvYY2aAP3lOq8kgQwge9U2PuHLQUe4BqVzgxRCN0v
typHpJX3RJzxXqxsufsdod97HQgI/e/tIZWgpkUpiSKYFXem7Vzek57ZvViIvJeJ
evFIAKa3q4tOfhTSvF/cjd+Ue2TG6Ig+k/Vs6etx2TaH/zT9alY=
=i9/b
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
