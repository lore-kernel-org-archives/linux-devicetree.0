From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 2/4] clk: bcm2835: Add binding docs for the new
 platform clock driver.
Date: Mon, 21 Sep 2015 19:01:53 -0700
Message-ID: <5600B691.9000401@wwwdotorg.org>
References: <1441922305-2298-1-git-send-email-eric@anholt.net>
 <1441922305-2298-2-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1441922305-2298-2-git-send-email-eric@anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/10/2015 02:58 PM, Eric Anholt wrote:
> Previously we've only supported a few fixed clocks based on
> assumptions about how the firmware sets up the clocks, but this
> binding will let us control the actual (audio power domain) clock
> manager.

Patches 1 and 2,
Acked-by: Stephen Warren <swarren@wwwdotorg.org>
