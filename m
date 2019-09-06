Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au> <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
Date: Fri, 06 Sep 2019 10:31:45 -0700
Message-Id: <20190906173146.0BFDA206A1@mail.kernel.org>
To: Phil Reid <preid@electromag.com.au>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Phil Reid (2019-08-05 01:26:41)
> On 28/06/2019 11:19, Phil Reid wrote:
> > The cdce925 power supplies could be controllable on some platforms.
> > Enable them before communicating with the cdce925.
> >=20
> > Changes from V1
> > - Add devicetree updates
> >=20
> >=20
> > Phil Reid (2):
> >    dt-bindings: clock: cdce925: Add regulator documentation
> >    clk: clk-cdce925: Add regulator support
> >=20
> >   .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
> >   drivers/clk/clk-cdce925.c                          | 34 +++++++++++++=
+++++++++
> >   2 files changed, 38 insertions(+)
> >=20
>=20
> Any more feedback on this series?
>=20

Don't think so. Thanks!
