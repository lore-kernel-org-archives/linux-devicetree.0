From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Tue, 17 Oct 2017 11:25:54 +0300
Message-ID: <87wp3uji3x.fsf@linux.intel.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507216358-917-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> writes:
> This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>
> This doesn't change the driver, so it does nothing by itself.  But it does
> mean that checkpatch won't complain about a future patch that adds
> "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which helps
> ensure that shipped DTs use documented compatibility strings.
>
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> This patch is tested against Linux next tag next-20170929

care to rebase on my testing/next? It fails to apply.

While doing that, please collect all Acks given.

8<------------------------------------------------------------------------

checking file Documentation/devicetree/bindings/usb/renesas_usbhs.txt
Hunk #2 FAILED at 12.
1 out of 2 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnlvpMACgkQzL64meEa
mQaEbA//d1GTMrjBybTGKlYFgQF+5B+Q7NfXY9pw0XfaqcxFD2tgxZCNNwG1VCeM
XR9SHsSArg7HB9iop2LM99Kgu9NexcqhLA2tAdnq1+rEcehg0n1ICUqOd3KluHlF
5bKLgW06G/vD1lWiVDnJmrqqxa+fIXHQ+pOU3NMkIZjL/jbjttv1e7/86Y5+j+P5
LmCHouH4SyAN41iiv9sSiTr31k//NMixx3UAn/awMF9vlw/fYFMV1uX/JuJo5Hw/
bEtJLxW8PuPWX/2CiNyuPzEUJ7vqfiTWyj5GFqkfLomk7PbilcFHooMmYlvY3Ww6
8Mtlg6SBDqkDnJzruJ/wfMLPEud/EEO13x3yUxi0YPYhG37jcX3CRebrikKTa305
O0NMulqQnEg0hJdQQbEm58wOho7Abjbo7kBQy5aSXbcQOIhNgWZPLjcT/UGjntLa
PgMdyqGEpTwFlnNgB+uLLV8QKWguwU8hflbPaoko80qlXrvIBDaUT0kclIK8+YCa
atMzC5QZnStqggQSjKmvsmH20kwRJJSnF5DG7rnNYv1OoS3GF1GzXvilZGAAqVO8
+9DVln48T/QFwhAzJpY1V+LZgBKip8VcTHRhg4A0EVrjRG7UIRI1tBrWKD3wP3vu
2Mx/2LFmQIfU3T+ywhToG422b4qkNT4cabOtaBrnlDKHblws8NU=
=F+RY
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
