From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Tue, 17 Oct 2017 12:39:49 +0300
Message-ID: <87fuaijeoq.fsf@linux.intel.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com> <87wp3uji3x.fsf@linux.intel.com> <KL1PR06MB170284D41F8517AD9A96E8A0B84C0@KL1PR06MB1702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <KL1PR06MB170284D41F8517AD9A96E8A0B84C0-k6wCOA2IOKSx7cDWSRonpW0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb@vger.kernel.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> writes:
> Hi,
>
>> -----Original Message-----
>> From: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:devicetree-
>> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Felipe Balbi
>> Sent: 17 October 2017 09:26
>> To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; Greg Kroah-Hartman
>> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark
>> Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>; Chris Paterson
>> <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; Fabrizio Castro
>> <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-rene=
sas-
>> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Biju Das
>> <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a77=
43/5
>>
>>
>> Hi,
>>
>> Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> writes:
>> > This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
>> > (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>> >
>> > This doesn't change the driver, so it does nothing by itself.  But it
>> > does mean that checkpatch won't complain about a future patch that
>> > adds "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which
>> > helps ensure that shipped DTs use documented compatibility strings.
>> >
>> > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> > ---
>> > This patch is tested against Linux next tag next-20170929
>
>> care to rebase on my testing/next? It fails to apply.
>
> Sorry for the trouble.
>
> I have already send a V2 for fixing this.
>
> [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
> https://patchwork.kernel.org/patch/9990063/
>
> I have rebased this patch on my testing/next and confirms it apply cleanl=
y.

thank you, now applied :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnlz+UACgkQzL64meEa
mQZ18g/+NO2I4ekLK3bAPaNPOW9nLXNpIfrhssSUeCeSiB/kbkXqhNMpfBEoRTbq
1J1vpbnuiUXVjSAYWECYqRsWiQniNpwOmJEMWgQlK5hr1n5YrSKKvbe1DmXQa6mR
idtNS99CLpK018tZHv9NDoiJ7WEvtlP1ZisSmHyXWwhwv70DOkJWr34imC8YcxMz
O1GbrxV42I6FbaGT2doxpryniAVQe3sn+omjyLa2TNRVf2gqp/TDexWryn/cQOhX
E/Vi6pbbYdcQ7Tl/ZLRU+On4f1ZDDm1abbndBdXyve8L4yrIZBZhb/h9ZHPeWOtJ
tjp9ynvMYDHVHQvL6sExYdbWlwKPxi5QDxALMkwiREWyWkKkbJODt26esKKaHGIf
nDsxUAQEgy3dxWOAo6p+G6ydG91nmhbeAyLrEKuDfr8+5MOFdkPI7RE9TysTAEzJ
NuCwwwyQHe+uL6/yOuuXWwxz8WWjqwGXlQgrKnWlzQwFCQcsBLMGWnwzdLoSZ91i
jQYTr43XFvCnFo4Gj5JilkOIsT/RSYSrJN/fVFcsmA3ySZICH1nmj6/Nu6LJuYuv
nzqDIDMaPa3ciDaAVjWYb+h0CVkpClCrvJstmbwVu9OhxKxdmVGHR8kxr2smGwQW
oGqO5ig61EF0UGIWo6yh3NhhGnK5VY6HxL/+fBpybNdU0g7GjSc=
=3+jM
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
