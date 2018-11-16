From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Fri, 16 Nov 2018 20:46:01 +0100
Message-ID: <20181116204601.4e1aa0de@kemnade.info>
References: <20181110232034.17277-1-andreas@kemnade.info>
        <20181111024648.7rt7rlhaqihtqecv@earth.universe>
        <20181112215812.18ebca35@aktux>
        <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
        <20181112222726.73m2oca7hankvcjs@earth.universe>
        <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
        <20181113170128.0f59ef0e@kemnade.info>
        <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mDijiKpFyv=Lgc7SNi0J1bT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Rob Herring <robh@kernel.org>, sebastian.reichel@collabora.com, hns@goldelico.com, devicetree@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/mDijiKpFyv=Lgc7SNi0J1bT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marcel,

On Wed, 14 Nov 2018 08:51:17 +0100
Marcel Holtmann <marcel@holtmann.org> wrote:
[...[
> Btw. I see nothing standing in the way of merging btuart.c driver and the=
n go from there. Either I dig this out and submit or someone else does.
>=20
Do you mean this?
https://patchwork.kernel.org/patch/10490651/

Regards,
Andreas

--Sig_/mDijiKpFyv=Lgc7SNi0J1bT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlvvHnkACgkQfb1qx03i
kyR9qQ/+K2Abq9GwLl4Jt232U9wItKWwkfDgv1TeqM4yNPupS994y4/CXOIz/58v
SWitIU1xIL88pIc7OpZXVNF4SZagQWn4m3krfmb9mN9TD8XeeT6bQmsB4p2/CsaA
PMzFZR6p3Lqa+ai81Emy6L/eaKYHmn1gOARrqamw8izO4ZL0LsOk8X3zf/tuv3/V
S9Dcsfym88tvjPTqzCESk4A+AXhH5G04otd0546zaugxu+snH9H+21rxxT+WRcEQ
0c5gok6G6ohwOlB+1i4SNO6qcgDH26OYoO5u/gn5TFQvbk1riXQunTwnfoaikLGk
rH6yBtuov3ZlHD0d3zl8H6I/cONeQKnBCKL7n5Z+x/buuSLr9//z99vX7ezxkJqm
nY3Ym2pZLZ1rOEgA+iRJ5f+IuOCmfGj0bhCtJrqPzwQ5SGIdIGcR57yuXbDBHHBM
MpPMLaZPyyVbLhnCRe3biRPU6kTASc2ENMHdru6WgtmEI5S5/8JDeS+1EqImCdyc
oYbuEqhC2RpypskKR2/bPcTlIILul1jF0Mt+kZ8GJbvKT8taUCUQ695W1zbzyyMz
IANeudeJZ2AGKG/zcDoNC8ynm8n0LdR4DNqvqobJ9SRSSokZq9jooBlW5Gn78wDa
fD60AggnsCuXdg38xlYt412IrzcCuZUoJcYMoDct/xKRB5d951o=
=++Bb
-----END PGP SIGNATURE-----

--Sig_/mDijiKpFyv=Lgc7SNi0J1bT--
