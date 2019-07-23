From: Evgeny Kolesnikov <evgenyz@gmail.com>
Subject: Re: [PATCH 0/5] Add support for WD MyCloud EX2 Ultra (+ versatile
 UART-based restart/poweroff drivers)
Date: Tue, 23 Jul 2019 19:48:49 +0200
Message-ID: <c2ffe662-6975-351b-87b8-af760984ef4d@gmail.com>
References: <cover.1563822216.git.evgenyz@gmail.com>
 <20190723015631.GI8972@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723015631.GI8972@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On 23/07/2019 03:56, Andrew Lunn wrote:
> On Mon, Jul 22, 2019 at 09:53:00PM +0200, Evgeny Kolesnikov wrote:
>>
>> The difference between uart-poweroff and qnap-poweroff is small, but important:
>> uart-poweroff is able to send to an MCU a command of arbitrary length, and the command
>> itself is defined in a DTS file for a specific device/board, thus making this driver
>> applicable to wider range of devices.
> 
> There is a lot of replicated code here, and in the original
> qnap-poweroff.c driver. Please consolidate it by extending the current
> driver. It should be easy to add a new compatible string, and turn
> power_off_cfg.cmd into an array.

Hi, Andrew.

I've considered extending qnap driver, but I have some doubts about this 
approach.

First of all there is only a poweroff counterpart. As there is no
qnap-restart driver, what should I do with uart-restart? Is it OK to 
have xxx-restart-poweroff driver (never saw anything like that)?

While I can add cmd as a parameter to qnap driver (having it converted
into an array) it should be optional as original qnap relies on two 
hardcoded values for its devices. And having a non-qnap device with this 
driver in DT without defined cmd would not make any sense. It feels 
kinda ugly.

Wouldn't it be more fitting to have these two generic drivers and then 
retire old qnap driver while moving everything that uses it to the new one?

Thanks for the review.

EK.
