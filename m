Return-Path: <SRS0=HSAE=TV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727990AbfEUSyV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 May 2019 14:54:21 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190506210854.24300-1-tony@atomide.com>
References: <20190506210854.24300-1-tony@atomide.com>
Subject: Re: [PATCH] clk: ti: clkctrl: Fix clkdm_clk handling
From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 21 May 2019 11:54:19 -0700
Message-Id: <20190521185420.745FF2173C@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Tony Lindgren (2019-05-06 14:08:54)
> We need to always call clkdm_clk_enable() and clkdm_clk_disable() even
> the clkctrl clock(s) enabled for the domain do not have any gate register
> bits. Otherwise clockdomains may never get enabled except when devices get
> probed with the legacy "ti,hwmods" devicetree property.
>=20
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied to clk-fixes
