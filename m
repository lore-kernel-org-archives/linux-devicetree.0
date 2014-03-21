From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: socfpga: add gpio pieces
Date: Fri, 21 Mar 2014 17:06:19 -0500
Message-ID: <CANk1AXRTaCvFn8yemFEq8c2g=zHzz-Kz_B4XgJsSvSjKsu9RrA@mail.gmail.com>
References: <1395345324-18299-1-git-send-email-bigeasy@linutronix.de>
	<1395345324-18299-4-git-send-email-bigeasy@linutronix.de>
	<20140321172434.GB3998@book.gsilab.sittig.org>
	<532C8E8B.9080406@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <532C8E8B.9080406@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Gerhard Sittig <gsi@denx.de>, Alan Tull <atull@altera.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 21, 2014 at 2:10 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> On 03/21/2014 06:24 PM, Gerhard Sittig wrote:
>> On Thu, Mar 20, 2014 at 20:55 +0100, Sebastian Andrzej Siewior wrote:
>>>
>>> The cycloneV has three gpio controllers, each one with 29 gpios. This patch
>>> adds the three controller with the gpio driver which is now sitting the
>>> gpio tree.
>>
>> The third bank should have 27 pins, only the first two have 29.
>
> It is not a bank it is a complete controller. Why 27 pins? The
> reference manual says that there register 0...28.

Hi Sebastian,

The ref manual is wrong.  It is 27.  The last two aren't pinned out.

Alan Tull
aka
delicious quinoa
