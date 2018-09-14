From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 02/16] dt-bindings: display: renesas: lvds: Document
 r8a77990 bindings
Date: Fri, 14 Sep 2018 09:57:11 +0200
Message-ID: <20180914075711.GJ11509@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-3-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0727628071=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180904121027.24031-3-laurent.pinchart+renesas@ideasonboard.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org


--===============0727628071==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3W6riq+uV6J42Ub"
Content-Disposition: inline


--u3W6riq+uV6J42Ub
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Sep 04, 2018 at 03:10:13PM +0300, Laurent Pinchart wrote:
> The E3 (r8a77990) supports two LVDS channels. Extend the binding to
> support them.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> index 5a4e379bb414..13af7e2ac7e8 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -15,6 +15,7 @@ Required properties:
>    - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
>    - "renesas,r8a77970-lvds" for R8A77970 (R-Car V3M) compatible LVDS encoders
>    - "renesas,r8a77980-lvds" for R8A77980 (R-Car V3H) compatible LVDS encoders
> +  - "renesas,r8a77990-lvds" for R8A77990 (R-Car E3) compatible LVDS encoders
>    - "renesas,r8a77995-lvds" for R8A77995 (R-Car D3) compatible LVDS encoders
>
>  - reg: Base address and length for the memory-mapped registers
> --
> Regards,
>
Thanks,

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> Laurent Pinchart
>

--u3W6riq+uV6J42Ub
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbm2nXAAoJEHI0Bo8WoVY8LxkP/i05SUXlCrraWDiSpTvM71Ss
m09cOwIMX05YMXrPCXSyeR4N11jfvw64DnVjBpQ+tJTjNiSCNKipUBNDmsJX4tQj
cCkWJRut6vMrSFnO1r/yRHj9zcm6mudqX/G/jkyV7/61qr8/aDMcjH+EMZ/usZan
WxEwEpXmbZ5s/UEt61A1g7UkAMZRF5Sdr3XumlN8g9k3Caq+IAixqsa9C7gITGZj
u7jcSCRvjkaZ3k2KiboSdhJTwVcNoAT+qPNSiAWu28/6ETcmJ2ey0CrG/GF7YZBN
jInmsaurmwR4snogIzr8P10YqLd//teNMwGdPQKYanVgjk9xK7IaayvBDYW3UR4K
a2Wrph+nKjTaQ45zimTcK65aSyGrrfntOI3PegUpn3hoXiFiHmTmTePbMj3hpHw1
syEap3ko/K8iETQZwiub0maHNMCK1wT/9iC8/8YrtI3t/d0gQuwDDjRLA3WXdJ1M
5ylMHoCrUqGFtj37ApL1lykN7g1LE6cnWmjv9HhD05y0YuRkKiea0AQi6noKcXZc
qzkL5Sm+tNzjKrXR6j/CTc9KkH0sG+4jydSXzzw2PLbv6IgzFobOQd2qbZFagK8u
7a7zwtKXdZ63E2aPMn3Fj3YcA1shnnKVVnp9PcgYHgXeh/HgodLQG/LPRBaoIPQC
XCI2p8rP5ZnWSjpomdwK
=AiFR
-----END PGP SIGNATURE-----

--u3W6riq+uV6J42Ub--

--===============0727628071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0727628071==--
