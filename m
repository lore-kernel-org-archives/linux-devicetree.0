From: Graham Moore <grmoore@opensource.altera.com>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 14 Mar 2016 13:17:08 -0500
Message-ID: <56E70024.3080205@opensource.altera.com>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com>
 <201602081627.57666.marex@denx.de> <56BB60F1.9070306@opensource.altera.com>
 <56BB629D.2040209@denx.de> <56E1DF45.901@opensource.altera.com>
 <56E1E2C8.8030405@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <56E1E2C8.8030405@denx.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>
Cc: Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alan Tull <atull@opensource.altera.com>, Yves Vandervennet <yvanderv@opensource.altera.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

On 03/10/2016 03:10 PM, Marek Vasut wrote:
> On 03/10/2016 09:55 PM, Graham Moore wrote:
>> On 02/10/2016 10:17 AM, Marek Vasut wrote:
>>
>> [...]
>>
>>> All right, so we will just add a special property or compat string for
>>> the TI SoC. But we need to get this driver mainlined first :)
>>>
>>
>> Hi Marek,
>
> Hi Graham,
>
>> How's that mainlining going?  You probably noticed this patch needed
>> some refactoring for 4.4.  In the course of testing, we realized this
>> driver needs to enable its clock.
>>
>> Do you have a 4.4 or later version in your tree?  I'd like to add the
>> clock enabling.
>
> Still waiting for the patches from Cyrille to go in, so this patch is
> stuck. I just checked next and some of them made it, but there are more
> which didn't. I have a V10 of this patch , it is in the ML already [1],
> so try playing around with that.
>
> I have linux 4.4 branch with all the necessary patches backported and/or
> applied if you'd be interested in that, but I do my development on
> linux-next .
>
> What sort of clock patch are you missing ?
>

The clock needs to be enabled, after the devm_clk_get().  I've added a 
clk_prepare_enable() there, and also clk_disable_unprepare() in the 
remove function.

That ML patch won't apply to any tree I have, 4.4, 4.5, linux-next, etc. 
  Maybe I'll just wait until it's in linux-next.

-Graham


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
