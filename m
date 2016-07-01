From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/7] mfd: ac100: Add device tree bindings for X-Powers
 AC100 codec/RTC combo IC
Date: Thu, 30 Jun 2016 21:48:47 -0500
Message-ID: <20160701024847.GA1444@rob-hp-laptop>
References: <1467302331-9663-1-git-send-email-wens@csie.org>
 <1467302331-9663-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467302331-9663-2-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 30, 2016 at 11:58:45PM +0800, Chen-Yu Tsai wrote:
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> Changes since v3:
> 
>   - Fixed device node names and added labels.
>   - Added clock output from codec and input to rtc.
> 
> Changes since v2:
> 
>   - Fix interrupt line for ac100_codec in provided example.
> 
> ---
>  Documentation/devicetree/bindings/mfd/ac100.txt | 49 +++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt

Acked-by: Rob Herring <robh@kernel.org>
