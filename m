From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] Documentation: dt: clock: Add fractional scale
 binding
Date: Mon, 20 Jun 2016 08:18:26 -0500
Message-ID: <20160620131826.GA28774@rob-hp-laptop>
References: <1466120433-30648-1-git-send-email-hotran@apm.com>
 <1466120433-30648-2-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466120433-30648-2-git-send-email-hotran@apm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, lho@apm.com, Duc Dang <dhdang@apm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 16, 2016 at 04:40:32PM -0700, Hoan Tran wrote:
> Add fractional scale clock DTS binding.

We've generally decided against putting this level of clock details into 
DT.

> 
> Signed-off-by: Hoan Tran <hotran@apm.com>
> Signed-off-by: Loc Ho <lho@apm.com>
> ---
>  .../bindings/clock/fractional-scale-clock.txt      | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fractional-scale-clock.txt
