From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V2] clk: hi6220: Add the hi655x's pmic clock
Date: Tue, 11 Apr 2017 15:06:13 +0100
Message-ID: <20170411140613.jvhzsvrxa4evwxjh@dell>
References: <1491683412-12237-1-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491683412-12237-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, xuwei5@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 08 Apr 2017, Daniel Lezcano wrote:

> The hi655x multi function device is a PMIC providing regulators.
> 
> The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> this clock in order to add it in the hi655x MFD and allow proper wireless
> initialization.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
> 
> Changelog:
> 
>  V2:
>     - Added COMPILE_TEST option, compiled on x86
>     - Removed useless parenthesis
>     - Used of_clk_hw_simple_get() instead of deref dance
>     - Do bailout if the clock-names is not specified
>     - Rollback on error
>     - Folded mfd line change and binding

Why did you do that?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
