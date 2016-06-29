From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM64: arch_timer: Work around QorIQ Erratum
 A-008585
Date: Wed, 29 Jun 2016 09:19:17 +0100
Message-ID: <57738485.4010602@arm.com>
References: <1463114260-8724-1-git-send-email-oss@buserror.net>
 <57737F24.5050906@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57737F24.5050906-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dingtinahong <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/06/16 08:56, Hanjun Guo wrote:
> Hello Scott,
> 
> On 2016/5/13 12:37, Scott Wood wrote:
> [...]
>>  
>> +#ifdef CONFIG_ARM64
>> +static __always_inline void rewrite_tval(const int access,
>> +		unsigned long evt, struct clock_event_device *clk)
>> +{
>> +	u64 cval_old, cval_new;
>> +	int timeout = 200;
>> +
>> +	do {
>> +		cval_old = __arch_counter_get_cntvct();
>> +		arch_timer_reg_write(access, ARCH_TIMER_REG_TVAL, evt, clk);
> 
> For not memory mapped timer, it will call arch_timer_reg_write_cp15() which has
> isb() at the end of arch_timer_reg_write_cp15()...
> 
>> +		cval_new = __arch_counter_get_cntvct();
> 
> So there is isb() between counter retry read, I think it's likely cval_new will
> not be equal with cval_old when the cntvct is correct (time lapse is more than
> one arch timer cycle).

Are you saying that the isb will delay the execution of the read so much
that your timer will always change? Well, if your timer is in the GHz
range, maybe. But that also implies that it is out of spec (it should be
in the 1-50MHz range).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
