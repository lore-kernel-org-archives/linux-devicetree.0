From: Eric Anholt <eric@anholt.net>
Subject: Re: bcm2835 (Raspberry Pi) KMS driver
Date: Mon, 12 Oct 2015 13:53:28 -0700
Message-ID: <8737xf6c6v.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
 <561A587D.6020009@lategoodbye.de> <561C1A67.1060803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1955318695=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <561C1A67.1060803@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>, Stefan Wahren <info@lategoodbye.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1955318695==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 10/11/2015 06:39 AM, Stefan Wahren wrote:
>> Am 09.10.2015 um 23:27 schrieb Eric Anholt:
>>> This is a respin of the Raspberry Pi KMS series.  Now that we've got a
>>> real clock driver, I can actually set new video modes.  Also in this
>>> version, most of the custom DT stuff from before is gone, thanks to
>>> finding exynos's platform_driver component matching code (I have sent
>>> separate patches to drivers/base to make helpers for doing it).
>>>
>>> https://github.com/anholt/linux/tree/vc4-kms-squash-2
>>
>> I want to point out that git format-patch could prepare a nice cover
>> letter and usually the changelog should go there.
>
> Well, I guess you could put it there, but that wouldn't remove the need=20
> to put the changelog in the individual patches too, so that reviewers=20
> don't have to switch back and forth between different messages just to=20
> find out what changed in each patch.
>
> +1 on sending the cover letter using git format-patch/send-email=20
> thoughl; the threading here is a little odd.

I was using git send-email --compose.  I guess I'll play with
format-patch --cover-letter, but it seems odd that threading would be
any different between the two.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWHB3IAAoJELXWKTbR/J7o0W8QAKlgt8YMeMalMfOqiBRo8ITd
BqkDE0rqihoT1Emz2DEH03d9qYw6c7nPNu4y6VbnNzztoHallntfTM/dzWW8o4Wv
APbBZuNf6XAkO/fDNbDtxtSKM76/qruY5JrJftrvZoPblUa1raGGdPkfWzlPDaIw
9UA1l+i9vKHcDJUUZ9uDKa9zzSLOgKg7jfmHgmzU6MWfzlAhvoHJ+Ro4B7K7Gj+P
tm/F9MhQKZ7zdPs5+xxcZnCuHxcdZz73MCniwp98ygvtzP+F7PlHBbXFJMF1EVYX
12JLz+tl6n+yBIoGBvm6o4OtdOpUu6eKN7vQS27Xso/iDwtsLBDiPT5Gd0F5haxc
SQqfCfwzv21rNZbCYY+ewPN5769azb7HYMzFiVddzFnrKom5FWnefZGIwwZAVc/7
46waAF0rceJ+1DgVGVnUYUKGAgVKa89+t7NnjINhnNa7AdM8X5ytSnd4vv+M2dF9
RD+xGlWdLv7uv713Tq8YdsLU1ukDSDbuJZEwo0fftTGU/L33tLMKvgVWNwUeCHOs
P+enGHgw7w25Ng4WaNo6+ajmsAr0jJIoYAPTS1vn3ZL9FdKUGyrbjGgphy9YBaCT
oDRx3wWObs8NRuJjpkDh0EydqORAxYSu9jYmLTJuz1Y27S/6KXfF7K+QjLluydep
DR6UFWzAZW/0r4Ll5052
=HHU/
-----END PGP SIGNATURE-----
--=-=-=--

--===============1955318695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1955318695==--
