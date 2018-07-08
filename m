From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] arm64: hikey960: update idle-states
Date: Sun, 8 Jul 2018 23:15:22 +0200
Message-ID: <948f033f-aef2-4d6c-170d-a1ff2113f258@linaro.org>
References: <1530860246-29072-1-git-send-email-vincent.guittot@linaro.org>
 <20180708140157.GA28878@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180708140157.GA28878@leoy-ThinkPad-X240s>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, Vincent Guittot <vincent.guittot@linaro.org>
Cc: xuwei5@hisilicon.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Leo,


On 08/07/2018 16:01, leo.yan@linaro.org wrote:

[ ... ]

>> A simple test with a task waking up every 11,111ms shows improvement:
> 
> Should s/11,111ms/11.111ms ?

Actually the French notation is ',' for decimal :)

English and French are inverted.

For example one million is noted:

French  : 1.000.000 (or 1 000 000)
English : 1,000,000

And one milli is noted:

French  : 0,001
English : 0.001

:)

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
