From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v9 04/27] ARM: davinci: pass clock as parameter to
 davinci_timer_init()
Date: Tue, 1 May 2018 19:39:56 +0530
Message-ID: <29a9a03c-93f5-dddf-2a6e-da7fd83e0c4f@ti.com>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-5-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180427001745.4116-5-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 27 April 2018 05:47 AM, David Lechner wrote:
> This changes davinci_timer_init() so that we pass the clock as a
> parameter instead of using clk_get(). This is done in preparation
> for converting to the common clock framework.
> 
> It removes the requirement that we have to have a clock with con_id
> of "timer0", which will be good for DT bindings since clock-names =
> "timer0" doesn't really make sense.
> 
> Also, drop use of extern in header file since we are touching the
> definition.
> 
> Signed-off-by: David Lechner <david@lechnology.com>

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
