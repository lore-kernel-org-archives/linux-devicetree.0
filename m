From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 0/5] Add CPU clock support for Armada 7K/8K
Date: Sun, 16 Dec 2018 10:36:46 +0100
Message-ID: <87h8fdke35.fsf@bootlin.com>
References: <20181206171516.15891-1-gregory.clement@bootlin.com>
        <154482536298.19322.16460657058404864070@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154482536298.19322.16460657058404864070@swboyd.mtv.corp.google.com>
        (Stephen Boyd's message of "Fri, 14 Dec 2018 14:09:22 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,
 
 On ven., déc. 14 2018, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Gregory CLEMENT (2018-12-06 09:15:11)
>> Hello,
>> 
>> This is the second version of a series allowing to manage the cpu
>> clock for Armada 7K/8K. For these SoCs, the CPUs share the same clock
>> by cluster, so actually the clock management is done at cluster level.
>> 
>> As for the other Armada 7K/8K clocks it is possible to have multiple
>> AP so here again we need to have unique name: the purpose of the second
>> patch is to share a common code which will be used in 3 drivers.
>> 
>> The last 2 patch enable the driver at dt and platform level and will
>> be applied through the mvebu subsystem.
>  
> The binding "marvell,ap806-cpu-clock" is not documented. It was in the
> previous series but then got dropped from this one? Why?

I made a mistake and start my git-format on the wrong commit, I am
sending a new series right now with this missing patch.

Gregory

>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
