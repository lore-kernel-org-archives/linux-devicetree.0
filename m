From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 08/11] ARM: dts: sun8i-a23-q8-tablet: Drop pinmux setting
 for codec PA gpio
Date: Thu, 26 Jan 2017 19:15:54 +0800
Message-ID: <CAGb2v64GUbhzjRdtgBf1ej77tJwMqXZJUHavt=MhqXrWN9BisQ@mail.gmail.com>
References: <20170124023230.3990-1-wens@csie.org> <20170124023230.3990-9-wens@csie.org>
 <20170126103813.6k6zqnjvguiphs5s@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170126103813.6k6zqnjvguiphs5s@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 26, 2017 at 6:38 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> On Tue, Jan 24, 2017 at 10:32:27AM +0800, Chen-Yu Tsai wrote:
>> We are moving towards handling GPIO pinmux settings that don't require
>> extra bias or drive strength settings to use the GPIO bindings only.
>>
>> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> ---
>>  arch/arm/boot/dts/sun8i-a23-q8-tablet.dts | 10 ----------
>>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c      | 24 ++++++++++++------------
>
> That diff looks suspicious :)

Squashed in a fix against your updated sun5i CCU patches into
the wrong one. :/

> (and the patch for which you wrote a commit log for
> doesn't have anything to do in this serie)

Correct. This is a prerequisite to the pinctrl header removal
patch you just merged. This patch removes the last in-tree
usage of macros from said header file.

ChenYu

> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
