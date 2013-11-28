From: "ivan.khoronzhuk" <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH] watchdog: davinci: rename platform driver to davinci-wdt
Date: Thu, 28 Nov 2013 12:52:40 +0200
Message-ID: <52972078.3090408@ti.com>
References: <1385559113-4354-1-git-send-email-ivan.khoronzhuk@ti.com>
 <5295FB0E.4070406@ti.com> <52961665.3060309@roeck-us.net>
 <5296DCD6.3030002@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5296DCD6.3030002@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>, Guenter Roeck <linux@roeck-us.net>, Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux-watchdog@vger.kernel.org, Pawel.Moll@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, galak@kernel.crashing.org, rob.herring@calxeda.com, linux-kernel@vger.kernel.org, wim@iguana.be, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/28/2013 08:04 AM, Sekhar Nori wrote:
> On Wednesday 27 November 2013 09:27 PM, Guenter Roeck wrote:
>> On 11/27/2013 06:00 AM, Sekhar Nori wrote:
>>> On Wednesday 27 November 2013 07:01 PM, Ivan Khoronzhuk wrote:
>>>> As we switch to use the watchdog core which permits more than one
>>>> active watchdog in the system, rename platform driver to
>>>> "davinci-wdt" to be identifiable.
>>>>
>>>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
>>>
>>> Looks good to me. Since bulk of this patch touches mach-davinci, I would
>>> like to take this through my tree to avoid conflicts with other
>>> mach-davinci patches I accept.
>>>
>>
>> Good idea, and makes sense.
>
> Added to v3.14/soc with your Reviewed-by
>
> Thanks,
> Sekhar
>
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/nsekhar/linux-davinci.git/log/?h=v3.14/soc
>

Thanks, Sekhar.
What about other WDT patches, are you OK with them?
https://lkml.org/lkml/2013/11/27/164

-- 
Regards,
Ivan Khoronzhuk
