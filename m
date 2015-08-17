From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Mon, 17 Aug 2015 11:30:14 -0700
Message-ID: <874mjxwyx5.fsf@eliezer.anholt.net>
References: <1439427380-2436-1-git-send-email-eric@anholt.net>
 <1439427380-2436-2-git-send-email-eric@anholt.net>
 <55CEC25E.7070303@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0425089777=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <55CEC25E.7070303@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--===============0425089777==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 08/12/2015 06:56 PM, Eric Anholt wrote:
>> Signed-off-by: Eric Anholt <eric@anholt.net>
>
> This one definitely needs a patch description, since someone might not
> know what a VC4 is, and "git log" won't show the text from the binding
> doc itself. I'd suggest adding the initial paragraph of the binding doc
> as the patch description, or more.
>
>> diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/gpu/brcm,bcm-vc4.txt

>> +- hvss:		List of references to HVS video scalers
>> +- encoders:	List of references to output encoders (HDMI, SDTV)
>
> Would it make sense to make all those nodes child node of the vc4
> object. That way, there's no need to have these lists of objects; they
> can be automatically built up as the DT is enumerated. I know that e.g.
> the NVIDIA Tegra host1x binding works this way, and I think it may have
> been inspired by other similar cases.

I've looked at tegra, and the component system used by msm appears to be
nicer than it.  To follow tegra's model, it looks like I need to build
this extra bus thing corresponding to host1x that is effectively the
drivers/base/component.c code, so that I can get at vc4's structure from
the component drivers.

> Of course, this is only appropriate if the HW modules really are
> logically children of the VC4 HW module. Perhaps they aren't. If they
> aren't though, I wonder what this "vc4" module actually represents in HW?

It's the subsystem, same as we use a subsystem node for msm, sti,
rockchip, imx, and exynos.  This appears to be the common model of how
the collection of graphics-related components is represented in the DT.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJV0ig3AAoJELXWKTbR/J7on3sQAIuqSQIicKD9Aq1CrHQnT6jT
fvP+nTKjD5UDqiOu0SwKh1OLlB9Qvg/uVW9bhbL269FTG6B3VnmMRNVcXQvc3blb
1wnG3Bj59xtc40qH3qLy1mVzqe+2RUOPLTsDRln1QEsX4M0CqusUEHzijPUxSVA9
KoIEz0KUVQDERVFgknwRR7OjrkQQGtph4rvmV7ms5gG4WMEMP4OHEphUJptckI74
9RGQb+EKCRdeYrm5gMFETiRcqrVTxGMVo7t/jjq5SEOsvQd7YEeWgfITs/kTJzda
Hj6LUYBQ3p5kHkNPwaLG0W2Jc2GRFGqa5QOlMqUdLtEnsxUb4GwVlrt6fFoN5F34
/XTEF4QIOvmft/Nj/xVz1zIkzolM7zNmLprz3PI71Z3kdbTsuNkHD1+eb/c654a/
c9GHlHApAd2ZLyoGaRql5DaClIsj4w1dZf9IOPT+457AkSItxV10JJ0m6tx1BqRH
BM2u5gmbwGXeVRYkktHvJ8OjMCPr7/c7h1moTa9tUV8tbHv/kyXnjHXEMyprz0mo
qVxY0CYrBXk0zBKj6BQzKAZOb90k5Mex/1/3T4HcEHQYh800GjLHW0VVtLfOpLq8
L1I3Z43b2jaXutQ2mCPLvG9vxasy399TotO11X0Wfmlg7O6K65Xw2TW1ogh65R8/
YRtj7IUNWUk3VNuNvXBl
=pFUQ
-----END PGP SIGNATURE-----
--=-=-=--

--===============0425089777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0425089777==--
