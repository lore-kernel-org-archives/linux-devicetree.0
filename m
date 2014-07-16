From: Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
Subject: Re: [PATCH] drivers/rtc/rtc-isl12022.c: Device tree support
Date: Wed, 16 Jul 2014 19:35:21 +1000
Message-ID: <53C64759.8020505@vrt.com.au>
References: <1405477705-16885-2-git-send-email-stuartl@vrt.com.au> <20140716085904.GA26951@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140716085904.GA26951@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Roman Fietze <roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,
On 16/07/14 18:59, Mark Rutland wrote:
> On Wed, Jul 16, 2014 at 03:28:25AM +0100, Stuart Longland wrote:
>> Add some support for configuring isl12020/isl12022 devices using the
>> Device Tree blob.
>>
>> Signed-off-by: Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
> 
> Please document this as with isl,isl12057, in
> Documentation/devicetree/bindings/i2c/trivial-devices.txt
> 
> The string itself looks fine.

No problems.  I'll do this shortly.

>> +#ifdef CONFIG_OF
>> +		.of_match_table = of_match_ptr(isl12022_dt_match),
>> +#endif
> 
> You can drop the ifdef here, of_match_ptr(x) is NULL if !CONFIG_OF.

Ahh okay, I wasn't sure how of_match_ptr worked, so I thought I'd play
it safe.  A revised patch is coming right up.

Regards,
-- 
Stuart Longland
Systems Engineer
     _ ___
\  /|_) |                           T: +61 7 3535 9619
 \/ | \ |     38b Douglas Street    F: +61 7 3535 9699
   SYSTEMS    Milton QLD 4064       http://www.vrt.com.au


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
