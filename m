From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt moderation
Date: Tue, 01 Nov 2016 13:16:08 +0200
Message-ID: <87oa1zpi13.fsf@linux.intel.com>
References: <cover.1477424426.git.johnyoun@synopsys.com> <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com> <20161026105632.GG19965@leverpostej> <36413315-16eb-d690-b559-ab5ae103c5f9@synopsys.com> <20161028102350.GD5806@leverpostej> <87mvhosr4g.fsf@linux.intel.com> <20161028103843.GE5806@leverpostej> <75a1dc4a-1d7e-a8e3-dd71-c0bed1927dca@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <75a1dc4a-1d7e-a8e3-dd71-c0bed1927dca-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>> I'm not sure that it makes sense for this to be in the DT, though I may
>> have misunderstood.
>
> I'm ok omitting the DT binding until it is needed by someone. Since we
> currently only need it for the workaround, which is detected
> automatically.
>
> Felipe, are you ok with this?

certainly. No problems whatsoever :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGHl4AAoJEMy+uJnhGpkGEKsP/0OWJDMNjGpb7sydmJ3Tg8+k
1lU2nF+nveZNq6DIRUh3R45+bzY/tu73upaz9tvPn05z1kCK7bfGj/fL46d0qg6l
wOgo0HaUhfAZiphT/Ksz8pDkahdPHljH229/2pPcCfAVa2bQQW9GOkT4o2USqA98
HnDmKp3GhLPkqkh/mNu4DwBM4ZO5LtsQKMiZZuI/8fpEXQGWzUCgDz9S7T01+bCl
uDQN1Y3iSI6UI5nGZNNbQ9RLN7KAJhEczVnBnrOBiNddUiHALjxZOisv0ERpXf1D
ZBG6uREhmHdGlR86UOYbbIRIuoc+aUTcqJoC44jwfc5axSucjGiRXVITY2RhicUc
mJ8g6D3/88Y3A4Fl0C8GSAF8KW4DQwB5jdgwGYaWMvZLjr1/XWNJH8TP4AIVH3Nf
aurJCixbeliJTyAoVqcew8SaavHR8Y1G67yFKV4WKxO83DixFEyW9aThIcL2X8BT
gGzwbmrrNGuSRhcxxeSg0Q0P4YNvhAtU7vxUAoKPfUvfutHrfQjCqhaYaVByQN7R
WT4AvsFnlppBbaKI/k0Hfw2MiYO5j67vnFmHweNotarCZtO6Fom6Gub3eFNBm/ya
wtOYAgLNDOElUioCuBVM7EzZ64VdoEFuJjwqxXPpXng87wZDC8KvSJA22u+ti2yY
l4M7k9zs/pH5uMCAaLVo
=U4by
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
