From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 0/5] gnss: sirf: add support for w2sg0004 + lna
Date: Mon, 19 Nov 2018 20:05:23 +0100
Message-ID: <7506654C-2601-4252-BB30-0DE9AF692309@goldelico.com>
References: <20181118215801.12280-1-andreas@kemnade.info> <3487514B-E546-4F11-8C0A-F5B4A8114376@goldelico.com> <20181119194414.1c7d6887@aktux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119194414.1c7d6887@aktux>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

Hi,

> Am 19.11.2018 um 19:44 schrieb Andreas Kemnade <andreas@kemnade.info>:
> 
> Hi,
> 
> On Mon, 19 Nov 2018 09:22:59 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> 
>> Hi,
>> 
>>> Am 18.11.2018 um 22:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
>>> 
>>> Here is another chapter of the story to get gta04 gnss power
>>> management into the mainline kernel.
>>> There is a w2sg0004 without wakeup line in there, so power state
>>> can only be determined indirectly by looking at the serial data lines.
>>> Then there as also an lna which needs to be powered for real gps
>>> reception. That part needs probably more discussion, since it might
>>> be an idea to have it more generalized since it has nothing todo
>>> with the chip itself.  
>> 
>> On the other hand if we follow the "SoC is the spider in the net"
>> way of looking at DTS hierarchy, we have the uart as a child of the
>> SoC and the gnss receiver as a serdev child of the UART. The LNA
>> is even one step more distantly connected to the gnss. So it makes
>> sense to me to have it as a property/reference of the gnss chip's
>> DTS record which is a sibling of the compatible records. So the only
>> place where it can be reasonably processed is the driver.
>> 
> Or the lna is a child of the gnss receiver.

Well, this IMHO would assume the gnss receiver is a bus master...

> The whole thing
> should probably not be overdesigned, but it does not make sense that
> every gnss chip driver has some lna logic.
> Maybe the regulator should just be stored in the struct
> gnss_device and then drivers/gnss/core.c takes care.

Probably yes, but likely not difficult to refactor and generalize later
if users of other chips report a similar need. More important is to
get upstream support for the gta04 with this chip.

BR,
Nikolaus
