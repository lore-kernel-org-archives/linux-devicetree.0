From: Jan Kotas <jank@cadence.com>
Subject: Re: [PATCH 0/3] media: Add support for Cadence CSI2RX version 2.1
Date: Thu, 1 Aug 2019 07:36:59 +0000
Message-ID: <A00C1136-41F2-4EB9-8694-E33608EF82E9@global.cadence.com>
References: <20190725102648.13445-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725102648.13445-1-jank@cadence.com>
Content-Language: en-US
Content-ID: <6DDE71B775928144BE683B781BA897E5@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rafal Ciepiela <rafalc@cadence.com>, linux-media <linux-media@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org


> On 25 Jul 2019, at 12:26, Jan Kotas <jank@cadence.com> wrote:
>=20
> This patchset adds support for Cadence CSI2RX controller version 2.1.
> It currently limits maximum amount of data lanes to 4.
> Existing compatibility with v1.3 is maintained.
>=20
> Jan Kotas (3):
>  media: dt-bindings: Update bindings for Cadence CSI2RX version 2.1
>  media: Add lane checks for Cadence CSI2RX
>  media: Add support for Cadence CSI2RX 2.1
>=20
> .../devicetree/bindings/media/cdns,csi2rx.txt      |   4 +-
> drivers/media/platform/cadence/cdns-csi2rx.c       | 150 ++++++++++++++++=
+----
> 2 files changed, 129 insertions(+), 25 deletions(-)
>=20
> --=20
> 2.15.0
>=20


Gentle ping.

Regards,
Jan=
