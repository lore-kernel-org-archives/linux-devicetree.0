From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: sunxi-ccu: Add compatibles for sun5i
 CCU driver
Date: Thu, 10 Aug 2017 21:51:34 -0500
Message-ID: <20170811025134.ee4v2tbol2pjcd4i@rob-hp-laptop>
References: <20170808012540.16691-1-net147@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170808012540.16691-1-net147@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Jonathan Liu <net147@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, Aug 08, 2017 at 11:25:40AM +1000, Jonathan Liu wrote:
> The bindings were not updated when the sun5i CCU driver was added in
> commit 5e73761786d6 ("clk: sunxi-ng: Add sun5i CCU driver").
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
