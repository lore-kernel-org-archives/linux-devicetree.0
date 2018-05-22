From: Sekhar Nori <nsekhar@ti.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v11_00/27]_ARM:_davinci:_convert_to_common_clo?=
 =?UTF-8?B?Y2sgZnJhbWV3b3Jr4oCL?=
Date: Tue, 22 May 2018 15:08:04 +0530
Message-ID: <850a0ec9-53aa-02a5-ecbd-e068b13b2764@ti.com>
References: <20180518164829.27052-1-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180518164829.27052-1-david@lechnology.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Friday 18 May 2018 10:18 PM, David Lechner wrote:
> This series converts mach-davinci to use the common clock framework.
> 
> The series works like this, the first 3 patches fix some issues with the clock
> drivers that have already been accepted into the mainline kernel.
> 
> Then, starting with "ARM: davinci: pass clock as parameter to
> davinci_timer_init()", we get the mach code ready for the switch by adding the
> code needed for the new clock drivers and adding #ifndef CONFIG_COMMON_CLK
> around the legacy clocks so that we can switch easily between the old and the
> new.
> 
> "ARM: davinci: switch to common clock framework" actually flips the switch
> to start using the new clock drivers. Then the next 8 patches remove all
> of the old clock code.
> 
> The final four patches add device tree clock support to the one SoC that
> supports it.
> 
> This series has been tested on TI OMAP-L138 LCDK (both device tree and legacy
> board file).

If you do end up sending a v12, you can leave out the mach-davinci
portions unless there are any changes you need to make. I will pick them
up from this series once the driver dependencies are merged.

I do hope the drivers/clk/* changes can be merged from v4.18.

Thanks,
Sekhar
