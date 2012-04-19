From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 2/4] clk: remove trailing whitespace from clk.h
Date: Thu, 19 Apr 2012 13:06:18 -0700
Message-ID: <CAJOA=zOGbttJwSs5n9LZQCjFzJMFZomP0CmzS3PZK0nayCy+Bw@mail.gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com> <1334003101-17274-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1334003101-17274-3-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 9, 2012 at 1:24 PM, Rob Herring <robherring2@gmail.com> wro=
te:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Remove trailing whitespace from 2 lines.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Hi Rob,

You asked me to take this patch in the mail thread for the first patch
in this series.  The code being touched here is really Russell's
territory but the change is trivial so I'll take it into my -next
branch.

Regards,
Mike

> ---
> =A0include/linux/clk.h | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index b025272..e08bff1 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -220,7 +220,7 @@ void clk_put(struct clk *clk);
> =A0* Returns rounded clock rate in Hz, or negative errno.
> =A0*/
> =A0long clk_round_rate(struct clk *clk, unsigned long rate);
> -
> +
> =A0/**
> =A0* clk_set_rate - set the clock rate for a clock source
> =A0* @clk: clock source
> @@ -229,7 +229,7 @@ long clk_round_rate(struct clk *clk, unsigned lon=
g rate);
> =A0* Returns success (0) or negative errno.
> =A0*/
> =A0int clk_set_rate(struct clk *clk, unsigned long rate);
> -
> +
> =A0/**
> =A0* clk_set_parent - set the parent clock source for this clock
> =A0* @clk: clock source
> --
> 1.7.5.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
