From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Fri, 16 Jun 2017 07:43:52 -0700
Message-ID: <871sqkouvr.fsf@eliezer.anholt.net>
References: <20170615204130.19255-1-eric@anholt.net>
 <20170615204130.19255-2-eric@anholt.net>
 <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0173012243=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <777ee1b1-e5ce-ea29-8a48-f792354a22d1@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--===============0173012243==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Archit Taneja <architt@codeaurora.org> writes:

> On 06/16/2017 02:11 AM, Eric Anholt wrote:
>> If the panel-bridge is being set up after the drm_mode_config_reset(),
>> then the connector's state would never get initialized, and we'd
>> dereference the NULL in the hotplug path.  We also need to register
>> the connector, so that userspace can get at it.
>>=20
>
> Shouldn't the KMS driver make sure the panel-bridge is set up before
> drm_mode_config_reset? Is it the case when we're inserting the
> panel-bridge driver as a module?
>
>
> All the connectors that have been added are registered automatically
> when drm_dev_register() is called by the KMS driver. Registering a
> connector in the middle of setting up our driver is prone to race
> conditions if the userspace decides to use them immediately.

Yeah, this is fixing initializing panel_bridge at DSI host_attach time,
which in the case of a panel module that creates the DSI device
(adv7533-style, like you said I should use as a reference) will be after
drm_mode_config_reset() and drm_dev_register().

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAllD7qgACgkQtdYpNtH8
nuh12hAAtxtxVUCKAiczE4dENEjJAiemAFSkWhvTsOQOi12aUHBOvMn/jojekhSL
P+XDg8uBd9ryGQh7hNo0uMkzWD6ps75C0mZpykkuz7Fho6b48VCKv0cFCxVHJu5o
3s7kmxth/v73Qedn98XIMgnfqBJv8xSodii4J1HTBBvOTXTVy28Vzm4QCfZ+Ow5M
qGcgdT0u/zlI+Q21VZdk4wpLEmsyp9RNyrzFjGrb+uX4Mv46eLnBdw29NZbqOODU
8LAvMSPWmttfbN8NHFjojffFpiEKld3QWuoG1Xa7LeC4MT7HNfjoQzj98r0mw1zX
QP2FY+v8HYBvuyUrbWtS9GMPcqW/TXtBIWN+0YZ1IX4HpY5RinyZufPzL7rR8aWo
o6fsa+OAgKjXz8QJbqEcL1hZOaOUKTopWiKpXFgBaYYXoFdgrmCWOL0mh9LQYKMc
1+UZovu/RepCIO1Qq5vUz3TDKsl48WQVG+v8qEHVKh7MdfSVWhLt0urYvo5NXCmX
uOZ2pRzqOO5Zxhumm1OCyv+G6uQlVXcP2655U6sq1uaHdiIYw0qqEgZk3lo56Xjk
B6EHR9TrPUs/CCRFAoSz+0QVCJ0PkQ5GH+qoaayxE8vLJeGhIUD6KZdbNqJYDADm
H+0WGm/qbxJDzQtXbc1nceuKjZLutboDw7fEkwEaxfEnuZlaAxE=
=M+WK
-----END PGP SIGNATURE-----
--=-=-=--

--===============0173012243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0173012243==--
