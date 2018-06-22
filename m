From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/6] clk: meson: axg: add audio clock controller
 support
Date: Fri, 22 Jun 2018 13:34:06 +0200
Message-ID: <1529667246.2900.6.camel@baylibre.com>
References: <20180522163457.13834-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180522163457.13834-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-05-22 at 18:34 +0200, Jerome Brunet wrote:
> The purpose of this patchset is to add support for the clock controller
> dedicated to the audio subsystem found on A113 based SoCs
> 
> The series depends on the CLK_MUX_ROUND_CLOSEST fixes [merged in clk-next]
> and the duty cycle support [1] making their way into CCF.
> 
> First patch is a clean-up of the meson clk Kconfig.
> Then, there is 3 clock provider drivers for clocks found in the audio
> The last 3 are for the clock controller itself.
> 
> Changes since v1: [2]
>  * Rebase clk-meson's next/drivers
>  * Correct typo in documentation and squash DT patches
> 
> [1]: https://lkml.kernel.org/r/20180420211141.28929-1-jbrunet@baylibre.com
> [2]: https://lkml.kernel.org/r/20180425163304.10852-1-jbrunet@baylibre.com
> 
> Jerome Brunet (6):
>   clk: meson: clean-up meson clock configuration
>   clk: meson: add clk-phase clock driver
>   clk: meson: add triple phase clock driver
>   clk: meson: add axg audio sclk divider driver
>   dt-bindings: clock: add meson axg audio clock controller bindings
>   clk: meson: axg: add the audio clock controller driver

Applied for next on top of mike's clk-core-duty-cycle branch.
