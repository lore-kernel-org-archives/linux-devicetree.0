From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v4 0/5] Update Davinci watchdog driver
Date: Fri, 29 Nov 2013 09:57:29 -0500
Message-ID: <5298AB59.7020506@ti.com>
References: <1385556508-3935-1-git-send-email-ivan.khoronzhuk@ti.com> <5298943D.8010608@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5298943D.8010608@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>, wim@iguana.be, nsekhar@ti.com
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org
List-Id: devicetree@vger.kernel.org

On Friday 29 November 2013 08:18 AM, Grygorii Strashko wrote:
> Hi Sekhar,
> 
> On 11/27/2013 02:48 PM, Ivan Khoronzhuk wrote:
>> These patches are intended to update Davinci watchdog to use WDT core
>> and reuse driver for keystone arch, because Keystone uses the similar
>> IP like Davinci.
>>
>> See Documentation:
>> Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
>> Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf
>>
>> Also:
>>   - improved to support GET_TIMELEFT option.
>>   - added "clocks" and "timeout-sec" properties to DT.
> 
> Do you have any additional comments to this series?
> 
> By the way patch "[PATCH] watchdog: davinci: rename platform driver to davinci-wdt"
> https://lkml.org/lkml/2013/11/27/201 can be applied as before as after this series
> without conflicts.
> 
Thats good then and probably the series can go via watchdog tree.
In either way, it will be good to know who is queuing up the series for 3.14

Regards,
Santosh
