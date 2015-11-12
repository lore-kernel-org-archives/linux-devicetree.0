From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Thu, 12 Nov 2015 18:07:13 +0530
Message-ID: <564487F9.5000308@broadcom.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
 <563E6FC7.6070700@gmail.com> <20151108173116.GV8644@n2100.arm.linux.org.uk>
 <56421540.1020303@broadcom.com>
 <20151110162553.GH8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151110162553.GH8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

On 11/10/2015 9:55 PM, Russell King - ARM Linux wrote:
> On Tue, Nov 10, 2015 at 09:33:12PM +0530, Kapil Hali wrote:
>> Hi Russel,
> 
> Wrong.  Look at my name as sent in the From: and as quoted in the very
> next line.  As far as I'm concerned (and I don't care what other people
> say) it's disrespectful to spell people's names incorrectly.
> 
I am sincerely apologetic about it. It was a deviation that will not 
repeat again. 
>> It was clear the very first time itself as pointed out by you and the 
>> lead developers and hence the change was readily sent in the very next
>> patch set. I didn't change a comment in this patch, which is misleading 
>> about the SMP enable-method used in the patch set, it is my mistake and   
>> I apologies for the same. I will change it and send the next patch set.
> 
> Thanks.
> 
>> Also, before sending out the patch set, I had asked for a clarification 
>> about the method: https://lkml.org/lkml/2015/11/6/234
> 
> Sorry, I don't read every single email irrespective of how it's marked.
> There's way too much email, and way too much mail with improperly
> classified recipient lists to be able to usefully sort this mail.
> (If you do the math, the email rate during a 12 hour working day from
> just linux-arm-kernel is one email every 2.5 minutes, assuming 300 emails
> a day.  It takes way longer than that to compose a proper reply to an
> email - I've spent around 15 minutes on this one alone.  Hence, if I'm
> busy, I more or less totally ignore email now, and rarely bother to
> "catch up" with missed emails.)
> 
>> For my understanding, I am repeating my query- In case of simple method of 
>> waking up secondary core, smp_boot_secondary() will always return success 
>> indicating secondary core successfully started. I understand that in 
>> __cpu_up(), primary core waits for completion till secondary core comes 
>> online or time outs. However, is it appropriate to return successful start 
>> of secondary core without knowing if it really did?
> 
> Yes, because all that your smp_boot_secondary() should be doing is
> trying to start the core.  If you encounter an error trying to do so,
> that's what the error return is for.
> 
> If you just set a bit somewhere to tell the hardware to release the
> secondary core's reset, then if you set the bit and return success,
> that's prefectly acceptable.  The core ARM SMP code will then wait
> up to one second for the secondary core to become known to the kernel
> before declaring that the CPU failed to come online.
> 
> If it fails to appear, we assume that it will never appear - and
> actually at that point the system is in an unknown state: if the
> secondary CPU crashed during its boot, it could start scribbling
> into memory or touching devices in an unpredictable way: the only
> sane answer is to reboot the whole system to ensure that it's back
> to a known good state.  Hence why we don't provide any cleanup at
> the point of a failed secondary CPU (I've been debating about
> tainting the kernel at that point, so we know when things have
> gone bad.)
> 
> Hope this helps.
> 
Surely it has helped and many thanks for your detailed explanation.

Thanks,
Kapil Hali
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
