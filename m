Return-Path: <robherring2@gmail.com>
Date: Sun, 9 Jul 2017 19:51:16 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] clk: si5351: expand compatible strings in documentation
Message-ID: <20170710005116.lyv4hjzadv5h6t6k@rob-hp-laptop>
References: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498743105-29078-1-git-send-email-brandon.streiff@ni.com>
To: Brandon Streiff <brandon.streiff@ni.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 29, 2017 at 08:31:45AM -0500, Brandon Streiff wrote:
> checkpatch.pl doesn't know how to expand "silabs,si5351{a,a-msop,b,c}"
> and so generates warnings about si5351-compatible devices appearing to
> be un-documented. Resolve this by documenting the compatible options
> supported by the clk-si5351 driver individually.
> 
> Signed-off-by: Brandon Streiff <brandon.streiff@ni.com>
> ---
>  Documentation/devicetree/bindings/clock/silabs,si5351.txt | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied, thanks.

Rob
