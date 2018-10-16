From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] clk: ingenic: Add proper Kconfig entries
Date: Tue, 16 Oct 2018 15:19:59 -0700
Message-ID: <153972839968.5275.2414421944664071492@swboyd.mtv.corp.google.com>
References: <20180823131744.744-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180823131744.744-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Quoting Paul Cercueil (2018-08-23 06:17:41)
> Previously, the CGU code corresponding to the SoC for which we're
> compiling the kernel was the only one enabled, which made it impossible
> to build one kernel that supports them all.
> =

> Now, it is possible to select more than one SoC to support.
> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
