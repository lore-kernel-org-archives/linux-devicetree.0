From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: Fwd: [PATCH 7/8] watchdog: davinci: add "clocks" property
Date: Mon, 25 Nov 2013 12:59:45 +0200
Message-ID: <52932DA1.8040204@ti.com>
References: <1383680783-12114-8-git-send-email-ivan.khoronzhuk@ti.com> <527A28E8.4010204@ti.com> <201311231857.47104.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201311231857.47104.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/23/2013 07:57 PM, Arnd Bergmann wrote:
> On Wednesday 06 November 2013, ivan.khoronzhuk wrote:
>> @@ -7,6 +7,10 @@ Required properties:
>>   
>>   - reg : Should contain WDT registers location and length
>>   
>> +- clocks: phandle reference to the controller clock.
>> +         Required only for Keystone arch.
>> +         See clock-bindings.txt
>> +
>>   Optional properties:
>>   
>>   - timeout-sec:         Contains the watchdog timeout in seconds
> 
> I think it should really be listed under "Optional properties" and the
> reference to Keystone removed. Note how the binding would need
> to change otherwise if another platform started to use the clock, which
> is a little silly.
> 
> 	Arnd
> 

Ok, I'll move clocks property under "Optional properties" and describe it
as following:

Optional properties:
- timeout-sec : Contains the watchdog timeout in seconds
- clocks: phandle reference to the controller clock.
	  Needed if platform uses clocks.
	  See clock-bindings.txt

FYI:
The new patch series had been already presented, where the patches
"watchdog: davinci: add "clocks" property" and
"watchdog: davinci: reuse driver for keystone arch" were combined.
http://www.spinics.net/lists/devicetree/msg12542.html

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
