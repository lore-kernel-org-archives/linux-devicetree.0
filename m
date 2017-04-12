From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2] clk: hi6220: Add the hi655x's pmic clock
Date: Wed, 12 Apr 2017 09:00:38 +0100
Message-ID: <20170412080038.kk4vrjhvr3eao26q@dell>
References: <1491683412-12237-1-git-send-email-daniel.lezcano@linaro.org>
 <20170411140613.jvhzsvrxa4evwxjh@dell>
 <20170411211936.GT2078@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170411211936.GT2078@mai>
Sender: linux-clk-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, xuwei5@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Apr 2017, Daniel Lezcano wrote:

> On Tue, Apr 11, 2017 at 03:06:13PM +0100, Lee Jones wrote:
> > On Sat, 08 Apr 2017, Daniel Lezcano wrote:
> > 
> > > The hi655x multi function device is a PMIC providing regulators.
> > > 
> > > The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> > > this clock in order to add it in the hi655x MFD and allow proper wireless
> > > initialization.
> > > 
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > ---
> > > 
> > > Changelog:
> > > 
> > >  V2:
> > >     - Added COMPILE_TEST option, compiled on x86
> > >     - Removed useless parenthesis
> > >     - Used of_clk_hw_simple_get() instead of deref dance
> > >     - Do bailout if the clock-names is not specified
> > >     - Rollback on error
> > >     - Folded mfd line change and binding
> > 
> > Why did you do that?
> 
> I thought as the V1 had comments you would have waited for the V2 and as it was
> trivial enough, it could be folded and picked up via the clk tree via with your
> acked-by.

It's *always* a good idea to keep patches subsystem orthogonal if
at all possible.

> I realize it was not a good idea.
> 
> Do you want to drop it from your tree or shall I resubmit a V3 without the mfd
> change?

The latter please.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
