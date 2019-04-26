Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190423095107.21091-1-gregory.clement@bootlin.com>
References: <20190423095107.21091-1-gregory.clement@bootlin.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH resend v5 0/6] Add CPU clock support for Armada 7K/8K
Message-ID: <155623961445.15276.6825857823781902623@swboyd.mtv.corp.google.com>
Date: Thu, 25 Apr 2019 17:46:54 -0700
To: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Gregory CLEMENT (2019-04-23 02:51:01)
> Hello,
>=20
> [resent because I used an old non worlking email for Stephen Boyd]
>=20
> This is the fifth version of a series allowing to manage the cpu clock
> for Armada 7K/8K. The third version was sent more than 3 months
> without any relevant feedback since this end of december last year.
>=20
> For these SoCs, the CPUs share the same clock by cluster, so actually
> the clock management is done at cluster level.
>=20
> As for the other Armada 7K/8K clocks it is possible to have multiple
> AP so here again we need to have unique name: the purpose of the second
> patch is to share a common code which will be used in 3 drivers.
>=20
> The last 2 patch enable the driver at dt and platform level and will
> be applied through the mvebu subsystem.

Has anything changed since this was sent as v2? My scripts aren't
showing any change.

>=20
> Changelog v4->v5:
>=20
>  - As requested by the device tree maintainer make the reg property
>    mandatory
>=20
>  - Updated the device tree files accordingly with the new binding
>=20
> Changelog v3->v4:
>  - Rebased on v5.1-rc1
>  - Mention in the binding that a reg property can be used to make the
>    device tree maintainer happy in the hope that there will be finally
>    a review on this patch blocking the whole series.
>=20

But this says things happened. I'm still waiting for Rob to ack the
binding and I seem to recall that it was incorrect? I'll have to dig
through the archives.
