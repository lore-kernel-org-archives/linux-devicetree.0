Return-Path: <SRS0=gQZM=UF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfFFSTk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 6 Jun 2019 14:19:40 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
References: <20190530065557.42741-1-tony@atomide.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
Date: Thu, 06 Jun 2019 11:19:39 -0700
Message-Id: <20190606181940.33DC72083D@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
List-ID: <devicetree@vger.kernel.org>

Quoting Tony Lindgren (2019-05-29 23:55:57)
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
>=20
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
>=20
> Let's fix this by setting a found flag only when we find a match.
>=20
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes
