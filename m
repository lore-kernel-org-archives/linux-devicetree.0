From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support of hi6220
Date: Fri, 20 Nov 2015 09:34:13 -0600
Message-ID: <871tbkelca.fsf@saruman.tx.rr.com>
References: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org> <87ziy9erpi.fsf@saruman.tx.rr.com> <2B3535C5ECE8B5419E3ECBE30077290901DC3D9462@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2B3535C5ECE8B5419E3ECBE30077290901DC3D9462-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <john.youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> On 11/19/2015 11:04 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
>>> Support hisilicon,hi6220-usb for HiKey board
>>>
>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>=20
>> doesn't apply:
>>=20
>> Applying: usb: dwc2: add support of hi6220
>> error: drivers/usb/dwc2/platform.c: does not match index
>> Patch failed at 0001 usb: dwc2: add support of hi6220
>> The copy of the patch that failed is found in: workspace/linux/.git/reba=
se-apply/patch
>> When you have resolved this problem, run "git am --continue".
>> If you prefer to skip this patch, run "git am --skip" instead.
>> To restore the original branch and stop patching, run "git am --abort".
>>=20
>> Care to rebase on my testing/next and also collect John's and Rob's ack ?
>>=20
>
>
> That's weird. I just sync'd to your testing/next and it seems to
> apply fine.
>
> Same with the series from Gregory Herrero.
>
> Any chance it's something to do with your local repo?

odd. Seems like it works if I apply manually with git am, but fails if I
pipe message from emacs to git am. Oh well, let me try again.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWTz12AAoJEIaOsuA1yqREvP8QAIimqIbZ/Wf0CwEngy+I9yKF
Bp5pbNQyhNACTwc5hOVY4FWsUBKYgvIV53RQvmqVd8xyMtYbvX1P6YsoR5MGpma/
iO3aCXGsQxlMvXXJlG6+TLIskqffVYCzIEIlvYnjQyuH7+9PETCPKjLjVW9YrokG
99DyPgtTLzR+QB7b6uOuGzYmI6znHopOW2jDAC2rh92uSvoYEj29azJYeMxqIsIk
8BS/IF08Q/jaT3t1jB0wwtEawYSKp+voGIhNhlCMJg4EUX6syKa8gcTaTWIPH7S/
+sy1ZLynD0TSoNrQ+G1abUmNJ66e+4xD8yQn22ilp7IjTyvIZB3QPkL1ZgmCJT8k
nFiyzqmmfusV33m4fFha5uMdz+AGs/AkjjWhJc0hb/gFrvoo02HJXw17pS7KUcA4
Gba0CgfXunKMXKYBuFvwxo0xeBtwM3mmnsPBoZH8tuJ7IhNfKoopXmmQ7qmfciRW
RQhXlQLYix1WezW4ksmxocNPbphRP5nxF6DNILQqKpVe0cwjKlm5sbFfBQG8dDNt
e3RJFATU6sfy977FOYErUXDGeMSYU8/n3D6pNn8CG02Cc/kvbnGkWNDVjl1M4png
GCy5cNVCT0GmDXBGhMptm6Tt8u0vBoLVkAJSLUrIHZT1/xcbPhAA5S6P1CS02bU+
8KYdzl2qo6PLsNt8Y6yY
=rcPd
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
