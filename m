From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Date: Mon, 25 Sep 2017 18:29:38 +0800
Message-ID: <1C624335-37C2-4F22-BE78-A94F26D1D248@aosc.io>
References: <20170923001531.14285-1-icenowy@aosc.io> <20170925101027.lghnnll4h6inreqm@flea.home> <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io> <20170925102744.qixfwlheeimemhcf@flea.home>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170925102744.qixfwlheeimemhcf@flea.home>
Sender: linux-clk-owner@vger.kernel.org
To: maxime.ripard@free-electrons.comMaxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org



于 2017年9月25日 GMT+08:00 下午6:27:44, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
>> 于 2017年9月25日 GMT+08:00 下午6:10:27, Maxime Ripard
><maxime.ripard@free-electrons.com> 写到:
>> >Hi,
>> >
>> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
>> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
>> >> 
>> >> As the thermal sensor driver is not yet implemented and some
>boards
>> >> have still no AXP PMIC support, now only two OPPs are present --
>> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>> >> 
>> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining
>patches
>> >> set up the device tree bits of the DVFS on Pine64.
>> >
>> >How has this been tested?
>> >
>> >What tasks did you run, with what governor, etc...
>> 
>> I only tested manual frequency switching between 648MHz and
>> 816MHz, and tested the PLL stuck issue by change the OPPs to
>> some random value.
>
>Ideally, we should test that it's actually reliable. Poorly chosen
>OPPs might lead to corrupt data that you might not get before a while.

These are OPPs from the official sys_config.fex .

>
>Please test using:
>https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufreq_voltage.2Ffrequency_settings
>
>And post the report.
>
>Maxime
