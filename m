From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [RFC 2/9] clk: bcm2835: add support for parent selection in DT
Date: Mon, 8 Feb 2016 14:30:39 +0100
Message-ID: <56B8987F.1080701@martin.sperl.org>
References: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
 <1453215100-2382-3-git-send-email-kernel@martin.sperl.org>
 <20160121082642.GB13237@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160121082642.GB13237@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Remi Pommarel <repk@triplefau.lt>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 21.01.2016 09:26, Sascha Hauer wrote:
> Martin,
>
> On Tue, Jan 19, 2016 at 02:51:33PM +0000, kernel@martin.sperl.org wrote:
>> From: Martin Sperl <kernel@martin.sperl.org>
>>
>> Allow for a per clock custom selection of clocks in the device tree.
>>
>> Basic setup in dt looks like this:
>>    clock@BCM2835_CLOCK_PCM {
>>      reg = <BCM2835_CLOCK_PCM>;
>>      parent-clock-names = "xosc", "plld_per", "plla_per", "pll_aux_per";
>>    };
>
> Isn't this the same as the already existing assigned-clock-parents property?
> If yes, that should be used.
It is not 100% identical, as the parent-clock-names do provide ordering
of clocks to be selected, which - under some circumstances may be
beneficial - e.g: when having a parent clock with 500MHz and 1000MHz,
then the higher clock could get given preference by switching ordering...

Also when using:
assigned-clock-parents = <&clk_osc 0>, <&clocks BCM2835_PLLD_PER>;

I get strange indexes passed when calling set_parent - so this would
need to get rewritten to support assigned-clock-parents correctly -
calculating the index on the fly...


