From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v5 0/5] Update Davinci watchdog driver
Date: Thu, 26 Dec 2013 12:55:02 -0500
Message-ID: <52BC6D76.7000400@ti.com>
References: <1386185970-14488-1-git-send-email-ivan.khoronzhuk@ti.com>
 <52A5EF6B.6060700@ti.com> <52ACAED4.7000305@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <52ACAED4.7000305@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: wim@iguana.be, Guenter Roeck <linux@roeck-us.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux-watchdog@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Saturday 14 December 2013 02:17 PM, Santosh Shilimkar wrote:
> Wim,
> 
> On Monday 09 December 2013 11:27 AM, Santosh Shilimkar wrote:
>> Wim,
>>
>> On Wednesday 04 December 2013 02:39 PM, Ivan Khoronzhuk wrote:
>>> These patches are intended to update Davinci watchdog to use WDT core
>>> and reuse driver for keystone arch, because Keystone uses the similar
>>> IP like Davinci.
>>>
>>
>> [..]
>>
>>> v4..v5:
>>> - watchdog: davinci: change driver to use WDT core
>>> 	switched off CONFIG_WATCHDOG_NOWAYOUT option
>>>
>> Can you please apply the series to your watchdog tree ?
>> Do let me know if you want us to prepare a git branch
>> to pull from.
>>
> ping..
> 
I haven't heard anything on this yet from you Wim.

Guenter,
I have seen you actively reviewing the $subject patch series.
Will you be able to pick the series up for 3.14 merge window
considering almost no response from Wim so far on it ?

Regards,
Santosh
