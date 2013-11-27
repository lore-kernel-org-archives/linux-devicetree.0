From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v3 1/6] watchdog: davinci: change driver to use WDT core
Date: Wed, 27 Nov 2013 12:03:01 +0200
Message-ID: <5295C355.6000604@ti.com>
References: <1385388285-10553-1-git-send-email-ivan.khoronzhuk@ti.com>
 <1385388285-10553-2-git-send-email-ivan.khoronzhuk@ti.com>
 <5295758C.2030907@ti.com> <52959966.7000509@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52959966.7000509@roeck-us.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>, Sekhar Nori <nsekhar@ti.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux-watchdog@vger.kernel.org, Pawel Moll <Pawel.Moll@arm.com>, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, wim@iguana.be, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/27/2013 09:04 AM, Guenter Roeck wrote:
> On 11/26/2013 08:31 PM, Sekhar Nori wrote:
>> On Monday 25 November 2013 07:34 PM, Ivan Khoronzhuk wrote:
>>> To reduce code duplicate and increase code readability use WDT core
>>> code to handle WDT interface.
>>>
>>> Remove io_lock as the WDT core uses mutex to lock each wdt device.
>>> Remove wdt_state as the WDT core tracks state with its own variable.
>>>
>>> The watchdog_init_timeout() can read timeout value from timeout-sec
>>> property if the passed value is out of bounds. The heartbeat is
>>> initialized in next way. If heartbeat is not set thought module
>>> parameter, try to read it's value from WDT node timeout-sec property.
>>> If node has no one, use default value.
>>>
>>> The heartbeat is hold in wdd->timeout by WDT core, so use it in
>>> order to set timeout period.
>>>
>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>>> Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> So this still causes a regression because the clk_get()
>> fails due to the changed device name. Please fold this
>> patch in (tested on DM365, compiled on rest).
>>
>> Also, the change in device name (while needed) does not seem
>> to be related to usage of wdt core. Can you may be split
>> that change into a separate patch?
>>
>
> Given all the trouble with it, I think that would be a good idea.
>
> Guenter
>

Ok, I'll split it for convenience.

-- 
Regards,
Ivan Khoronzhuk
