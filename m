Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 17:29:48 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clocks: add APB RTC gate for SC9860
Message-ID: <20180218232948.rgk6j4m5whmz5j7l@rob-hp-laptop>
References: <1518169691-14870-1-git-send-email-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518169691-14870-1-git-send-email-zhang.lyra@gmail.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 09, 2018 at 05:48:10PM +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> 
> Added index of RTC gate clocks which are used by some devices on aon
> area of SC9860, for example the Watchdog timer.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
> ---
>  include/dt-bindings/clock/sprd,sc9860-clk.h | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
