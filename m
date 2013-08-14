Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f53.google.com ([209.85.214.53]:49366 "EHLO
	mail-bk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760243Ab3HNVhH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 17:37:07 -0400
Date: Wed, 14 Aug 2013 23:37:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] ARM: tegra: add Mic Jack to Cardhu device tree
Message-ID: <20130814213700.GA21728@ulmo>
References: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org>
 <1376512027-28245-2-git-send-email-swarren@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <1376512027-28245-2-git-send-email-swarren@wwwdotorg.org>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 02:27:07PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> This enables the microphone input jack, and hence allows audio to be
> captured as well as played back.
>=20
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  arch/arm/boot/dts/tegra114-dalmore.dts | 4 +++-

The commit subject says Cardhu, but you modify the Dalmore DTS here.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC/h8AAoJEN0jrNd/PrOh2IkP/jtIvF3lXPBhPvXwG5/AHAGY
V3KpFXXd7XHgIMLZJFL5UN/Gih0cCsb01HEre3aJAKuEszvQXSWtjTD3PTT3HfEA
2yj8ZR6CI7Kg8mWSfc2rxPfcjwOam4hL+E8NjdgeLI5whduSyHmujl+Bp1BgKTy+
39gcKYZQqxhL1loIqGZDckwi3vkR2Ud00vrpZxoO1ODOsbws8jv/MbCUcJYRLtLq
bC5kdu+dbSlH1qxJ3QkQd1+Qh0WIZFAl61sV/bAtfIx2sD84USBy1LVOvai9kIgi
v6XB6wF4OogFB5kGQ83DkTHXPUkFw8Rad7W4FSli+wsjuiRPSGdcBzNiEIWFvnMW
ldqdyptTJmco9z4FP31kXFSd09IDIa6qHeMnjWC27Fct0ApOBjOXjLGq4tM0k1q8
rRG92tFpRhrLWHAUeFzr5Ix5o1UDbluTZ1RQXnK0HKlf8ouzyhl8fz4CvmvhhUy1
MNshCHi4apc0AhmwOqafrx805tMOpNXhwlaTFYSFeLFom/CyP/Jk4r90lNlO5rDX
PpFdbyyVVd94755PNvVUizj5SSGJG8D+37SzeYSdz6UCtTFgaDeHIhOR02kLKB5y
Ah89P6Th4l1tQz55NxyRR9oPzNwfxW2pxGKb/nu8wvpo1KGFdeaFnVcgSBww1Wfq
NKb8fq+T1oNjNhAJGxP6
=JiJE
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
