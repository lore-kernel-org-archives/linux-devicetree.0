From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V10 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI
 Flash Controller.
Date: Thu, 26 May 2016 01:08:34 +0200
Message-ID: <57463072.4080706@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de>	 <1452486886-8049-2-git-send-email-marex@denx.de>	 <1463097635.9103.301.camel@rtred1test09.kymeta.local>	 <57351ECE.2020009@denx.de> <1463172208.9103.313.camel@rtred1test09.kymeta.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463172208.9103.313.camel-dVGoCQn2UwS33l2LyG1otL1RWLrjA2wiZkel5v8DVj8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trent Piepho <tpiepho-KTxT7QYAYfgCx7yrEBmKXg@public.gmane.org>
Cc: "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "R, Vignesh" <vigneshr-l0cyMroinI0@public.gmane.org>, Yves Vandervennet <yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/13/2016 10:43 PM, Trent Piepho wrote:
> On Fri, 2016-05-13 at 02:24 +0200, Marek Vasut wrote:
>> On 05/13/2016 02:00 AM, Trent Piepho wrote:
>>> On Mon, 2016-01-11 at 05:34 +0100, Marek Vasut wrote:
>>>> From: Graham Moore <grmoore-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org>
>>>>
>>>> Add support for the Cadence QSPI controller. This controller is
>>>> present in the Altera SoCFPGA SoCs and this driver has been tested
>>>> on the Cyclone V SoC.
>>>
>>> I'm trying to use this driver the Alaric Devkit for Altera's Arria10
>>> SoC.  It's not working so far.  In the course of trying to debug it,
>>> I've found a few things with the driver in the socfpga-4.1-ltsi branch.
>>
>> So are you trying to debug this driver or some other out-of-tree driver?
>> btw. I pushed the latest version here:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=next/cadence-qspi
> 
> I'm trying to use the out of tree driver from Altera's latest kernel,
> from here:
> https://github.com/altera-opensource/linux-socfpga/tree/socfpga-4.4
> 
> But it's not a totally different driver, it's just an older version of
> this driver.  I'm thinking of porting in this version since I think it's
> much improved (after V11 one would hope so).  Really, Altera should
> update their supported kernel with this code.

I'm quite sure they're doing their best and really, they _are_ better
than most vendors.

> Comments about what's on your branch.
> 
> Commit "ARM: socfpga: Add Candence QSPI controller DT node" only
> adds the node for Cyclone 5.  This same DT node should also be added to
> the socfpga_arria10.dtsi file.
> 
I don't have A10 devkit (yet), but feel free to send a patch once this
hits mainline if you can test it on A10. I updated the commit message
until then.

The latest stuff is pushed here:
http://git.kernel.org/cgit/linux/kernel/git/marex/linux-2.6.git/log/?h=korg/next/cadence-qspi-v12

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
