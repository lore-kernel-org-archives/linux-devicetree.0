From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
Date: Thu, 3 Nov 2016 12:24:06 +0200
Message-ID: <8b4504e5-7503-596c-377b-ddce0b7c5166@ti.com>
References: <cover.1478103726.git.jsarha@ti.com>
 <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1934942460=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: bcousson@baylibre.com, khilman@baylibre.com, bgolaszewski@baylibre.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

--===============1934942460==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="6SAQ8wCbGrdjuPknTj3AMOGhtXoGFPAtd"

--6SAQ8wCbGrdjuPknTj3AMOGhtXoGFPAtd
Content-Type: multipart/mixed; boundary="Llg8Eg48WpbsgBbx9PAHg664qJ3qNvQQK";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 robdclark@gmail.com, bgolaszewski@baylibre.com, khilman@baylibre.com,
 bcousson@baylibre.com
Message-ID: <8b4504e5-7503-596c-377b-ddce0b7c5166@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
References: <cover.1478103726.git.jsarha@ti.com>
 <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>
In-Reply-To: <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>

--Llg8Eg48WpbsgBbx9PAHg664qJ3qNvQQK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/11/16 18:32, Jyri Sarha wrote:
> Add very basic ti-ftp410 HDMI transmitter driver. The only feature

It's DVI encoder, not HDMI.

 Tomi


--Llg8Eg48WpbsgBbx9PAHg664qJ3qNvQQK--

--6SAQ8wCbGrdjuPknTj3AMOGhtXoGFPAtd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYGxBGAAoJEPo9qoy8lh71qDAQAIglakQXUJdj0QclTGHHXZDw
HPwFHMoU4FabiIEdps1x1N9+H41g+aHG69bmzDqi5M+XwUDCTRM+6sFOes4IthqQ
8AbcAEjabM01xiH6Y8C3Kg3KGQztP/448iJF7utzCcFlbk2pYgBoux9u+VvuVfbE
7aLkeVuMT3Xyx0/lFaOBb//71JLObBNTivOpZkQUHW6chgCezA3SgOSezwtgYDIU
fqv5NlRILOo4XwUDOX75DrCyZV4/yQp2GTYjiwftuyh1OKmLJwNkqVrsQKWAKAaQ
qHtfRITT/2AsOkDagAUfPCeXpAVKz3VMTf2NQoYCMWN+q7EtHU9aNviZOBS7Cbk1
XomopBWhhcsrsB9wXeOQk/QMu/YZ+b+Wkz7vO20I9N9Hikm+DQvcCAWoIjWSbhUQ
D0ScWbWQ8Xc3+BjNXU+ySraVXzL/p91KzeHmwY9+mH2p70l4foiwmbMCU25FF1nS
C7hyL3VEsWUATJZZ6kSCO387YA/q+qspyfAFd44bbpWfPq9SALLfIB889woK9Lc6
ZPXdwe6iZFGQxpH3TF9cdC1U+7u1Rpzjw4bD7X6z5HPLuq3FBkoolg3kmePE9DSk
2lDmg4Gl84sCmofxoBNa1GV8GL0pZso0VLdnHKzUvaNjCCHMZhXyPqx4sIxuBmKd
iT7W1+Nm7CO7RsGSPwmp
=tky+
-----END PGP SIGNATURE-----

--6SAQ8wCbGrdjuPknTj3AMOGhtXoGFPAtd--

--===============1934942460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1934942460==--
