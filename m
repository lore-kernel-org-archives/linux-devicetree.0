Return-Path: <SRS0=ySGx=QB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38943 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfAYO5q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Jan 2019 09:57:46 -0500
Date: Fri, 25 Jan 2019 15:57:42 +0100
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 0/4] add Tegra210 BPMP driver
Message-ID: <20190125145742.GF22565@ulmo>
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline
In-Reply-To: <1548349435-1086-1-git-send-email-talho@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: Timo Alho <talho@nvidia.com>
Cc: jonathanh@nvidia.com, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 24, 2019 at 07:03:51PM +0200, Timo Alho wrote:
> Hi,
>=20
> This is a third version of "add Tegra210 BPMP driver" series. In additIt
> incorporates the review feedback received from Jon Hunter for patches
> 2, 3, and 4.
>=20
> This series adds a driver for Tegra210 BPMP firmware. The BPMP is a
> specific processor in Tegra210 chip, which runs firmware for assisting
> in entering deep low power states (suspend to ram), and offloading
> DRAM memory clock scaling on some platforms.
>=20
> The series consist of first refactoring the existing BPMP driver by
> first renaming the terminology used for communication, then splitting
> out the Tegra186 chip specific parts, and finally adding the needed
> functionality for Tegra210.
>=20
> Timo Alho (4):
>   firmware: tegra: reword messaging terminology
>   firmware: tegra: refactor bpmp driver
>   firmware: tegra: add bpmp driver for Tegra210
>   dt-bindings: firmware: Add bindings for Tegra210 BPMP

Patches 1-3 applied to for-5.1/firmware and patch 4 applied to
for-5.1/dt-bindings, thanks.

I did apply some last-minute bike shedding (s/bpmp/BPMP/, make ops
structure pointers const, spelled out req -> request and resp ->
response, ...). I also renamed the bpmp-tXYZ.c files to bpmp-tegraXYZ
for consistency with other drivers.

Thierry

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxLI+MACgkQ3SOs138+
s6EnFg//b8HY6GreNtjhBmA19LKa/IZy1vUh0WJua4V4ZGUU8reTSi8lkg3av/7h
Rypm6kITF9wu1GeQ+tzKSL3wfeTc5JHs7TAzEPDufsG5R3jhIBTyBBU76TtfRc0T
AHDdON2Nw1ZBhXX8aGyR34xN2/Wg3f2yxrwKcinY3DrJRGpqkoUKx6WPj3Acouqe
8+hQOJ4c/1sr2NmICKCYVOGE6cmQFFjaJMNrZa+1k8GVicUL606SbbkEJG9IdNUL
TQIJR2TquowIqjZcTJ6judzHZYLulYHnl7Pauh9UmbgT4fBxhBHwbqzAhRijr9K8
CgMvDCwjBqB/RWa1ge26bymSfqJkmkoacjiMQCpXQvxOoXMeOLG6OFEEGPrgbw0D
T2ziX3b+s7lBXQQqyAzwt7ubW3hu7ir1Ew6zA911JzrTNWTSwH7SpzgNNrGGK6/j
i3DCPVE+VpehYWNlCGEPpx3UfLBfoTBBpbJ3wk0w8AOEVCjKz4uDyxCsurCyyvVi
cwUiK5jZOI6NjRTM6NtSn5d+QaO+lsdFyICevKo7IeOhdIs8oYX5ckT78ciwLhKO
0J42dxAwe7R5BeRigvYcIggN8Ol587AiBIqb4A41Z8znmPt+rJowCH2HeA5W/Fm6
9BnPhcjoPAJkGLscvu2FVdGih5iQhXUCNfd3aL8TgdNBH1vCU0Q=
=6haZ
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
