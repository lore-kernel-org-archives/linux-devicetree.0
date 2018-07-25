From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 15/15] clk: pistachio: Fix wrong SDHost card speed
Date: Wed, 25 Jul 2018 16:43:30 -0700
Message-ID: <153256221029.48062.5074371246522411479@swboyd.mtv.corp.google.com>
References: <20180722212010.3979-1-afaerber@suse.de>
 <20180722212010.3979-16-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722212010.3979-16-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, Govindraj Raja <Govindraj.Raja@imgtec.com>, =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Andreas F=C3=A4rber (2018-07-22 14:20:10)
> From: Govindraj Raja <Govindraj.Raja@imgtec.com>
> =

> The SDHost currently clocks the card 4x slower than it
> should do, because there is a fixed divide by 4 in the
> sdhost wrapper that is not present in the clock tree.
> To model this, add a fixed divide by 4 clock node in
> the SDHost clock path.
> =

> This will ensure the right clock frequency is selected when
> the mmc driver tries to configure frequency on card insert.
> =

> Signed-off-by: Govindraj Raja <Govindraj.Raja@imgtec.com>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
