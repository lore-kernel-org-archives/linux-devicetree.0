Return-Path: <SRS0=KT5F=NZ=linux.intel.com=felipe.balbi@kernel.org>
From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v6 2/3] usb: dwc3: Add disabling of start_transfer failure quirk
In-Reply-To: <ead428b935b52df74dbe386185e1b8298b0135b4.1541707248.git.thinhn@synopsys.com>
References: <cover.1541707248.git.thinhn@synopsys.com> <ead428b935b52df74dbe386185e1b8298b0135b4.1541707248.git.thinhn@synopsys.com>
Date: Wed, 14 Nov 2018 13:41:25 +0200
Message-ID: <87va4zj38a.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
To: Thinh Nguyen <thinh.nguyen@synopsys.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <devicetree@vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <thinh.nguyen@synopsys.com> writes:

> DWC_usb31 peripheral v1.70a-ea06 and prior needs a SW workaround for
> isoc START TRANSFER command failure. However, some affected versions may
> have RTL patches to fix this without a SW workaround. Add this quirk to
> disable the SW workaround when it is not needed.
>
> Synopsys STAR 9001202023: Wrong microframe number for isochronous IN
> endpoints.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

unfortunately, does't apply to testing/next. Could you rebase??

checking file Documentation/devicetree/bindings/usb/dwc3.txt
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED

(patch 1/3 is applied, though)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlvsCeUACgkQzL64meEa
mQbmZQ/+PrswhM6tXyLKyG1HIsLtcTLPul9ySx/g50E07TfvxYSxfwe4OFp41x1M
3jcdrNQm6KuaKkT1U7H5kzJ2/oYAdjDlXzeN+UOh/1Y1l2Dl9ws0ybiy9m4sW+VS
bFMnV3fe43DMytBt31Wm8E0pGKkCUXKArSKM8zWWSQmaBSsh0HbPpGRlzcVlrTvd
lFp8a1FIYbgs2gXSzNZ30Y/xaYov+2sTYo4KAbpvrZ7cGVHrAdDzX4jMmDrVlWXT
kwZOIO7Fyx9qdXoiS6zBJ6V2j3aKVHK6fCUrE9zmoFIJBYVw9R3NR3qPlfRRUtYM
YtcXiuGlApiP1RYQjCqhCWpGz7lwyhbBCQ250h9bTnNZ5MfZkaV1ibDcVlyzlQmK
CcFDviN97yBpR3jio+gIkkAAVTb8lpcE4RdGWAvkgc0Mw5pwZ3j+xfLk5nevKghv
FCodjCaiX7si9/bWOHKc7Lt+QYODSjIeYUZZqwcd7saM/Hec13iCb4XKnTCVPT/J
CPRcXtu3Isusne4l37XJqUQGsBDiYwAqabOZxWMDGaznd56vAVMMr7nCkXok57Uu
nMotd5oL/a32M8HF6Qo8oCgTFWaVl62dZqu6s4OoDoJbr7cvok9DfKei/tMkAQwj
fJaqwJlmqhX+hDoGXC/nrYpAm/NDK/zi1GPuII1GJKo2l+CsQng=
=CUi8
-----END PGP SIGNATURE-----
--=-=-=--
