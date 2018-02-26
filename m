From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: bcm2835-rpi-zero-w: Enable OTG mode
Date: Mon, 26 Feb 2018 15:32:27 -0800
Message-ID: <87inajjpis.fsf@anholt.net>
References: <1519480028-26430-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6019371887213542775=="
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1519480028-26430-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============6019371887213542775==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Since commit 9273083a1530 ("usb: dwc2: Fix TxFIFOn sizes and total TxFIFO
> size issues") we could use the OTG mode again.
>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>

Applied to bcm2835-dt-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqUmQsACgkQtdYpNtH8
nuiJqA/+PmMzsvhNKBaQ+Kl/FALnNQ3xsCAwPs51msx74lvn9GdPtSDDtbKmuA1i
vtO2ixd8HQ6JaI0L4Vkf/apNj98kAJ9XxGjVwjCnQRmtEntNCT84+Zg5BfMiqj9y
+NA1YnwryaDcZC7Rc7BTL/BFEZOevvrh0aDuGEebN1rCzjOt6EbGXDmAccUv2jwe
BcrmKcRg4XB6jDtALoHTvbqBtLvi0WkoePoGEgbxIMAxGBLdeD+yDVpfvontQmX0
2OOzbhkGJTZUpWCB0lEmPpl2aQjNRt0ukfvMMUb3hyck4yYrPCTT04y81GeVkM+T
fi8kst7UXHbT0Y+lsy3m77YmyduR8ksgwI+GdSNWi/r16zn/1P8v8enlXy1cnKOr
36lA/c124xmUfu42x/p0We+YiXMlm4LAqgu92XXe3Ew/aNgKecbdYIM/PlqKdWim
V8GCYD5sxSxr84u+TlriVCqhwiZ3tUghWkogdRFkTHgQRdgpdE0TDzp0DB5tp28+
hBxOUnzV4gPqYS8eyr+ky217t5M6eIkivCH+mFW78HQRpY+PhrIA8rfbwzmZc7EM
JyFbB83YekwhEfWK3SbLt7LuaD0vf0/GVbqqfXZsxO57adaBcVz67Tn+LnMN7XuI
yOWHjJJZO9d1vCn8wo9FHxoJb26UeS2MuYKLp+a8Z/o6NZiGFpw=
=us0Y
-----END PGP SIGNATURE-----
--=-=-=--


--===============6019371887213542775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-rpi-kernel mailing list
linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel

--===============6019371887213542775==--
