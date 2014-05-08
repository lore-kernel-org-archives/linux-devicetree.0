From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 7/7] ARM: sunxi: dt: add PRCM clk and reset controller
 subdevices
Date: Thu, 08 May 2014 22:08:17 +0200
Message-ID: <536BE431.50007@free-electrons.com>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com> <1399483554-8824-8-git-send-email-boris.brezillon@free-electrons.com> <20140508031700.GO7047@lukather> <CAGb2v664vFwezKVp+C1UYdsUktRhrZDxjsyf9L=kwVHGCUV=HA@mail.gmail.com> <20140508142934.GV7047@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140508142934.GV7047@lukather>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin <kevin@allwinnertech.com>, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, dev <dev@linux-sunxi.org>
List-Id: devicetree@vger.kernel.org


On 08/05/2014 16:29, Maxime Ripard wrote:
> On Thu, May 08, 2014 at 11:40:59AM +0800, Chen-Yu Tsai wrote:
>>>> +                     apb0_gates: apb0_gates_clk {
>>>> +                             compatible = "allwinner,sun6i-a31-apb0-gates-clk";
>>>> +                             #clock-cells = <1>;
>>>> +                             clocks = <&apb0>;
>>>> +                             clock-output-names = "apb0_pio", "apb0_ir",
>>>> +                                             "apb0_timer01", "apb0_p2wi",
>>> timer01 ? is this a typo?
>> A23 manual lists the clock gate as "r_timer0_1", so I put the name on the wiki.
>> Allwinner sun6i code uses "r_tmr" or just "tmr". I see no problem naming this
>> clock output as "apb0_timer" though.
> Yep, it seems better.

Fair enough, I'll change the name for the next version.

>
> Maxime
>

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

