From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 2/2] ARM64: dts: hi6220-hikey: Add clock binding for
 the pmic mfd
Date: Mon, 24 Apr 2017 09:59:44 +0100
Message-ID: <20170424085944.aa5dsc4g6bwm5rgi@dell>
References: <1492449567-31399-1-git-send-email-daniel.lezcano@linaro.org>
 <1492449567-31399-2-git-send-email-daniel.lezcano@linaro.org>
 <20170422020233.GA7065@codeaurora.org>
 <370c36f9-e6fc-416c-776b-edc1e42d7ddc@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <370c36f9-e6fc-416c-776b-edc1e42d7ddc@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com, xuwei5@hisilicon.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, 22 Apr 2017, Daniel Lezcano wrote:

> On 22/04/2017 04:02, Stephen Boyd wrote:
> > On 04/17, Daniel Lezcano wrote:
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt | 6 ++++++
> >>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts             | 1 +
> >>  2 files changed, 7 insertions(+)
> >>
> > 
> > I take it this goes through arm-soc? Not sure why I'm on To:
> > line.
> 
> Probably it should go through Lee's tree.

Unlikely.

The document and the DTS change should really have gone separately,
but to save you from having to mess around so close to the merge window:

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
