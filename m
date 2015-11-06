From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH RESEND 0/4] SMP support for Broadcom NSP
Date: Fri, 6 Nov 2015 17:39:43 +0530
Message-ID: <563C9887.5090406@broadcom.com>
References: <1446702681-45339-1-git-send-email-kapilh@broadcom.com>
 <20151105093443.GO8644@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151105093443.GO8644-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/5/2015 3:04 PM, Russell King - ARM Linux wrote:
> On Thu, Nov 05, 2015 at 12:51:17AM -0500, Kapil Hali wrote:
>> Hi,
>>
>> This series adds SMP support for Broadcom's Northstar Plus SoC.
>>
>> There are similar SMP enablement methods for many ARMv7 bsed SoCs.
>> BCM NSP SoC, has a typical such mechanism - after power-on, the
>> secondary core is held in a standby state, primary core provides a
>> startup address for the secondary core and wakes it up. Booting of
>> the secondary core is serialized using pen_release global variable.
> 
> Why do you need the pen_release stuff?  The above implies that you
> have only one secondary core, and you can control when it comes out
> of standby state.
> 
We can initiate a wake-up of the secondary core. I tested the changes
without pen_release method and it works. However, as I understand, I
think there is no other way for the primary core to know if the 
secondary core has come out of standby state other than pen_release
mechanism. When there is no other method available, will not 
smp_boot_secondary() always return successful wake-up of the
secondary core?

> Please, don't assume that the pen_release stuff is any kind of recommended
> or standardised system.  It isn't.  It's a hack for ARMs evaluation
> platforms.
> 
Got it. As pen_release is forbidden, I will change the SMP mechanism
to remove pen_release method in the new patch set.

Thanks,
Kapil

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
