From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 1/2] clk: pxa: export 32kHz PLL
Date: Wed, 27 Jun 2018 10:50:23 +0200
Message-ID: <87vaa4lik0.fsf@belgarion.home>
References: <20180626200308.16192-1-robert.jarzmik@free.fr>
        <201806270855.xvEN3vnK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201806270855.xvEN3vnK%fengguang.wu@intel.com> (kbuild test
        robot's message of "Wed, 27 Jun 2018 08:16:16 +0800")
Sender: linux-kernel-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

kbuild test robot <lkp@intel.com> writes:

> All errors (new ones prefixed by >>):
>
>    drivers/clk/pxa/clk-pxa25x.c: In function 'pxa25x_register_plls':
>>> drivers/clk/pxa/clk-pxa25x.c:298:17: error: expected ')' before ';' token
>               32768);
>                     ^
>>> drivers/clk/pxa/clk-pxa25x.c:304:1: error: expected ';' before '}' token
>     }
Meh a missing closing parenthesis ... I'll send a v3.

Cheers.

--
Robert
