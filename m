From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2] clk: fixed-factor: add optional dt-binding clock-flags
Date: Tue, 28 Jun 2016 14:18:40 -0700
Message-ID: <146714872010.89261.1969853552594659808@resonance>
References: <20160621005910.GN1521@codeaurora.org>
 <1466741572-58802-1-git-send-email-neidhard.kim@lge.com>
 <20160628205518.GF3737@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160628205518.GF3737@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Jongsung Kim <neidhard.kim@lge.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chanho Min <chanho.min@lge.com>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2016-06-28 13:55:18)
> On Fri, Jun 24, 2016 at 01:12:52PM +0900, Jongsung Kim wrote:
> > There is no way to set additional flags for a DT-initialized fixed-
> > factor-clock, and it can be problematic i.e., when the clock rate
> > needs to be changed. [1][2]
> > 
> > This patch introduces an optional dt-binding named "clock-flags" to
> > be used for passing any needed flags from dts.
> 
> I don't think we want this in DT. If we did, the flags would need some 
> documentation about what the flags mean.

Flags are specific to Linux implementation, so I agree with Rob. Better
to create a compatible string for your hardware that bakes in the flags.

Regards,
Mike

> 
> Rob
