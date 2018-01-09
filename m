From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: imx: add timer stop flag to ARM power off state
Date: Tue, 09 Jan 2018 14:22:45 +0100
Message-ID: <ad09e651b944f56ddb167b20cd9995f6@agner.ch>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180109092232.GA26312@b29396-OptiPlex-7040>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180109092232.GA26312@b29396-OptiPlex-7040>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-09 10:22, Dong Aisheng wrote:
> On Tue, Jan 02, 2018 at 05:42:17PM +0100, Stefan Agner wrote:
>> When the CPU is in ARM power off state the ARM architected
>> timers are stopped. The flag is already present in the higher
>> power WAIT mode.
>>
>> This allows to use the ARM generic timer on i.MX 6UL/6ULL SoC.
>> Without the flag the kernel freezes when the timer enters the
>> first time ARM power off mode.
>>
>> Cc: Anson Huang <anson.huang-3arQi8VN3Tc@public.gmane.org>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> It seems ok at my side.
> Did you meet the real issue? If yes, how to reproduce?

Enable the timer added with Patch 5, use a U-Boot with this patchset
applied:
https://www.mail-archive.com/u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org/msg273287.html

And boot... For me it freezed somewhere early during systemd boot phase,
presumably the first time the CPU got into this idle mode.

--
Stefan

> 
> Both mx6sx and mx6ul are using GPT which do not need that flag, suppose
> we should remove it, right?
> Anson can help confirm it.
> 
> Regards
> Dong Aisheng
> 
>> ---
>>  arch/arm/mach-imx/cpuidle-imx6sx.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-imx/cpuidle-imx6sx.c
>> index c5a5c3a70ab1..d0f14b761ff7 100644
>> --- a/arch/arm/mach-imx/cpuidle-imx6sx.c
>> +++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
>> @@ -89,6 +89,7 @@ static struct cpuidle_driver imx6sx_cpuidle_driver = {
>>  			 */
>>  			.exit_latency = 300,
>>  			.target_residency = 500,
>> +			.flags = CPUIDLE_FLAG_TIMER_STOP,
>>  			.enter = imx6sx_enter_wait,
>>  			.name = "LOW-POWER-IDLE",
>>  			.desc = "ARM power off",
>> --
>> 2.15.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
