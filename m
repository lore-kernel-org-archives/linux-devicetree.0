From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: aspeed: Fix SDCLK name
Date: Fri, 06 Jul 2018 13:57:10 -0700
Message-ID: <153091063090.143105.8837363425750284918@swboyd.mtv.corp.google.com>
References: <1529978125-28712-1-git-send-email-mine260309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529978125-28712-1-git-send-email-mine260309@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Lei YU <mine260309@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lei YU (2018-06-25 18:55:25)
> The SDCLK was named SDCLKCLK, and no one has used this yet.
> Fix it.
> =

> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---

Applied to clk-next
