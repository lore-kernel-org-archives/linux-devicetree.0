From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/msm: remove qcom,
	gpu-pwrlevels bindings
Date: Mon, 30 Jan 2017 10:21:34 -0800
Message-ID: <87vaswh0i9.fsf@eliezer.anholt.net>
References: <20170130164921.20744-1-robdclark@gmail.com>
 <20170130164921.20744-2-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0837529669=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170130164921.20744-2-robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============0837529669==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> The plan is to use the OPP bindings.  For now, remove the documentation
> for qcom,gpu-pwrlevels, and make the driver fall back to a safe low
> clock if the node is not present.
>
> Note that no upstream dtb use this node.  For now we keep compatibility
> with this node to avoid breaking compatibility with downstream android
> dt files.
>
> Signed-off-by: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Will we need the bus frequency knobs that I see in the old pwrlevels
node?  If so, what would the plan be for doing that within OPP?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAliPhC4ACgkQtdYpNtH8
nuhcjhAAlnql349pezsE2Nm/Cd6nd5LOxq+wSBxvgL0DrKkPvC2XuUvHvzJMgunl
cBdORp0t995FmLnOxlphblgMcoj4ku3dQz2B0jzBjZJHKf5vlzyYFZmCKouXlo8V
CIMwLb0VHzLVUfJOZ83iA/lHEn6qCy0sgzXGACY6eRFNCC9y6bWaiJh/XnzAIb2P
33emKrmXrEQReHh7C7LbW+wE9/nRySyxL1u2q5cDFIX1HnMEsjWPT5IUT9nr/t7U
VFXShG2ZBzcfU5Q/4+Yx9apSaMyU5j48K+WU+5HbELhljePlmNw2hegyHLnFAR2O
Pfv6BZRA/XmKmxac1yK9GL1t+RKlP4Ej5H/pYjytyvsvGvd4rPco/+02o+6Y9ztX
Ucpmito5zz0zJClUXLsNKxF8pN/Sy9oT0GQB5/hQk6Z7TgndK3Lgi2rQrzICMuMZ
Nlpv2RadZ2vGp60D1wzdTTeQjKtuv/UBlFj9Z3yOST6BybyWBHwfWuRzVg0qNQ9T
Cn8h39lWdTMNO9noaitWgKOAA/2UzNdipsiAz03+VSNywJ/bMFLNdVMmxBNo8Lyt
wu0LxKl62/x0alQzpNhryPzBoOn3jR5TCZT6JkzkM/ELfESowWL9JW6f7PCW2dcS
LuU5B3BevciTbrdZ9nc1Sr05YH/8VeJ/4mrvKGLxdSkN6LqkDjU=
=jb3y
-----END PGP SIGNATURE-----
--=-=-=--

--===============0837529669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5vCg==

--===============0837529669==--
