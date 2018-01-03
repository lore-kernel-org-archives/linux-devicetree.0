From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: ingenic: Add DT bindings for TCU
 clocks
Date: Wed, 3 Jan 2018 14:49:31 -0600
Message-ID: <20180103204931.lqw3j35kfnqivsab@rob-hp-laptop>
References: <20171229125942.27305-2-paul@crapouillou.net>
 <20180101143344.2099-1-paul@crapouillou.net>
 <20180101143344.2099-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180101143344.2099-2-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 01, 2018 at 03:33:40PM +0100, Paul Cercueil wrote:
> This header provides clock numbers for the ingenic,tcu
> DT binding.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/dt-bindings/clock/ingenic,tcu.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/clock/ingenic,tcu.h
> 
>  v2: Use SPDX identifier for the license

Reviewed-by: Rob Herring <robh@kernel.org>

