From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support of hi6220
Date: Thu, 19 Nov 2015 13:04:25 -0600
Message-ID: <87ziy9erpi.fsf@saruman.tx.rr.com>
References: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447832387-27549-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
> Support hisilicon,hi6220-usb for HiKey board
>
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

doesn't apply:

Applying: usb: dwc2: add support of hi6220
error: drivers/usb/dwc2/platform.c: does not match index
Patch failed at 0001 usb: dwc2: add support of hi6220
The copy of the patch that failed is found in: workspace/linux/.git/rebase-=
apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Care to rebase on my testing/next and also collect John's and Rob's ack ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTh05AAoJEIaOsuA1yqREuJgP/2sa/6+kxdWRepZFwUFQt8A+
Hisrzv5fXU1eTUzqKSS5dfonO/bxJncLjywoUDPFcDac3Zwl0tZBrIsltiLfr0DR
PPmOxE4aRaUu6eeJMYDv1eBPcmY81vM4TNLxjjrBeUfd4sGjkTqng8ny96dZT8RH
g1pOBjXx2uT97NuqVmnBJGJqv8kMvDjJuAaYb2Bjqc4HgfIxz/RosdrLmlmkNDZk
Tk/nDEw2UyMqrjQlWjfAwnANCrlh0iXlZbEHQfSeGPYBk7DROc/Z2aX5qrPqn7vP
wYwBsbX8UePNFqOTpzGQcLkGzZecClBQlUO9C+WKBo61fA+VGgIsKfPoQoeryeFm
P1dS2zaTbK094JUIJawKwKSO/rUNkAz+UBrBnqLPGg62dhwm6oS6B5n24p7kQmTp
uSGCJ3/hclsVHolBbhB2IJvU/nf4xEYqf7YJP4cxdpFYAqQ7wHBANpl5mO4lrV4Y
O12iXaMrFZt8GblxiCzzBC317WrrusV1qwLqvEdnS2HuXdeymDjHb00v8YxDOJMN
sd/R1FaP+ypCp3JoSXAD9DPUUn8axv7evHQcNm3nAS2MpHg72Y7b1PvlV25jJRQQ
LVazdJxPy5luHHZ/3H36SikU24FD7i5xAbiN8445fk4Of0B3KZM4Cx3BJ0aIUpE7
GhXvxglzYa81F0RpTaxq
=QmRK
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
