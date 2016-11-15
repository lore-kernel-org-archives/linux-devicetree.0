From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] usb: dwc2: params revert and rework
Date: Tue, 15 Nov 2016 13:32:27 +0200
Message-ID: <87polxugfo.fsf@linux.intel.com>
References: <cover.1479176826.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479176826.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> Hi Felipe,
>
> This reverts and fixes a few commits that are queued on your
> testing/next, removing the previously added DT bindings, and the code
> that reads them in.
>
> The feedback was that IP validation is not reason enough to add these.
> So we'll leave them out for now.

these are still in testing/next, so I can actually still drop
them. I'm applying only patch 3/3, please make sure it all looks good on
testing/next.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlgq8ksACgkQzL64meEa
mQYWchAAqQotXWKK/il8woXLT+U41rPAyqziVCcGYfLYYjLZCx9YUHH0/gjotRUP
+St5kPwJP2BaITywMdaHFJIvflaYLCUr5H8HKiErpOq7DG9tfPxCsCdvhgOIwkkk
bnyu1aSA96DR2MM7k4LepklV9BF4dxP4qAyKSr50Gpo07B29igqK6dbZlbMgKeNd
pu4boSCKhdEFPBzp+g7k4lsrIrtnk1eQINviqxYmscRq3oEDdNV7+T9Oddbp1WT0
mF+3qAweOYBSQfcZkW2Kd7V4DxIhzoVaFVwzNYyDUv1vO7tBDq1fAYVE0dn+Rblo
rNoej9FhfrLcoYodjGm65avqcHT6gCDlfaknFt64KJEEMMH7snaR7+mDI6X0xtre
pDbFk1xuyN6usqv2wThC4kj8YRtXDqZ0QQtUJvpu6N5Wxcjy73HGR3SvaT+zBU2k
WfVku2YvTanyf64jef4o2xojShH43XrwTqz36LFmWY9FCHdmBZTRGi4p+Z/qwyTq
bB/Kv1ILaWoarwuThLj1MER9f7qhf23tbDzPus5Ya29DCjHxn+2EtEa9rBPGZAOB
Xm9229S9uVOIreiy1kx/PK2o9dsockSa2VBXs3tg1CH/cs2YsE+RxqI1/QjAMsDs
WKFRR/F9zYXrHPhllKWkGVywQs1grIM+I7Z5ZRLW1rGgc9SglBs=
=fhJX
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
