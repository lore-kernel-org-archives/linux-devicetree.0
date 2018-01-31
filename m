From: Yixun Lan <yixun.lan@amlogic.com>
Subject: Re: [PATCH v3 0/5] ARM64: dts: meson-axg: UART DT updates
Date: Wed, 31 Jan 2018 10:25:45 +0800
Message-ID: <8990554d-e995-e432-8f50-3b247f71b0fd@amlogic.com>
References: <20180111023401.125658-1-yixun.lan@amlogic.com>
 <7hr2q6c2r4.fsf@baylibre.com>
 <CAOi56cW4ufsegpy7heK1+pCxvZ2gz5Lf3dkUgxkZCgMq5oBzSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOi56cW4ufsegpy7heK1+pCxvZ2gz5Lf3dkUgxkZCgMq5oBzSA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: yixun.lan@amlogic.com, devicetree <devicetree@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org



On 01/31/18 08:22, Kevin Hilman wrote:
> On Tue, Jan 30, 2018 at 4:04 PM, Kevin Hilman <khilman@baylibre.com> wrote:
>> Yixun Lan <yixun.lan@amlogic.com> writes:
>>
>>> HI Kevin
>>>  These are the UART DT updates for the Meson-AXG platform.
>>>
>>>  The patch 1 is a general fix.
>>> Other patches are about adding clock & pinctrl info, then using them.
>>> Last patch enable UART_A which connect to a BT module on the S400 board.
>>
>> Applied to v4.16/dt64,
> 
> Oops, I meant v4.17.
> 

Hi Kevin
 I should warn you about the patch 3 [1], it actually depend on the gpio
renaming patch [2]

 I'm still waiting Linus to take patch [2], then update according
(or you could help amend the patch? it's simply a
's/uart_ao_b_gpioz/uart_ao_b_z/g)

Yixun



[1] [PATCH v3 3/5] ARM64: dts: meson-axg: uart: Add the pinctrl info
description

http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006096.html


[2] [PATCH] pinctrl: meson-axg: adjust uart_ao_b pin group naming
http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006201.html
