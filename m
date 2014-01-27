From: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 1/3] mmc: add support for power-on sequencing through
 DT
Date: Mon, 27 Jan 2014 10:43:20 +0200
Message-ID: <52E61C28.1020207@ti.com>
References: <1390190215-22700-1-git-send-email-olof@lixom.net>	<1390190215-22700-2-git-send-email-olof@lixom.net>	<20140120164859.GF15937@n2100.arm.linux.org.uk> <CAOMZO5DdTP0gimwdsBUZK3wXrnUd2FN3w-FszLQkvCwM8gvPpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5DdTP0gimwdsBUZK3wXrnUd2FN3w-FszLQkvCwM8gvPpg@mail.gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, robh+dt@kernel.org, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.ok, Kumar Gala <galak@codeaurora.org>, chris@printf.net
List-Id: devicetree@vger.kernel.org

On 01/24/2014 07:35 PM, Fabio Estevam wrote:
> On Mon, Jan 20, 2014 at 2:48 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>
>> So far so good.  Now, what about this external oscillator which has its
>> own separate power control.  My immediate thought is that this can be
>> specified via card_ext_clock - I would simply need to declare a fixed-rate
>> clock with either a regulator (power switch) controlled via a gpio (which
>> would probably be closer to the hardware) or a gpio as an enable... ah,
>> that requires me to write a common clock driver for that bit since this
>> is currently not modelled by CCF...
>
> Jiry Sarha posted a gpio controlled clock proposal:
> http://www.spinics.net/lists/devicetree/msg16651.html
>

I have not received too much feedback to my patch yet. CCF is a bit new 
territory to me, but I think having a separate stackable clk-gpio would 
be more flexible than having the gpio property implemented in 
clk-fixed-rate.

Anyway, I am happy do it either way as long as I can get a gpio 
-controlled clock implementation into the main line.

Cheers,
Jyri

